*
* L'égérie
*
* (c) 1990, François Coulon & Laurent Cotton
* (c) 2021, Antoine Vignau & Olivier Zardini
*

	mx	%00
	
*-----------------------
* constantes
*-----------------------

NB_SALLES	=	105
NB_INDICATEURS	=	200
NB_TEXTES	=	2000
NB_DEDICACES	=	20*2	; up to two lines per dédicace
NB_SOUSTITRES	=	40*2	; up to two lines per sous-titre

*-----------------------
* macros
*-----------------------

~t	MAC
	PHW	]1
	PHW	]2
	PHW	]3
	PHW	]4
	PHW	]5
	PHW	]6
	PHW	]7
	jsr	t
	<<<

~dialogue	MAC
	PHW	]1
	PHW	]2
	PHW	]3
	jsr	dialogue
	<<<
	
~addchar	MAC
	pea	]1	; PHW
	pea	]2	; PHW
	jsr	add_char
	<<<

~addstring	MAC
	pea	]1
	pea	]2
	jsr	add_string
	<<<

~setstring	MAC
	lda	]1
	ora	#$0100
	xba
	sta	]2
	<<<
	
~charcmp	MAC
	pea	]1
	pea	]2
	jsr	charcmp
	IF	]0/4
	beq	]3
	brl	]4
	ELSE
	IF	]0/3
	bne	]3
	FIN
	FIN
	<<<

~strcmp	MAC
	pea	]1
	pea	]2
	jsr	strcmp
	IF	]0/3
	bne	]3
	FIN
	<<<

~son	MAC
	pea	]1
	pea	]2
	pea	]3
	jsr	son
	<<<

~texte	MAC
	lda	]1
	jsr	texte
	<<<

~indic_diff	MAC
	ldx	]1
	lda	indicateur-1,x
	and	#$ff
	cmp	#]2
	bne	]3
	<<<

~indic_equal	MAC
	ldx	]1
	lda	indicateur-1,x
	and	#$ff
	cmp	#]2
	beq	]3
	<<<
	
~set_indic	MAC
	ldx	#]1
	sep	#$20
	lda	#]2
	sta	indicateur-1,x
	rep	#$20
	<<<
	
~set	MAC
	lda	]1
	sta	]2
	IF	]0/3
	bra	]3
	FIN
	<<<

~ok	MAC
	lda	ok
	cmp	]1
	bne	]2
	<<<

*-----------------------
* les salles du jeu
*-----------------------

tblSALLE
	da	s00,s01,s02,s03,s04,s05,s06,s07,s08,s09
	da	s10,s11,s12,s13,s14,s15,s16,s17,s18,s19
	da	s20,s21,s22,s23,s24,s25,s26,s27,s28,s29
	da	s30,s31,s32,s33,s34,s35,s36,s37,s38,s39
	da	s40,s41,s42,s43,s44,s45,s46,s47,s48,s49
	da	s50,s51,s52,s53,s54,s55,s56,s57,s58,s59
	da	s60,s61,s62,s63,s64,s65,s66,s67,s68,s69
	da	s70,s71,s72,s73,s74,s75,s76,s77,s78,s79
	da	s80,s81,s82,s83,s84,s85,s86,s87,s88,s89
	da	s90,s91,s92,s93,s94,s95,s96,s97,s98,s99
	da	s100,s101,s102,s103,s104

*---

s00
	rts

*---

s01
	~t	#8;#104;#53;#191;#1;#0;#184	; amandine sac
	~t	#106;#5;#144;#59;#0;#2;#0	; porte appartement
	~t	#104;#117;#143;#192;#3;#0;#185	; porte voisine
	rts

*---

s02
	ldx	#5
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0201
	~t	#39;#29;#95;#63;#0;#6;#7	; tele
	bra	s0202
s0201
	~t	#39;#29;#95;#63;#6;#3;#7	; tele
s0202
	~t	#22;#124;#56;#142;#5;#0;#186	; chat
*
	~t	#62;#95;#94;#111;#0;#0;#0	; telephone
	lda	ok
	cmp	#TRUE
	bne	s0203
	lda	follow
	bne	s0203
	lda	#5
	sta	salle
*
s0203
	~t	#62;#95;#94;#111;#0;#0;#0	; telephone
	lda	ok
	cmp	#TRUE
	bne	s0204
	lda	follow
	beq	s0204
	jsr	stop_son
	lda	#7
	sta	salle

*
s0204	~t	#88;#171;#155;#198;#4;#0;#187	; magazine
	~t	#104;#28;#143;#73;#9;#-29;#0	; tas de linge
	~t	#110;#106;#157;#134;#7;#-15;#26	; laisse du chat
	~t	#0;#163;#78;#198;#8;#8;#14	; lit
	~t	#0;#0;#32;#77;#10;#4;#4	; fenetre
	rts

*---

s03
	ldx	#2
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0301
	~t	#60;#2;#219;#121;#13;#0;#3
*
s0301
	~t	#60;#2;#219;#121;#12;#0;#2
*
	ldx	#2	; we could have made it 16-bit
	lda	indicateur-1,x
	and	#$ff	; but let's keep the logic of
	cmp	#TRUE
	beq	s0302	; the code, please!
	ldx	#3
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s0302
	~t	#225;#89;#260;#121;#14;#2;#0
	bra	s0303
s0302
	~t	#225;#89;#260;#121;#0;#2;#0
s0303
	rts

*---

s04
	~t	#174;#14;#212;#75;#16;#0;#5	; antenne
	lda	ok
	cmp	#TRUE
	beq	s0401
	ldx	#7
	sep	#$20
	lda	#FALSE
	sta	indicateur-1,x
	rep	#$20
s0401	
	~t	#172;#85;#264;#149;#17;#0;#0	; amandine
	~t	#172;#156;#218;#193;#18;#2;#0	; gouttière
	rts

*---

s05
	stz	chiffre

	lda	#78
	sta	i

s0501
	lda	#73
	sta	j

s0502
	inc	chiffre
	
	ldy	j
	phy
	ldx	i
	phx
	tya
	clc
	adc	#12
	pha
	txa
	clc
	adc	#9
	pha
	lda	#0
	pha
	pha
	pha
	jsr	t
	
	lda	ok
	cmp	#TRUE
	bne	s0503

	lda	chiffre
	ora	#'0'
	pha
	pea	numero
	jsr	add_char
	
	~son	#0;#1;FALSE	
	
s0503	
	lda	j
	clc
	adc	#20
	sta	j
	cmp	#73+40
	bcc	s0502
	beq	s0502
	
	lda	i
	clc
	adc	#13
	sta	i
	cmp	#78+26
	bcc	s0501
	beq	s0501

*---

	~t	#92;#117;#107;#127;#0;#0;#0
	lda	ok
	cmp	#TRUE
	bne	s0504

	~addchar	#'0';numero
	~son	#4000;#1;FALSE	

*---

s0504
	lda	numero
	and	#$ff
	cmp	#6
	bne	s0505

	lda	#6
	jsr	charge_son
	~son	#5000;#30;FALSE
	
*---

s0505
	~t	#0;#159;#80;#199;#20;#0;#25	; calepin
	~t	#27;#27;#186;#57;#0;#2;#0	; combiné

	~strcmp	strNUM1;numero		; numéro de mario
	bne	s0506
	ldx	#24
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s0506
	
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x
	inx
	sta	indicateur-1,x
	rep	#$20
	
	~dialogue	#13;#21;#23
	stz	numero
	
*---

s0506
	~strcmp	strNUM2;numero		; numéro de la télé
	bne	s0507
	ldx	#10
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s0507

	~t	#0;#0;319;#199;#24;#2;#0
	stz	numero
	
	ldx	#10
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x		; 10=JEU TV OK
	rep	#$20

*---

s0507
	lda	numero
	and	#$ff
	cmp	#6
	bne	s0599
	
	~texte	#25
	lda	#2
	sta	salle
	jsr	attend_souris
s0599
	rts

*---

i	ds	2
j	ds	2

strNUM1	str	'498425'
strNUM2	str	'402308'

*---

s06
	~t	#60;#2;#219;#121;#27;#0;#2	; écran
	ldx	#27
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0601
	~t	#225;#89;#260;#121;#0;#2;#0	; bouton marche
	bra	s0602
s0601
	~t	#225;#89;#260;#121;#28;#2;#0	; bouton marche
s0602
	rts

*---

s07
	ldx	#11
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	
	ldx	#12
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0701

	~t	#32;#10;#113;#82;#31;#0;#0	; mère
	~ok	#TRUE;s0701
	~addchar	#'M';dial

s0701
	~t	#32;#10;#113;#82;#30;#0;#12	; mère
	~ok	#TRUE;s0702
	~addchar	#'M';dial

s0702
	ldx	#12
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0703

	~t	#22;#104;#69;#169;#33;#0;#0	; amandine
	~ok	#TRUE;s0703
	~addchar	#'A';dial

s0703
	~t	#22;#104;#69;#169;#32;#0;#12	; amandine
	~ok	#TRUE;s0704
	
	~addchar	#'A';dial

s0704
	lda	dial
	and	#$ff
	cmp	#2
	bne	s0705

	jsr	attend_souris

s0705
	~strcmp strMM;dial;s0706
	~dialogue	#2;#35;#43

s0706
	~strcmp strMA;dial;s0707
	~dialogue	#2;#46;#53

s0707
	~strcmp strAM;dial;s0708
	~dialogue	#2;#57;#63

s0708
	~strcmp strAA;dial;s0709
	~dialogue	#2;#66;#73

s0709
	rts

strMM	str	'MM'
strMA	str	'MA'
strAM	str	'AM'
strAA	str	'AA'

*---

s08
	~t	#48;#102;#146;#144;#76;#0;#188	; amandine
	~t	#8;#164;#33;#187;#0;#12;#0	; lampe

*	lda	#9
	lda	#-9
	sta	salle2
	
	ldx	#18
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0801
	
*	lda	#10
	lda	#-10
	sta	salle2

s0801
	ldx	#11
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s0802

*	lda	#11
	lda	#-11
	sta	salle2

s0802
*	~t	#23;#5;#114;#78;#0;-salle2;#0	; arbre reve
	~t	#23;#5;#114;#78;#0;salle2;#0	; arbre reve
	rts

*---

s09
	~t	#151;#58;#225;#199;#80;#0;#112	; amandine
	~t	#278;#43;#319;#171;#81;#-12;#0	; mario
	~t	#170;#15;#190;#55;#82;#0;#113	; chat
	~t	#241;#9;#266;#50;#82;#0;#113	; chat
	rts

*---

s10
	~t	#92;#51;#157;#122;#84;#0;#0	; amandine
	
	lda	ok
	cmp	#TRUE
	bne	s1001

	jsr	attend_souris
	lda	#12
	sta	salle
	lda	#TRUE
	sta	fade

s1001
	~t	#0;#16;#91;#199;#85;#0;#0	; mario

	lda	ok
	cmp	#TRUE
	bne	s1002

	jsr	attend_souris
	lda	#12
	sta	salle
	lda	#TRUE
	sta	fade

s1002
	rts

*---

s11
	~t	#127;#107;#201;#192;#0;#-12;#0	; Amandine

	ldx	#36
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s1101

	~t	#141;#0;#319;#94;#89;#0;#37	; mere

s1101
	ldx	#35
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s1102

	~t	#141;#0;#319;#94;#88;#0;#36

s1102
	~t	#141;#0;#319;#94;#87;#0;#35
	rts

*---

s12
	~t	#9;#57;#104;#144;#91;#0;#0
	
	lda	ok
	cmp	#TRUE
	bne	s1201

	jsr	attend_souris

s1201
	lda	#2
	sta	salle
	rts

*---

s13
	~charcmp	#'A';dial;s1301
	~t	#102;#14;#136;#64;#0;#0;#0	; amandine
	~ok	#TRUE;s1301
	~dialogue	#14;#95;#96
s1301
	~charcmp	#'A';dial;s1302
	~t	#146;#1;#188;#66;#0;#0;#0	; mario
	~ok	#TRUE;s1302
	~dialogue	#14;#98;#99
s1302
	~charcmp	#'M';dial;s1303
	~t	#146;#1;#188;#66;#0;#0;#18	; ********** indicateur 18: mario rompu
	~ok	#TRUE;s1303
	~dialogue	#2;#108;#112
s1303
	~charcmp	#'M';dial;s1304
	~t	#102;#14;#136;#64;#0;#0;#0	; amandine
	~ok	#TRUE;s1304
	~dialogue	#14;#114;#116
s1304
	lda	dial
	and	#$ff
	bne	s1305
	~t	#102;#14;#136;#64;#0;#0;#0	; amandine
	~ok	#TRUE;s1305
	~dialogue	#0;#92;#93
	~addchar	#'A';dial
s1305
	lda	dial
	and	#$ff
	bne	s1306
	~t	#146;#1;#188;#66;#0;#0;#0	; mario
	~ok	#TRUE;s1306
	~dialogue	#0;#101;#106
	~addchar	#'M';dial
s1306
	ldx	#16
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s1307
	~t	#234;#5;#276;#64;#120;#0;#17	; homme cheveux longs
s1307
	ldx	#15
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s1308
	~t	#234;#5;#276;#64;#119;#0;#15	; homme cheveux longs
s1308
	~t	#234;#5;#276;#64;#118;#0;#15	; homme cheveux longs
	~t	#43;#11;#80;#64;#121;#0;#38	; gros
	rts
	
*---

s14
* ---- replique de mario ou d'amandine
	ldx	#21
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s1401
	brl	s1403

s1401
	~t	#80;#83;#116;#111;#0;#0;#23	; amandine
	lda	ok
	cmp	#TRUE
	bne	s1402

	~dialogue	#0;#131;#133
	jsr	attend_souris
	~t	#0;#0;#319;#199;#141;#-2;#0	; retourne au début

s1402
	~t	#53;#48;#88;#77;#0;#0;#22	; mario
	lda	ok
	cmp	#TRUE
	bne	s1403

	~dialogue	#0;#128;#129
	jsr	attend_souris
	~t	#0;#0;#319;#199;#141;#-2;#0	; retourne au début

* ---- chat

s1403
	~t	#175;#133;#214;#171;#0;#0;#0	; chat
	lda	ok
	cmp	#TRUE
	bne	s1404

	~dialogue	#2;#135;#139

* ------ premiere phrase

s1404
	~t	#80;#83;#116;#111;#126;#0;#21	; amandine
	~t	#53;#48;#88;#77;#124;#2;#22	; mario
	rts

*---

s15
	~t	#142;#85;#191;#126;#143;#0;#0	; chat
	~t	#75;#27;#134;#123;#144;#0;#0	; amandine
	~t	#136;#0;#240;#51;#0;#16;#0	; bac à sable
	~t	#16;#10;#64;#129;#145;#17;#0	; homme
	rts

*--- bac à sable

s16
	~t	#151;#42;#178;#74;#0;#0;#28	; gosse1
	lda	ok
	cmp	#TRUE
	bne	s1601

  	lda	texte_enfant
	jsr	texte
    	inc	texte_enfant

s1601
	~t	#4;#97;#50;#129;#0;#0;#29	; 2
	lda	ok
	cmp	#TRUE
	bne	s1602

  	lda	texte_enfant
	jsr	texte
    	inc	texte_enfant

s1602
	~t	#108;#21;#143;#65;#0;#0;#30
	lda	ok
	cmp	#TRUE
	bne	s1603

  	lda	texte_enfant
	jsr	texte
    	inc	texte_enfant

s1603
	~t	#64;#37;#99;#102;#0;#0;#31
	lda	ok
	cmp	#TRUE
	bne	s1604

  	lda	texte_enfant
	jsr	texte
    	inc	texte_enfant

s1604
	lda	texte_enfant
	cmp	#153
	bne	s1605
	
	ldx	#32	; AMANDINE A ENVIE D'UN ENFANT
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

s1605
	~t	#226;#25;#274;#96;#153;#-2;#0	; amandine
	rts

*---

s17
	~t	#6;#81;#61;#177;#0;#0;#0	; homme
	lda	ok
	cmp	#TRUE
	bne	s1701

	~dialogue	#18;#156;#161

s1701
	~t	#74;#108;#110;#184;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s1702

	~dialogue	#19;#164;#170

s1702
	rts

*---

s18
	ldx	#93
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

	~t	#0;#76;#65;#199;#0;#0;#0	; poubelle
	lda	ok
	cmp	#TRUE
	bne	s1801

	ldx	#93
	sep	#$20
	lda	#FALSE
	sta	indicateur-1,x
	rep	#$20

	~texte	#173
	jsr	attend_souris
	lda	#2
	sta	salle
	lda	#TRUE
	sta	fade

s1801
	~t	#0;#0;#319;#199;#174;#-2;#0
	rts

*---

s19
	~t	#65;#0;#105;#41;#0;#0;#33	; ordinateur
	lda	ok
	cmp	#TRUE
	bne	s1901

	~dialogue	#0;#177;#180

s1901
	ldx	#33
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s1903

	~t	#106;#34;#184;#127;#0;#0;#0	; homme
	lda	ok
	cmp	#TRUE
	bne	s1902

	~dialogue	#20;#188;#188

s1902
	~t	#185;#59;#247;#128;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s1903

	~dialogue	#20;#183;#185

s1903
	~t	#106;#34;#184;#127;#0;#0;#0	; homme
	lda	ok
	cmp	#TRUE
	bne	s1904

	~dialogue	#20;#191;#191

s1904
	~t	#185;#59;#247;#128;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s1905

	~dialogue	#20;#192;#193

s1905
	rts

*---

s20
	lda	#TRUE
	sta	fade
	~t	#212;#104;#248;#134;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s2001

	~dialogue	#25;#196;#200

s2001
	~t	#212;#76;#242;#103;#0;#0;#0	; homme
	lda	ok
	cmp	#TRUE
	bne	s2002

	~dialogue	#25;#203;#209

s2002
	~t	#255;#44;#294;#118;#0;#21;#0	; salle de bain
	rts

*---

s21
	~t	#89;#69;#133;#124;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s2103
	
	inc	salle_bain
	lda	salle_bain
	cmp	#1
	bne	s2101

	~dialogue	#0;#212;#215

s2101
	lda	salle_bain
	cmp	#2
	bne	s2102

	~dialogue	#0;#218;#221

s2102
	lda	salle_bain
	cmp	#3
	bne	s2103

	~dialogue	#0;#224;#226	; balancer a la scene du reveil

s2103
	~t	#11;#0;#69;#84;#0;#0;#0	; porte
	lda	ok
	cmp	#TRUE
	bne	s2106
	lda	salle_bain
	bne	s2104

	lda	#22
	sta	salle

s2104
	lda	salle_bain
	cmp	#1
	bne	s2105

	lda	#24
	sta	salle

s2105
	lda	salle_bain
	cmp	#2
	bne	s2106

	lda	#23
	sta	salle

s2106
	rts

*---

s22
	lda	#TRUE
	sta	fade
	lda	#26
	sta	salle
	rts

*---

s23
	lda	#TRUE
	sta	fade
	lda	#26
	sta	salle
	rts

*---

s24
	lda	#TRUE
	sta	fade
	lda	#26
	sta	salle
	rts

*---

s25
	lda	#TRUE
	sta	fade
	~t	#11;#168;#44;#191;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s2501
	
	~dialogue	#26;#234;#236

s2501
	~t	#31;#140;#67;#164;#0;#0;#0	; homme
	lda	ok
	cmp	#TRUE
	bne	s2502

	~dialogue	#26;#239;#245

s2502
	rts

*---

s26
	ldx	#18
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s2601

	~t	#54;#34;#138;#107;#247;#-27;#0	; homme
	~t	#100;#114;#146;#199;#248;#-28;#0	; amandine
	rts

s2601
	~t	#100;#114;#146;#199;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s2602

	~dialogue	#27;#249;#258

s2602
	~t	#54;#34;#138;#107;#0;#0;#0	; homme
	lda	ok
	cmp	#TRUE
	bne	s2603

	~dialogue	#28;#260;#269

s2603
	rts

*---

s27
	~t	#33;#31;#74;#80;#272;salle_fin;#0	; amandine
	~t	#120;#60;#161;#153;#0;#0;#40	; vieille
	lda	ok
	cmp	#TRUE
	bne	s2701

	~dialogue	#0;#274;#283

s2701
	~t	#30;#122;#85;#199;#0;#0;#41	; jeune
	lda	ok
	cmp	#TRUE
	bne	s2702

	~dialogue	#0;#287;#292

s2702
	~t	#0;#36;#28;#128;#285;#0;#42	; grosse
	rts

*---

s28
	~t	#258;#150;#319;#199;#294;#-2;#0	; amandine
	~t	#166;#0;#319;#112;#295;#-2;#0	; bouche
  
  	ldx	#14
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	rts

*---

s29
	~t	#36;#83;#91;#142;#0;#30;#0	; peintre
	~t	#95;#90;#133;#142;#313;#0;#45	; plongeur
	~t	#259;#58;#296;#128;#0;#0;#111	; en calecon
	~ok	#TRUE;s2902
	
	ldx	#50
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s2901
	
	~texte	#342
	bra	s2902
	
s2901
	~texte	#341

s2902
	~t	#258;#22;#270;#33;#298;#0;#47	; journal d'amandine
	~ok	#FALSE;s2903
	~t	#247;#7;#283;#44;#297;#0;#46	; amandine

s2903
	~t	#179;#12;#203;#64;#0;#0;#0	; fille 1
	~ok	#TRUE;s2904
	~addchar	#'1';dial

s2904
	~t	#204;#11;#222;#65;#0;#0;#0	; fille 2
	~ok	#TRUE;s2905
	~addchar	#'2';dial

s2905
	ldx	#49
	lda	indicateur-1,x
	and	#$ff
	bne	s2907
	
	~charcmp	#'1';dial;s2906
	~texte	#315

s2906
	~charcmp	#'2';dial;s2907
	~texte	#325
	
	lda	dial
	and	#$ff
	cmp	#1
	bne	s2907
	
	ldx	#49
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	ldx	#50
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s2910

	~strcmp str291;dial;s2907
	~texte	#323

s2907
	~strcmp str292;dial;s2908
	~dialogue	#0;#317;#321
s2908
	~strcmp str293;dial;s2909
	~dialogue	#0;#334;#339

s2909
	~strcmp str294;dial;s2910
	~dialogue	#0;#327;#332

s2910
	lda	dial
	and	#$ff
	cmp	#2
	bne	s2911

	ldx	#50
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s2911
	~t	#108;#9;#149;#65;#0;#0;#48	; homme tache
	~ok	#TRUE;s2912
	~dialogue	#0;#300;#302

s2912
	~t	#151;#9;#178;#62;#0;#0;#48	; fille tache
	~ok	#TRUE;s2913
	~dialogue	#0;#304;#311

s2913
	rts

str291	str	'11'
str292	str	'12'
str293	str	'22'
str294	str	'21'

*---

s30
	ldx	#52
	lda	#FALSE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	~t	#0;#70;#36;#146;#0;#0;#52	; amandine
  	lda	ok
	cmp	#TRUE
	bne	s3001
	~addchar #'A';dial

s3001
	~t	#45;#21;#122;#107;#0;#0;#52	; peintre
	lda	ok
	cmp	#TRUE
	bne	s3002
	~addchar #'P';dial

s3002
	ldx	#52
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s3003
	brl	s3009

s3003
	~charcmp #'P';dial
	bne	s3004
	~texte	#345

s3004
	~charcmp #'A';dial
	bne	s3005
	~texte	#372

s3005
	~strcmp str301;dial
	bne	s3006
	~dialogue	#31;#347;#357

s3006
	~strcmp str302;dial
	bne	s3007
	~dialogue	#42;#359;#370

s3007
	~strcmp str303;dial
	bne	s3008
	~dialogue	#41;#374;#387

s3008
	~strcmp str304;dial
	bne	s3009
	~dialogue	#31;#389;#401

s3009
	rts

str301	str	'PA'
str302	str	'PP'
str303	str	'AP'
str304	str	'AA'

*---

s31
	ldx	#53
	lda	#FALSE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	~t	#250;#88;#310;#169;#0;#0;#53	; amandine
  	lda	ok
	cmp	#TRUE
	bne	s3101
	~addchar #'A';dial

s3101
	~t	#168;#19;#236;#150;#0;#0;#53	; homme
	lda	ok
	cmp	#TRUE
	bne	s3102
	~addchar #'M';dial

s3102
	ldx	#53
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s3103
	brl	s3109

s3103
	~charcmp #'A';dial
	bne	s3104
	~texte	#403

s3104
	~charcmp #'M';dial
	bne	s3105
	~texte	#417

s3105
	~strcmp str311;dial
	bne	s3106
	~dialogue	#32;#405;#406

s3106
	~strcmp str312;dial
	bne	s3107
	~dialogue	#32;#419;#424

s3107
	~strcmp str313;dial
	bne	s3108
	~dialogue	#32;#426;#433

s3108
	~strcmp str314;dial
	bne	s3109
	~dialogue	#32;#408;#415

s3109
	rts

str311	str	'AA'
str312	str	'MA'
str313	str	'MM'
str314	str	'AM'

*---

s32
	~t	#27;#0;#76;#40;#0;#0;#55	; controleur
	lda	ok
	cmp	#TRUE
	bne	s3201
	~dialogue	#33;#436;#443

s3201
	~t	#77;#13;#101;#34;#0;#0;#55	; vieille au ticket
	lda	ok
	cmp	#TRUE
	bne	s3202
	~dialogue	#33;#445;#450

s3202
	~t	#29;#45;#68;#78;#460;#0;#57	; homme edenté
	~t	#128;#89;#155;#163;#459;#0;#58	; pere noel
	~t	#102;#140;#127;#198;#458;#-33;#59	; amandine
	~t	#42;#132;#85;#199;#0;#0;#59	; vieille grincheuse
	lda	ok
	cmp	#TRUE
	bne	s3203
	~dialogue	#33;#452;#456

s3203
	~t	#88;#112;#107;#137;#461;#0;#60	; homme à lunettes
	~t	#7;#154;#38;#199;#462;#0;#61	; homme à casquette
	rts

*---

s33
	~t	#49;#45;#85;#135;#463;#34;#0	; frigo
	~t	#89;#64;#125;#114;#463;#35;#0	; four
	~t	#127;#120;#158;#141;#463;#36;#0	; grille pain
	~t	#185;#95;#237;#120;#463;#37;#0	; machine à écrire
	~t	#205;#0;#245;#90;#463;#38;#0	; bain
	~t	#187;#130;#221;#150;#463;#39;#0	; tiroir
	~t	#132;#60;#183;#92;#463;#40;#0	; vin
	rts

*---

s34
	lda	salle_fin
	sta	salle
	rts

*---

s35
	lda	salle_fin
	sta	salle
	rts

*---

s36
	lda	salle_fin
	sta	salle
	rts

*---

s37
	lda	salle_fin
	sta	salle
	rts

*---

s38
	lda	salle_fin
	sta	salle
	lda	#TRUE
	sta	fade
	rts

*---

s39
	lda	salle_fin
	sta	salle
	lda	#TRUE
	sta	fade
	rts

*---

s40
	lda	salle_fin
	sta	salle
	lda	#TRUE
	sta	fade
	rts

*---

s41
	~t	#75;#25;#120;#58;#471;#-43;#62	; amandine
	~t	#38;#81;#72;#148;#472;#-43;#63	; amandine2
	~t	#17;#149;#69;#193;#473;#0;#64	; chat
	rts

*---

s42
	~t	#18;#28;#69;#126;#0;#0;#65	; amandine
	lda	ok
	cmp	#TRUE
	bne	s4201
	~dialogue	#43;#493;#497

s4201
	~t	#74;#13;#128;#132;#0;#0;#65	; vendeur
	lda	ok
	cmp	#TRUE
	bne	s4202
	~dialogue	#43;#480;#490

s4202
	~t	#175;#35;#200;#135;#475;#0;#66	; main au fesses
	~t	#264;#73;#310;#142;#477;#0;#67	; homme manteau
	~t	#155;#4;#174;#48;#476;#0;#68	; clowm blanc
	~t	#253;#14;#277;#69;#478;#0;#69	; gros
	~t	#283;#16;#307;#71;#479;#0;#70	; femme mini jupe
	~t	#233;#0;#250;#26;#500;#0;#71	; femme nue
	rts

*---

s43
  	ldx	#76
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s4302

	~t	#53;#28;#66;#40;#0;#0;#89	; homme roploplo
	lda	ok
	cmp	#TRUE
	bne	s4301
 	~dialogue	#0;#541;#542

s4301
	~t	#73;#15;#87;#33;#539;#0;#89	; idem 2

s4302
	ldx	#73
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s4303
	brl	s4306

s4303
	~t	#133;#74;#159;#106;#0;#0;#86	; amandine
	lda	ok
	cmp	#TRUE
	bne	s4304
	~dialogue	#48;#575;#578

s4304
	~t	#81;#59;#97;#107;#0;#0;#86	; bob
	lda	ok
	cmp	#TRUE
	bne	s4305
	~dialogue	#46;#570;#573

s4305
	~t	#107;#50;#125;#68;#580;#0;#87	; gros roux
	bra	s4307

s4306
	~t	#133;#74;#159;#106;#503;#0;#72	; amandine
	~t	#81;#59;#97;#107;#0;#0;#73	; bob
	lda	ok
	cmp	#TRUE
	bne	s4307
	~dialogue	#0;#567;#568

s4307
	~t	#218;#56;#236;#109;#535;#0;#74	; a coté de gabrielle
	~t	#239;#59;#260;#84;#0;#0;#0	; gabrielle
	lda	ok
	cmp	#TRUE
	bne	s4308
	~dialogue	#47;#523;#527

s4308
	~t	#81;#33;#94;#49;#0;#0;#75	; homme petits fours
	lda	ok
	cmp	#TRUE
	bne	s4309
	~dialogue	#0;#520;#521

s4309
	~t	#107;#50;#125;#68;#0;#0;#73	; 
	lda	ok
	cmp	#TRUE
	bne	s4310

	~dialogue	#0;#557;#564

	ldx	#90
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s4310
	~t	#53;#28;#66;#40;#537;#0;#76	; homme roploplo
	~t	#73;#15;#87;#33;#537;#0;#76	; idem 2
	~t	#127;#42;#164;#74;#504;#0;#77	; serveur
	~t	#130;#11;#153;#41;#529;#0;#78	; homme pres tableau
	~t	#207;#3;#278;#26;#0;#0;#79	; homme queue de cheval
	lda	ok
	cmp	#TRUE
	bne	s4311
	~dialogue	#0;#530;#533

s4311
	~t	#4;#105;#31;#150;#0;#0;#80	; homme gauche
	lda	ok
	cmp	#TRUE
	bne	s4312
	~dialogue	#0;#506;#509

s4312
	~t	#39;#101;#59;#150;#0;#0;#80	; homme a cote 81
	lda	ok
	cmp	#TRUE
	bne	s4313
	~dialogue	#0;#515;#518

s4313
	~t	#82;#110;#106;#150;#0;#0;#80	; homme a cote 82
	lda	ok
	cmp	#TRUE
	bne	s4314
	~dialogue	#0;#511;#513

s4314
	~t	#154;#108;#178;#150;#583;#0;#83	; homme qui baille
* @T(179;#113;#195;#139;#0;#0;#0	; à lunettes
	~t	#198;#117;#222;#150;#0;#0;#84	; gros à coté
	lda	ok
	cmp	#TRUE
	bne	s4315
	~dialogue	#0;#544;#545

s4315
* @T(283;#108;#313;#150;#0;#0;#0	; barbu
	~t	#164;#7;#206;#36;#0;#0;#85	;  chevelu smith
	lda	ok
	cmp	#TRUE
	bne	s4316
	~dialogue	#0;#547;#553

s4316
	~t	#110;#98;#128;#124;#555;#0;#94	; ou sont les caméras
	rts

*---

s44
	~t	#75;#81;#139;#152;#594;#0;#91	; ivrogne
	~t	#36;#30;#77;#78;#587;#0;#92	; garcon
	~t	#0;#113;#52;#199;#0;#0;#91	; grosse
	~ok	#TRUE;s4401
	~dialogue	#0;#589;#592

s4401
	ldx	#93
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s4402
	~t	#78;#0;#119;#48;#595;#-27;#99	; amandine epouse raoul

s4402
	ldx	#90
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s4403
	~t	#78;#0;#119;#48;#596;#-67;#99	; amandine presse

s4403
	~t	#78;#0;#119;#48;#597;salle_fin;#99	; amandine fin
	rts

*---

s45
	~t	#174;#41;#241;#195;#0;#0;#0	; amandine
	~ok	#TRUE;s4501
	~addchar	#'A';dial

s4501
	~t	#252;#48;#319;#180;#0;#0;#0	; mario
	~ok	#TRUE;s4502
	~addchar	#'M';dial

s4502
	~charcmp	#'A';dial;s4503
	~texte	#614

s4503
	~charcmp	#'M';dial;s4504
	~texte	#600

s4504
	~strcmp		str451;dial;s4505
	~dialogue	salle_fin;#622;#626

s4505
	~strcmp		str452;dial;s4506
	~dialogue	salle_fin;#616;#620

s4506
	~strcmp		str453;dial;s4507
	~dialogue	salle_fin;#602;#606

s4507
	~strcmp		str454;dial;s4508
	~dialogue	salle_fin;#608;#612

s4508
	rts

str451	str	'AA'
str452	str	'AM'
str453	str	'MA'
str454	str	'MM'

*---

s46
	~t	#29;#14;#68;#107;#0;#0;#0	; blanc
	lda	ok
	cmp	#TRUE
	bne	s4601
	~addchar	#'B';dial

s4601
	~t	#0;#22;#27;#109;#0;#0;#0	; black
	lda	ok
	cmp	#TRUE
	bne	s4602
	~addchar	#'N';dial

s4602
	~charcmp	#'B';dial
	bne	s4603
	~texte	#631

s4603
	~charcmp	#'N';dial
	bne	s4604
	~texte	#639

s4604
	ldx	#101
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s4608

	~strcmp		str461;dial
	bne	s4605
	~dialogue	#0;#633;#634

s4605
	~strcmp		str462;dial
	bne	s4606
	~dialogue	#0;#636;#637

s4606
	~strcmp		str463;dial
	bne	s4607
	~dialogue	#0;#641;#642

s4607
	~strcmp		str464;dial
	bne	s4608
	~dialogue	#0;#644;#646

s4608
	lda	dial
	and	#$ff
	cmp	#2
	bne	s4609
	
	ldx	#101
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s4609
  	ldx	#18	; mario plaqué ou non
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s4610
	~t	#80;#32;#119;#138;#628;#-44;#100	; amandine
	bra	s4611

s4610
	~t	#80;#32;#119;#138;#629;#-45;#100	; amandine

s4611
	rts

str461	str	'BN'
str462	str	'BB'
str463	str	'NB'
str464	str	'NN'

*---

s47
	~t	#213;#97;#252;#199;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s4701
	~addchar	#'A';dial

s4701
	~t	#259;#82;#310;#199;#0;#0;#0	; gabrielle
  	lda	ok
	cmp	#TRUE
	bne	s4702
	~addchar	#'G';dial

s4702
  	ldx	#18
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	beq	s4703
	brl	s4709
s4703
	~charcmp	#'A';dial
	bne	s4704
	ldx	#107
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s4704

	~dialogue	#0;#649;#651
	ldx	#107
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s4704
	~charcmp	#'G';dial
	bne	s4705
	ldx	#107
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s4705

	~texte	#662
	ldx	#107
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s4705
	~strcmp	str471;dial
	bne	s4706
	~dialogue	#63;#653;#657	; oranges

s4706
	~strcmp	str472;dial
	bne	s4707
	~dialogue	#61;#659;#660	; gym

s4707
	~strcmp	str473;dial
	bne	s4708
	~dialogue	#62;#664;#673	; uva

s4708
	~strcmp	str474;dial
	bne	s4709
	~dialogue	#60;#675;#678	; coiffeur
	bra	s4711

s4709	; mario plaqué
	~t	#213;#97;#252;#199;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s4710
	~dialogue	#57;#681;#688

s4710
	~t	#259;#82;#310;#199;#0;#0;#0	; gabrielle
	lda	ok
	cmp	#TRUE
	bne	s4711
	~dialogue	#64;#690;#692

s4711
	~t	#183;#13;#227;#94;#695;#0;#105	; portier
	~t	#239;#40;#281;#77;#694;#0;#106	; vieille
	rts

str471	str	'AG'
str472	str	'AA'
str473	str	'GG'
str474	str	'GA'

*---

s48
	~t	#0;#93;#50;#197;#0;#0;#114	; bob
	lda	ok
	cmp	#TRUE
	bne	s4801
	~addchar	#'P';dial

s4801
	~t	#51;#101;#86;#190;#0;#0;#114	; amandine
	lda	ok
	cmp	#TRUE
	bne	s4802
	~addchar	#'A';dial

s4802
	ldx	#114
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s4802_bis
	brl	s4808

s4802_bis
	ldx	#114
	lda	#FALSE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	~charcmp	#'P';dial
	bne	s4803
	~texte	#697

s4803
	~strcmp	str481;dial
	bne	s4804
	~dialogue	#46;#699;#703	; amandine plaque bob

s4804
	~strcmp	str482;dial
	bne	s4805
	~dialogue	#49;#705;#706	; baise

s4805
	~charcmp	#'A';dial
	bne	s4806
	~texte	#708

s4806
	~strcmp	str483;dial
	bne	s4807
	~dialogue	#52;#710;#713	; rdv aspirateur

s4807
	~strcmp	str484;dial
	bne	s4808
	~dialogue	#49;#715;#717

s4808
	rts

str481	str	'PA'
str482	str	'PP'
str483	str	'AP'
str484	str	'AA'

*---

s49
	~t	#251;#68;#307;#104;#0;#0;#0	; le chat
	~ok	#TRUE;s4901
	~dialogue	#50;#743;#744

s4901
	~t	#43;#9;#91;#86;#0;#0;#0	; statue
	~ok	#TRUE;s4902
	~dialogue	#50;#739;#741

s4902
	~t	#103;#0;#165;#104;#0;#0;#115	; amandine
	~ok	#TRUE;s4903
	~addchar	#'A';dial

s4903
	~t	#191;#7;#229;#104;#0;#0;#115	; bob
	~ok	#TRUE;s4904
	~addchar	#'P';dial

s4904
	ldx	#115
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s4905
	brl	s4911
s4905
    	ldx	#115
	lda	#FALSE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20
	
	~charcmp	#'P';dial;s4906
	~texte	#721

s4906
	~strcmp	str491;dial;s4907
	~dialogue	#50;#723;#725

s4907
	~strcmp	str492;dial;s4908
	~dialogue	#50;#727;#730

s4908
	~charcmp	#'A';dial;s4909
	~texte	#732

s4909
	~strcmp	str493;dial;s4910
	~texte	#734
	~set	#50;salle
	jsr	attend_souris

s4910
	~strcmp	str494;dial;s4911
	~dialogue	#50;#736;#737

s4911
	rts

str491	str	'PA'
str492	str	'PP'
str493	str	'AP'
str494	str	'AA'

*---

s50	~set_indic	#119;#TRUE

	~indic_diff	#90;#TRUE;s5001
	~set	#67;salle2;s5002
s5001	~set	#51;salle2

s5002	~t	#118;#62;#151;#109;#0;#0;#19	; amandine
	~ok	#TRUE;s5003
	~addchar	#'A';dial

s5003	~t	#156;#2;#213;#83;#0;#0;#19	; bob
	~ok	#TRUE;s5004
	~addchar	#'P';dial

s5004	~indic_diff	#19;#FALSE;s5005
	~t	#272;#86;#309;#109;#778;#0;#20	; le chat

s5005	~indic_equal	#19;#TRUE;s5006
 	brl	s5012

s5006	~set_indic	#19;#FALSE
	~charcmp	#'P';dial;s5007
	~texte	#747

s5007	~strcmp	str501;dial;s5008
	~dialogue	salle2;#749;#754

s5008	~strcmp	str502;dial;s5009
	~dialogue	salle2;#756;#762

s5009	~charcmp	#'A';dial;s5010
	~texte	#764

s5010	~strcmp	str503;dial;s5011
	~dialogue	salle2;#766;#767

s5011	~strcmp	str504;dial;s5012
	~dialogue	salle2;#769;#776

s5012	rts

str501	str	'PA'
str502	str	'PP'
str503	str	'AA'
str504	str	'AP'

*---

s51
	~t	#0;#6;#52;#106;#780;salle_fin;#0	; statue 1
	~t	#53;#3;#95;#106;#781;salle_fin;#0	; statue 2
	~t	#105;#30;#157;#111;#782;salle_fin;#0	; statue3
	~t	#159;#2;#219;#111;#783;salle_fin;#0	; statue 4
	~t	#221;#11;#315;#111;#784;salle_fin;#0	; statue 5+bob
	~t	#0;#110;#57;#132;#785;salle_fin;#0	; chat
	rts

*---

s52
	lda	#TRUE
	sta	fade
	~t	#10;#20;#73;#153;#0;#0;#0	; amandine
	~ok	#TRUE;s5201

	~texte	#787
	~set	#53;salle
	jsr	attend_souris

s5201
	~t	#105;#134;#150;#174;#0;#0;#0	; chat
	~ok	#TRUE;s5202

	~texte	#788
	~set	#55;salle
	jsr	attend_souris

s5202
	rts

*---

s53
	~set	#54;salle
	~set	#TRUE;fade
	rts

*---

s54
	~t	#61;#87;#122;#132;#809;#-49;#0	; chat
	~t	#41;#15;#113;#81;#0;#0;#116	; amandine
	~ok	#TRUE;s5401
	~addchar	#'A';dial

s5401
	~t	#125;#5;#252;#117;#0;#0;#116	; veto
	~ok	#TRUE;s5402
	~addchar	#'V';dial

s5402
	ldx	#116
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s5403
	brl	s5409

s5403
	ldx	#116
	lda	#FALSE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	~charcmp	#'A';dial;s5404
	~texte	#792

s5404
	~strcmp		str541;dial;s5405
	~dialogue	#49;#794;#797

s5405
	~strcmp		str542;dial;s5406
	~dialogue	#49;#799;#800

s5406
	~charcmp	#'V';dial;s5407
	~texte	#802

s5407
	~strcmp		str543;dial;s5408
	~dialogue	#49;#804;#805

s5408
	~strcmp		str544;dial;s5409
	~texte	#807
	~set	#49;salle
	jsr	attend_souris

s5409
	rts

str541	str	'AV'
str542	str	'AA'
str543	str	'VA'
str544	str	'VV'

*---

s55
	ldx	#120
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s5501
	~t	#21;#66;#144;#126;#813;#56;#0	; amandine

s5501
	~t	#21;#66;#144;#126;#812;#0;#120	; amandine
	~t	#50;#125;#129;#163;#811;#0;#110	; chat
	rts

*---

s56
	~set	#49;salle
	~set	#TRUE;fade
	rts

*---

s57
	~t	#76;#57;#110;#90;#0;#0;#117	; amandine
	~ok	#TRUE;s5701
	~addchar	#'A';dial

s5701
	~t	#13;#74;#76;#147;#0;#0;#117	; gaby
	~ok	#TRUE;s5702
	~addchar	#'G';dial

	~indic_equal	#117;#TRUE;s5702
 	brl	s5708

s5702
	~set_indic	#117;#FALSE

	~charcmp	#'A';dial;s5703
	~texte	#816

s5703
	~strcmp	str571;dial;s5704
	~dialogue	#58;#818;#822

s5704
	~strcmp	str572;dial;s5705
	~dialogue	#58;#824;#826

s5705
	~charcmp	#'G';dial;s5706
	~texte	#828

s5706
	~strcmp	str573;dial;s5707
	~dialogue	#58;#830;#838

s5707
	~strcmp	str574;dial;s5708
	~dialogue	#58;#840;#842

s5708
	rts
	
str571	str	'AA'
str572	str	'AG'
str573	str	'GG'
str574	str	'GA'

*---

s58
	~indic_diff	#90;#TRUE;s5801
	~set	#67;salle2;s5802
s5801	~set	#66;salle2

s5802
	~t	#10;#143;#34;#160;#0;#0;#0	; chat
	~ok	#TRUE;s5803
	~dialogue	salle2;#854;#857

s5803
	~indic_diff	#150;#FALSE;s5805
	~t	#79;#185;#103;#197;#860;#0;#121	; sexe d'amandine
	~ok	#FALSE;s5804
	~t	#69;#74;#120;#197;#859;#0;#151	; amandine
s5804
	~t	#7;#55;#53;#102;#0;#0;#150	; gaby
	~ok	#TRUE;s5805
	~texte	#845	
	bra	s5807

s5805
	~t	#69;#74;#120;#197;#0;#0;#0	; amandine
	~ok	#TRUE;s5806
	~dialogue	salle2;#847;#849

s5806
	~t	#7;#55;#53;#102;#0;#0;#0	; gaby
	~ok	#TRUE;s5807
	~dialogue	salle2;#851;#852

s5807
	rts

*---

s59
	~t	#204;#121;#255;#199;#0;#0;#118	; amandine
	~ok	#TRUE;s5901
	~addchar	#'A';dial

s5901
	~t	#202;#0;#319;#119;#0;#0;#118	; woody
	~ok	#TRUE;s5902
	~addchar	#'W';dial

s5902
	~indic_equal	#118;TRUE;s5903
	brl	s5909

s5903
	~set_indic	#118;FALSE
	~charcmp	#'A';dial;s5904
	~texte	#861

s5904
	~strcmp		str591;dial;s5905
	~dialogue	#65;#863;#864

s5905
	~strcmp		str592;dial;s5906
	~dialogue	#65;#866;#868

s5906
	~charcmp	#'W';dial;s5907
	~texte	#870

s5907
	~strcmp		str593;dial;s5908
	~dialogue	#65;#872;#875

s5908
	~strcmp		str594;dial;s5909
	~dialogue	#65;#877;#878

s5909
	rts

str591	str	'AW'
str592	str	'AA'
str593	str	'WA'
str594	str	'WW'

*---

s60
	~indic_equal	#154;TRUE;s6001
	brl	s6007
s6001
	~t	#244;#122;#274;#147;#0;#0;#0	; amandine
	~ok	#TRUE;s6002
	~addchar	#'A';dial
s6002
	~t	#228;#89;#252;#115;#0;#0;#0	; coiffeur
	~ok	#TRUE;s6003
	~addchar	#'C';dial
s6003
	~strcmp	str601;dial;s6004
	~texte	#908
	jsr	attend_souris
	~t	#0;#0;#319;#199;#910;salle_fin2;#0
s6004
	~strcmp	str602;dial;s6005
	~dialogue	#0;#902;#906
	jsr	attend_souris
	~t	#0;#0;#319;#199;#910;salle_fin2;#0
s6005
	~strcmp	str603;dial;s6006
	~dialogue	#0;#893;#898
	jsr	attend_souris
	~t	#0;#0;#319;#199;#910;salle_fin2;#0
s6006
	~strcmp	str604;dial;s6007
	~dialogue	#0;#889;#891
	jsr	attend_souris
	~t	#0;#0;#319;#199;#910;salle_fin2;#0
s6007
*
* premiere phrase
	~indic_equal	#154;FALSE;s6008
	brl	s6012
s6008
	~t	#244;#122;#274;#147;#0;#0;#0	; amandine
	~ok	#TRUE;s6009
	~addchar	#'A';dial
	~set_indic	#154;#TRUE
s6009
	~t	#228;#89;#252;#115;#0;#0;#0	; coiffeur
	~ok	#TRUE;s6010
	~addchar	#'C';dial
	~set_indic	#154;#TRUE
s6010
	~charcmp	#'A';dial;s6011
	~texte	#900
s6011
	~charcmp	#'C';dial;s6012
	~texte	#887
s6012
*
	~t	#272;#95;#298;#128;#0;#0;#152	; cliente
	~ok	#TRUE;s6013
	~dialogue	#0;#882;#885
s6013
	~t	#252;#55;#287;#81;#880;#0;#152	; coiffeuse
	rts

str601	str	'AA'
str602	str	'AC'
str603	str	'CC'
str604	str	'CA'

*---

s61
*  @T(46,74,114,131,0,0,0)!amandine
	~t	#0;#0;#319;#199;#912;salle_fin2;#0
	~set	salle_fin2;salle
	rts

*---

s62
	~t	#108;#45;#164;#106;#0;#0;#172	; amandine
	~ok	#TRUE;s6201
	~addchar	#'A';dial
s6201
	~t	#187;#15;#248;#100;#0;#0;#172	; homme
	~ok	#TRUE;s6202
	~addchar	#'M';dial
s6202
	~indic_equal	#172;TRUE;s6203
	brl	s6210
s6203
	~charcmp	#'A';dial;s6204
	~dialogue	#0;#914;#916
s6204
	~strcmp	str621;dial;s6205
	~dialogue	#0;#918;#919
s6205
	~strcmp	str622;dial;s6206
	~texte	#921
s6206
	~charcmp	#'M';dial;s6207
	~dialogue	#0;#923;#924
s6207
	~strcmp	str623;dial;s6208
	~texte	#926
s6208
	~strcmp	str624;dial;s6209
	~texte	#928
s6209
	~set_indic	#172;#FALSE
s6210
	lda	dial
	and	#$ff
	cmp	#2
	bcc	s6211
	jsr	attend_souris
	~t	#0;#0;#319;#199;#930;salle_fin2;#0
s6211
	rts

str621	str	'AA'
str622	str	'AM'
str623	str	'MM'
str624	str	'MA'

*---

s63
	~t	#15;#58;#86;#131;#0;#0;#0	; amandine
	~ok	#TRUE;s6301
	~dialogue	#0;#932;#937
	jsr	attend_souris
	~t	#0;#0;#319;#199;#941;salle_fin2;#0
s6301
	~indic_diff	#155;#TRUE;s6302
	~t	#90;#11;#174;#71;#940;#0;#156	; vendeur
s6302
	~t	#90;#11;#174;#71;#939;#0;#155	; vendeur
	rts

*---

s64
	~t	#238;#76;#267;#131;#0;#0;#0	; amandine
	~ok	#TRUE;s6401
	~dialogue	#58;#954;#958
s6401
	~t	#202;#63;#230;#114;#0;#0;#0	; homme amandine
	~ok	#TRUE;s6402
	~dialogue	#65;#964;#969
s6402
	~t	#132;#93;#185;#114;#0;#0;#0	; homme coke
	~ok	#TRUE;s6403
	~dialogue	#59;#943;#952
s6403
	~t	#81;#71;#121;#131;#0;#0;#0	; gaby
	~ok	#TRUE;s6404
	~dialogue	#65;#960;#962
s6404
	~t	#206;#11;#259;#45;#0;#0;#157	; couple
	~ok	#TRUE;s6405
	~dialogue	#0;#971;#975
s6405
	rts

*---

s65
	~t	#92;#95;#146;#178;#0;#0;#0	; amandine
	~ok	#TRUE;s6501
	~addstring	#'A';dial
s6501
	~t	#251;#92;#319;#199;#0;#0;#0	; presentateur
	~ok	#TRUE;s6502
	~addstring	#'M';dial
s6502
	~t	#147;#92;#207;#119;#0;#0;#0	; homme
	~ok	#TRUE;s6503
	lda	dial
	and	#$ff
	bne	s6503
	~dialogue	salle_fin2;#1011;#1022
s6503
	~charcmp	#'M';dial;s6504
	~indic_diff	#158;#FALSE;s6504
	~dialogue	#0;#978;#980
	~set_indic	#158;#TRUE
s6504
	~strcmp	str651;dial;s6505
	~dialogue	salle_fin2;#983;#993
s6505
	~strcmp	str652;dial;s6506
	~dialogue	salle_fin2;#995;#996
s6506
	~charcmp	#'A';dial;s6507
	~indic_diff	#158;#FALSE;s6507
	~texte	#998
	~set_indic	#158;#TRUE
s6507
	~strcmp	str653;dial;s6508
	~dialogue	salle_fin2;#1000;#1001
s6508
	~strcmp	str654;dial;s6509
	~dialogue	salle_fin2;#1003;#1009
s6509
	rts

str651	str	'MM'
str652	str	'MA'
str653	str	'AM'
str654	str	'AA'

*---

s66
	~t	#13;#113;#65;#199;#0;#0;#96	; mere
	~ok	#TRUE;s6601
	~addchar	#'M';dial
s6601
	~t	#254;#127;#319;#191;#0;#0;#96	; amandine
	~indic_equal	#96;TRUE;s6602
	brl	s6609
s6602
	~set_indic	#96;FALSE
	~ok	#TRUE;s6603
	~addchar	#'A';dial
s6603
	~charcmp	#'A';dial;s6604
	~texte	#1033
s6604
	~charcmp	#'M';dial;s6605
	~texte	#1024
s6605
	~strcmp	str661;dial;s6606
	~dialogue	salle_fin2;#1035;#1042
s6606
	~strcmp	str662;dial;s6607
	~dialogue	salle_fin2;#1044;#1055
s6607
	~strcmp	str663;dial;s6608
	~dialogue	salle_fin2;#1026;#1029
s6608
	~strcmp	str664;dial;s6609
	~texte	#1031
	jsr	attend_souris
	~set	salle_fin2;salle
s6609
	rts

str661	str	'AA'
str662	str	'AM'
str663	str	'MA'
str664	str	'MM'

*---

s67
	~t	#181;#0;#298;#72;#0;#0;#0	; psy
	~ok	#TRUE;s6701
	~indic_diff	#11;TRUE;s6701
	~dialogue	#68;#1070;#1076
s6701
	~ok	#TRUE;s6702
	~indic_diff	#11;FALSE;s6702
	~dialogue	#68;#1065;#1068
s6702
	~t	#212;#81;#296;#197;#0;#0;#0	; mere
	~ok	#TRUE;s6703
	~indic_diff	#11;TRUE;s6703	
	~dialogue	#68;#1078;#1086
s6703
	~ok	#TRUE;s6704
	~indic_diff	#11;FALSE;s6704
	~dialogue	#68;#1057;#1063
s6704
	rts

*---

s68
	~t	#181;#0;#319;#103;#1088;#-69;#0	; immeuble
	~t	#97;#86;#173;#180;#1090;#-70;#0	; photographe
	~t	#0;#0;#109;#75;#1089;#-71;#0	; redacteur
	~t	#181;#109;#319;#199;#1091;#-72;#0	; rotative
	rts

*---

s69
	~t	#198;#123;#267;#170;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s6901
	~dialogue	#73;#1093;#1098

s6901
	~t	#162;#11;#210;#109;#0;#0;#0	; secretaire

	ldx	#10
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s6902
	lda	#78
	sta	salle
	bra	s6903

s6902
	lda	#76
	sta	salle

s6903
	lda	ok
	cmp	#TRUE
	bne	s6904
	~dialogue	salle2;#1100;#1106
s6904
	rts

*---

s70
	~t	#0;#86;#37;#199;#0;#0;#0	; secretaire

	~indic_diff	#10;TRUE;s7001	; jeu TV ok
	~set	#78;salle2;s7002
s7001
	~set	#76;salle2

s7002
	~ok	#TRUE;s7003
	~dialogue	#73;#1108;#1114

s7003
	~t	#53;#95;#133;#199;#0;#0;#0	; redac chef
	~ok	#TRUE;s7004
	~dialogue	salle2;#1116;#1118

s7004
	rts

*---

s71
	~indic_diff	#10;TRUE;s7101	; jeu TV ok
	~set	#78;salle2;s7102
s7101
	~set	#76;salle2

s7102
	~t	#0;#0;#101;#89;#0;#0;#95	; secretaire
	~ok	#TRUE;s7103
	~addchar	#'S';dial

s7103
	~t	#212;#0;#319;#89;#0;#0;#95	; amandine
	~ok	#TRUE;s7104
	~addchar	#'A';dial

s7104
	~indic_equal	#95;TRUE;s7105
	brl	s7111

s7105	
	~set_indic	#95;FALSE
	~charcmp	#'S';dial;s7106
	~texte	#1120

s7106
	~strcmp		str711;dial;s7107
	~dialogue	salle2;#1122;#1128

s7107
	~strcmp		str712;dial;s7108
	~dialogue	salle2;#1130;#1133

s7108
	~charcmp	#'A';dial;s7109
	~texte	#1135

s7109
	~strcmp		str713;dial;s7110
	~dialogue	#73;#1137;#1138

s7110
	~strcmp		str714;dial;s7111
	~dialogue	#73;#1140;#1142

s7111
	rts

str711	str	'SA'
str712	str	'SS'
str713	str	'AS'
str714	str	'AA'

*---

s72
	~indic_diff	#10;TRUE;s7201	; jeu TV ok
	~set	#78;salle2;s7202
s7201
	~set	#76;salle2

s7202
	~t	#9;#39;#86;#127;#0;#0;#0	; journaliste gauche
	~ok	#TRUE;s7203
	~dialogue	salle2;#1144;#1148

s7203
	~t	#87;#47;#138;#128;#0;#0;#0	; journaliste droit
	~ok	#TRUE;s7204
	~dialogue	#73;#1150;#1153

s7204
	rts

*---

s73
	~set_indic	#160;FALSE
	~t	#135;#68;#208;#124;#0;#0;#0	; redac chef
	~ok	#TRUE;s7301
	~addchar	#'R';dial
	~set_indic	#160;#TRUE
s7301	~t	#250;#88;#319;#199;#0;#0;#0	; amandine
	~ok	#TRUE;s7302
	~addchar	#'A';dial
	~set_indic	#160;#TRUE
s7302	~charcmp	#'R';dial;s7303
	~indic_diff	#160;TRUE;s7303
	~texte	#1155
s7303	~charcmp	#'A';dial;s7304
	~indic_diff	#160;TRUE;s7304
	~texte	#1176
s7304	~strcmp		str731;dial;s7305
	~indic_diff	#160;TRUE;s7305
	~dialogue	#75;#1157;#1164
s7305	~strcmp		str732;dial;s7306
	~indic_diff	#160;TRUE;s7306
	~dialogue	#74;#1166;#1174
s7306	~strcmp		str733;dial;s7307
	~indic_diff	#160;TRUE;s7307
	~dialogue	#75;#1178;#1180
s7307	~strcmp		str734;dial;s7308
	~indic_diff	#160;TRUE;s7308
	~dialogue	#74;#1182;#1187
s7308	~indic_diff	#161;FALSE;s7309
	~t	#185;#136;#213;#155;#1189;#0;#161	; journal
	bra	s7310
s7309	~t	185;#136;#213;#155;#1190;#0;#162	; journal
s7310	~indic_diff	#163;FALSE;s7311
	~t	#133;#132;#172;#163;#1191;#0;#163	; journal
	bra	s7312
s7311	~t	#133;#132;#172;#163;#1192;#0;#164	; journal
s7312	~indic_diff	#165;FALSE;s7313
	~t	#209;#107;#230;#133;#1193;#0;#165	; journal
	bra	s7314
s7313	~t	#209;#107;#230;#133;#1194;#0;#166	; journal
s7314	rts

str731	str	'RA'
str732	str	'RR'
str733	str	'AR'
str734	str	'AA'

*---

s74
	~t	#0;#0;#319;#199;#1196;salle_fin2;#0
	rts

*---

s75
	~t	#0;#0;#319;#199;#1198;salle_fin2;#0
	rts

*---

s76
	~t	#21;#113;#53;#149;#0;#0;#0	; debile
	~ok	#TRUE;s7601
	~texte	#1200
s7601
	~t	#276;#106;#309;#143;#0;#0;#0	; poivrot
	~ok	#TRUE;s7602
	~dialogue	salle_fin2;#1218;#1219
s7602
	~t	#89;#100;#127;#126;#0;#0;#0	; barbu
	~ok	#TRUE;s7603
	~dialogue	salle_fin2;#1202;#1204
s7603
	~t	#131;#101;#153;#123;#0;#0;#0	; fille
	~ok	#TRUE;s7604
	~dialogue	salle_fin2;#1206;#1208
s7604
	~t	#176;#94;#202;#113;#0;#0;#0	; redac chef
	~ok	#TRUE;s7605
	~texte	#1210
	jsr	attend_souris
	~set	salle_fin2;salle
s7605
	~t	#219;#96;#234;#111;#0;#0;#0	; noir
	~ok	#TRUE;s7606
	~dialogue	salle_fin2;#1212;#1213
s7606
	~t	#227;#112;#245;#125;#0;#0;#0	; grincheux
	~ok	#TRUE;s7607
	~dialogue	salle_fin2;#1215;#1216
s7607
	rts

*---

s77
	~charcmp	#'8';dial;s7701;s7703	; derniere question
s7701
	~t		#97;#147;#154;#199;#0;#0;#170	; odile
	~t		#247;#122;#306;#199;#0;#0;#170	; jacques
	~t		#173;#129;#229;#199;#0;#0;#171	; amandine
	~indic_diff	#170;TRUE;s7702
	~dialogue	#0;#1285;#1286	; bonne réponse
	~set		#80;salle
s7702
	~indic_diff	#171;TRUE;s7703
	~dialogue	#0;#1285;#1286	;  bonne réponde amandine
	~set		#79;salle
	jsr		attend_souris
s7703
*
	~charcmp	#'7';dial;s7704;s7706	; derniere question
s7704
	~t		#97;#147;#154;#199;#0;#0;#170	; odile
	~t		#247;#122;#306;#199;#0;#0;#170	; jacques
	~t		#173;#129;#229;#199;#0;#0;#171	; amandine
	ldx	#170	; some real asm code ;-)
	lda	indicateur-1,x
	beq	s7705
	~dialogue	#0;#1282;#1283
	~set_indic	#170;#FALSE
	~setstring	#'8';dial
s7705
	~indic_diff	#171;TRUE;s7706
	~set		#80;salle
	jsr	attend_souris
s7706
*
	~charcmp	#'6';dial;s7707;s7709	; derniere question
s7707
	~t	#97;#147;#154;#199;#0;#0;#170	; odile
	~t	#247;#122;#306;#199;#0;#0;#170	; jacques
	~t	#173;#129;#229;#199;#0;#0;#171	; amandine
	ldx	#170	; some real asm code ;-)
	lda	indicateur-1,x
	beq	s7708
	~dialogue	#0;#1279;#1280
	~set_indic	#170;#FALSE
	~setstring	#'7';dial
s7708
	~indic_diff	#171;TRUE;s7709
	~set	#80;salle
	jsr	attend_souris
s7709
*
	~charcmp	#'5';dial;s7710;s7712	; derniere question
s7710
	~t	#97;#147;#154;#199;#0;#0;#170	; odile
	~t	#247;#122;#306;#199;#0;#0;#170	; jacques
	~t	#173;#129;#229;#199;#0;#0;#171	; amandine
	ldx	#170	; some real asm code ;-)
	lda	indicateur-1,x
	beq	s7711
	~dialogue	#0;#1276;#1277
	~set_indic	#170;#FALSE
	~setstring	#'6';dial
s7711
	~indic_diff	#171;TRUE;s7712
	~set	#80;salle
	jsr	attend_souris
s7712
*
	~charcmp	#'4';dial;s7713;s7717	; deuxieme question
s7713
	~t	#173;#129;#229;#199;#0;#0;#0	; amandine
	~ok	#TRUE;s7714
	~dialogue	#0;#1268;#1269
	jsr	attend_souris
	~set	#80;salle	; sa mère la voit
s7714
	~t	#97;#147;#154;#199;#0;#0;#0	; odile
	~ok	#TRUE;s7715
	~setstring	#'5';dial
	~dialogue	#0;#1265;#1266
s7715
	~t	#247;#122;#306;#199;#0;#0;#0	; jacques
	~ok	#TRUE;s7716
	~setstring	#'5';dial
	~dialogue	#0;#1271;#1272
s7716
	~charcmp	#'5';dial;s7717	; troisieme question
	jsr	attend_souris
	~texte	#1274
s7717
*
	~charcmp	#'3';dial;s7718;s7722	; premiere question
s7718
	~t	#173;#129;#229;#199;#0;#0;#0	; amandine
	~ok	#TRUE;s7719
	~dialogue	#0;#1256;#1257
	jsr	attend_souris
	~set	#80;salle	; sa mere la voit
s7719
	~t	#97;#147;#154;#199;#0;#0;#0	; odile
	~ok	#TRUE;s7720
	~setstring	#'4';dial
	~dialogue	#0;#1253;#1254
s7720
	~t	#247;#122;#306;#199;#0;#0;#0	; jacques
	~ok	#TRUE;s7721
	~setstring	#'4';dial
	~dialogue	#0;#1259;#1260
s7721
	~charcmp	#'4';dial;s7722	; deuxieme question
	jsr	attend_souris
	~texte	#1263
s7722
*
	~charcmp	#'2';dial;s7723;s7727	; presentation des candidats
s7723
	~t	#38;#111;#94;#199;#1228;#0;#182	; presentateur
	~t	#173;#129;#229;#199;#0;#0;#0	; amandine
	~ok	#TRUE;s7724
	~setstring	#'3';dial
	~dialogue	#0;#1236;#1241
s7724
	~t	#97;#147;#154;#199;#0;#0;#0	; odile
	~ok	#TRUE;s7725
	~setstring	#'3';dial
	~dialogue	#0;#1230;#1234
s7725
	~t	#247;#122;#306;#199;#0;#0;#0	; jacques
	~ok	#TRUE;s7726
	~setstring	#'3';dial
	~dialogue	#0;#1243;#1249
s7726
	~charcmp	#'3';dial;s7727	; luc pose la premiere question
	jsr	attend_souris
	~texte	#1251
s7727
*
	lda	dial	; presentation pas encore faite
	and	#$ff
	bne	s7728

	~t	#38;#111;#94;#199;#0;#0;#170	; presentateur
	~ok	#TRUE;s7728
	~dialogue	#0;#1224;#1226
	~setstring	#'2';dial
s7728
*
	~t	#0;#142;#29;#185;#0;#0;#0	; machine à applaudir
	~ok	#TRUE;s7729
	~son	#7500;#2;TRUE
s7729
	rts

*---

s78
	~t	#0;#0;#319;#199;#1222;#77;#0
	rts

*---

s79
	~t	#80;#39;#119;#102;#1306;#0;#122	; jaune
	~t	#163;#27;#209;#69;#1288;#0;#123	; luc
	~t	#131;#43;#162;#102;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s7901
	~dialogue	#82;#1290;#1296

s7901
	~t	#216;#62;#255;#102;#0;#0;#124	; odile
	lda	ok
	cmp	#TRUE
	bne	s7902
	~dialogue	#0;#1298;#1304

s7902
	ldx	#124
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s7903
	brl	s7904

s7903
	~t	#264;#73;#284;#100;#1308;#0;#125	; livre 1
	~t	#261;#107;#277;#112;#1309;#0;#126
	~t	#261;#114;#277;#119;#1310;#0;#127
	~t	#261;#121;#277;#126;#1311;#0;#128
	~t	#261;#128;#277;#133;#1312;#0;#129
	~t	#261;#135;#277;#140;#1313;#0;#130
	~t	#261;#142;#277;#147;#1314;#0;#131	; livre7

s7904
	rts

*---

s80
	~set	#81;salle
	rts

*---

s81
	~t	#48;#22;#94;#45;#0;#0;#0	; odile
	lda	ok
	cmp	#TRUE
	bne	s8101
	~dialogue	salle_fin2;#1316;#1319

s8101
	~t	#124;#31;#152;#45;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s8102
	~dialogue	salle_fin2;#1321;#1325

s8102
	~t	#110;#46;#162;#139;#0;#0;#0	; luc
	lda	ok
	cmp	#TRUE
	bne	s8103
	~dialogue	salle_fin2;#1332;#1335

s8103
	~t	#10;#68;#106;#150;#0;#0;#0	; mere
	lda	ok
	cmp	#TRUE
	bne	s8104
	~dialogue	salle_fin2;#1327;#1330

s8104
	rts

*---

s82
	~t	#220;#12;#250;#62;#0;#0;#135	; rap
	lda	ok
	cmp	#TRUE
	bne	s8201
	
	~son	#7100;#12;FALSE

s8201
	ldx	#119
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s8202
	lda	#83
	sta	salle2
	bra	s8203

s8202
	lda	#84
	sta	salle2
	
s8203
	~t	#0;#3;#27;#63;#1337;salle2;#0	; hotesse
	~t	#98;#16;#128;#62;#1339;salle2;#0	; amandine
	~t	#131;#22;#158;#61;#1338;salle2;#0	; vieux
	rts

*---

s83
	~t	#213;#13;#300;#95;#0;#0;#0	; bob
	lda	ok
	cmp	#TRUE
	bne	s8301

	ldx	#134
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20
	~addchar	#'B';dial

s8301
	~t	#57;#26;#79;#88;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s8302

	ldx	#134
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20
	~addchar	#'A';dial

s8302
	ldx	#134
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s8303
	brl	s8309

s8303
	ldx	#134
	lda	#FALSE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	~charcmp	#'A';dial
	bne	s8304
	~texte	#1355

s8304
	~charcmp	#'B';dial
	bne	s8305
	~texte	#1344

s8305
	~strcmp	dial;str831
	bne	s8306
	~dialogue	#84;#1346;#1349

s8306
	~strcmp	dial;str832
	bne	s8307
	~dialogue	#84;#1351;#1353

s8307
	~strcmp	dial;str833
	bne	s8308
	~dialogue	#84;#1357;#1365

s8308
	~strcmp	dial;str834
	bne	s8309
	~dialogue	#84;#1367;#1369

s8309
	~t	#84;#23;#195;#103;#1342;#0;#132	; foule
	~t	#96;#0;#194;#20;#1341;#0;#133	; aero
	rts

str831	str	'BA'
str832	str	'BB'
str833	str	'AB'
str834	str	'AA'

*---

s84
	~t	#205;#96;#234;#163;#1371;#0;#169	; amandine
	~t	#0;#124;#42;#199;#1373;#87;#0	; plage
	~t	#85;#170;#261;#199;#1372;#-93;#0	; hotel
	~t	#263;#87;#319;#178;#1374;#-85;#0	; elastique
	rts

*---

s85
	~t	#0;#107;#26;#130;#0;#86;#0	; amandine
	~t	#13;#60;#39;#106;#1376;#0;#136	; cadre
	~t	#66;#70;#100;#129;#1377;#0;#137	; moniteur
	~t	#82;#22;#109;#49;#1378;#0;#138	; aviateur
	~t	#227;#145;#255;#199;#0;#0;#139	; homme 1
	lda	ok
	cmp	#TRUE
	bne	s8501
	~dialogue	#0;#1380;#1381

s8501
	~t	#52;#22;#76;#58;#0;#0;#140	; matelas
	lda	ok
	cmp	#TRUE
	bne	s8502
	~dialogue	#0;#1383;#1384

s8502
	~t	#267;#121;#295;#146;#0;#0;#141	; homme 2
	lda	ok
	cmp	#TRUE
	bne	s8503
	~dialogue	#0;#1386;#1391

s8503
	rts

*---

s86
	ldx	#119
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s8601
	ldx	#32
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s8601
	lda	#-90	; bob et amandine ensemble, veut un bébé, devient mère
	sta	salle2

s8601
	ldx	#119
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s8602
	ldx	#32
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s8602
	lda	#-51	; bob mais pas de bébé, statues
	sta	salle2

s8602
	ldx	#119
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s8603
	lda	#-90	; pas de bob, vieille fille
	sta	salle2

s8603
	~t	#0;#0;#319;#199;#1393;salle2;#0
	rts

*---

s87
	~t	#12;#86;#30;#111;#1396;#92;#142	; amandine
	~t	#122;#60;#149;#77;#1398;#0;#143	; affiche plage
	~t	#183;#59;#211;#76;#1397;#0;#144	; affiche lessive
	~t	#261;#60;#288;#76;#1399;#0;#145	; affiche général
	~t	#159;#67;#182;#88;#0;#88;#0	; soldats
	~t	#214;#59;#226;#83;#0;#0;#146	; cabine 1
	lda	ok
	cmp	#TRUE
	bne	s8701
	~dialogue	#0;#1402;#1404

s8701
	~t	#227;#62;#243;#83;#0;#0;#147	; cabine 2
  	lda	ok
	cmp	#TRUE
	bne	s8702
	~dialogue	#0;#1406;#1407

s8702
	~t	#247;#69;#259;#87;#1395;#89;#0	; mère
	~t	#68;#95;#85;#111;#1400;#0;#148	; sss
	rts
	
*---

s88
	~t	#2;#101;#66;#197;#0;#0;#0	; flic1
  	lda	ok
	cmp	#TRUE
	bne	s8801
	~dialogue	#92;#1412;#1419

s8801
	~t	#67;#105;#105;#147;#1410;#0;#173	; flic2
	~t	#138;#122;#168;#194;#0;#0;#0	; amandine
  	lda	ok
	cmp	#TRUE
	bne	s8802
	~dialogue	#92;#1421;#1427

s8802
	rts

*---

s89
	~t	#0;#0;#66;#199;#0;#0;#0	; mère
	lda	ok
	cmp	#TRUE
	bne	s8901

	~addchar	#'M';dial
	ldx	#174
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s8901
	~t	#72;#125;#242;#199;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s8902

	~addchar	#'A';dial
	ldx	#174
	lda	#TRUE
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

s8902
	ldx	#174
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s8903
	brl	s8909

s8903
	ldx	#174
	lda	#FALSE	; indicateur!=FALSE - LOGO
	sep	#$20
	sta	indicateur-1,x
	rep	#$20

	~charcmp	#'M';dial
	bne	s8904
	~texte	#1430

s8904
	~strcmp	dial;str891
	bne	s8905
	~dialogue	#92;#1432;#1439

s8905
	~strcmp	dial;str892
	bne	s8906
	~dialogue	#92;#1441;#1447

s8906
	~charcmp	#'A';dial
	bne	s8907
	~texte	#1449

s8907
	~strcmp	dial;str893
	bne	s8908
	~dialogue	#92;#1451;#1454

s8908
	~strcmp	dial;str894
	bne	s8909
	~dialogue	#92;#1456;#1463

s8909
	~t	#94;#98;#108;#107;#1465;#0;#175	; disquette
	~t	#138;#16;#157;#46;#1466;#0;#176	; vieux
	rts

str891	str	'MM'
str892	str	'MA'
str893	str	'AM'
str894	str	'AA'

*---

s90
	~t	#183;#141;#199;#151;#1469;#0;#177	; pancarte
	~t	#39;#88;#81;#175;#1470;#0;#178	; mère
	~t	#201;#144;#265;#196;#1471;#0;#179	; enfants bcbg
	~t	#277;#109;#319;#199;#1472;#0;#180	; mère bcbg
	~t	#109;#148;#139;#183;#1473;#0;#181	; enfant amandine
	~t	#140;#104;#182;#193;#1474;salle_fin;#0	; amandine
	rts

*---

s91
	~t	#165;#100;#189;#141;#1477;salle_fin;#0	; chat
	~t	#194;#101;#262;#199;#1478;salle_fin;#0	; amandine
	rts

*---

s92
	~t	#0;#100;#57;#199;#0;#0;#0	; brune
	lda	ok
	cmp	#TRUE
	bne	s9201
	~dialogue	salle_fin2;#1480;#1485
s9201
	~t	#24;#48;#62;#99;#1487;salle_fin2;#0	; lunettes
	~t	#68;#41;#102;#72;#0;#0;#0	; gaby
	lda	ok
	cmp	#TRUE
	bne	s9202
	~dialogue	salle_fin2;#1489;#1491
s9202
	~t	#103;#58;#135;#118;#1493;salle_fin2;#0	; amandine
	~t	#124;#34;#164;#57;#0;#0;#0	; brune
	lda	ok
	cmp	#TRUE
	bne	s9203
	~dialogue	salle_fin2;#1495;#1501
s9203
	~t	#165;#49;#201;#138;#0;#0;#0	; blonde
	lda	ok
	cmp	#TRUE
	bne	s9204
	~dialogue	salle_fin2;#1503;#1507
s9204
	~t	#205;#70;#254;#156;#1509;salle_fin2;#0	; chatain
	rts

*---

s93
	~t	#39;#44;#110;#115;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s9301
	~dialogue	#95;#1512;#1520
s9301
	~t	#111;#34;#224;#115;#0;#0;#0	; mike vincent
	lda	ok
	cmp	#TRUE
	bne	s9302
	~dialogue	#94;#1522;#1528
s9302
	~t	#244;#10;#286;#94;#0;#0;#167	; homme en blanc
	lda	ok
	cmp	#TRUE
	bne	s9303
	~dialogue	#0;#1530;#1534
s9303
	~t	#294;#15;#319;#49;#0;#0;#167	; femme
	lda	ok
	cmp	#TRUE
	bne	s9304
	~dialogue	#0;#1536;#1538
s9304
	rts

*---

s94
	~t	#32;#88;#70;#199;#1542;salle_fin;#0	; amandine
	~t	#71;#71;#122;#199;#1541;salle_fin;#0	; mike
	~t	#125;#82;#174;#199;#1543;salle_fin;#0	; danseuse
	rts

*---

s95
	~dialogue	#96;#1546;#1551
	rts

*---

s96
	~t	#252;#105;#319;#199;#0;#0;#0	; nudiste
	lda	ok
	cmp	#TRUE
	bne	s9601
	~dialogue	#97;#1554;#1559
s9601
	~t	#160;#3;#235;#94;#0;#0;#0	; ministre
	lda	ok
	cmp	#TRUE
	bne	s9602
	~dialogue	#97;#1561;#1567
s9602
	~t	#238;#0;#319;#80;#0;#0;#0	; general
	lda	ok
	cmp	#TRUE
	bne	s9603
	~dialogue	#98;#1569;#1572
s9603
	rts

*---

s97
*	~t	#79;#34;#130;#101;#1587;salle_fin2;#0	; fille
	~t	#79;#34;#130;#101;#0;#0;#0	; fille
	lda	ok
	cmp	#TRUE
	bne	s9701
	~dialogue	salle_fin2;#1793;#1796
s9701
	~t	#185;#21;#237;#80;#0;#0;#0	; journaliste
	lda	ok
	cmp	#TRUE
	bne	s9702
	~dialogue	salle_fin2;#1575;#1585
s9702
*	~t	#131;#29;#180;#87;#1588;salle_fin2;#0	; animateur
	~t	#131;#29;#180;#87;#0;#0;#0	; animateur
	lda	ok
	cmp	#TRUE
	bne	s9703
	~dialogue	salle_fin2;#1588;#1590
s9703
	rts

*---

s98
	lda	#TRUE
	sta	fade
	lda	#99
	sta	salle
	rts

*---

s99
	ldx	#119
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	s9901
	lda	#100
	sta	salle2
	bra	s9902
s9901
	lda	#101
	sta	salle2
s9902
	~t	#18;#2;#100;#98;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s9903
	~dialogue	salle2;#1601;#1609
s9903
	~t	#182;#22;#277;#120;#0;#0;#0	; redac chef
	lda	ok
	cmp	#TRUE
	bne	s9904
	~dialogue	salle2;#1591;#1599
s9904
	rts

*---

s100
	ldx	#32	; veut un enfant
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	beq	s10001
	brl	s10009

s10001
	~t	#0;#11;#54;#137;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s10002
	~addchar	#'A';dial

s10002
 	~t	#67;#25;#160;#137;#0;#0;#0	; tom
	lda	ok
	cmp	#TRUE
	bne	s10003
	~addchar	#'T';dial

s10003
	~charcmp	#'A';dial
	bne	s10004
	~texte	#1615

s10004
	~strcmp	dial;str1001
	bne	s10005
	~dialogue	#102;#1617;#1625

s10005
	~strcmp	dial;str1002
	bne	s10006
	~dialogue	#102;#1627;#1629

s10006
	~charcmp	#'T';dial
	bne	s10007
	~texte	#1631

s10007
	~strcmp	dial;str1003
	bne	s10008
	~dialogue	#102;#1633;#1641
    
s10008
	~strcmp	dial;str1004
	bne	s10009
	~dialogue	#102;#1643;#1652

s10009
	ldx	#32
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	s10011

*	~t	#0;#11;#54;#137;#1613;#51;#0	; amandine
	~t	#0;#11;#54;#137;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s10010
	~dialogue	#51;#1799;#1800

s10010
*	~t	#67;#25;#180;#137;#1612;#51;#0	; tom
	~t	#67;#25;#180;#137;#0;#0;#0	; tom
	lda	ok
	cmp	#TRUE
	bne	s10011
	~dialogue	#51;#1797;#1798

s10011
	rts

str1001	str	'AT'
str1002	str	'AA'
str1003	str	'TT'
str1004	str	'TA'

*---

s101
	~t	#0;#20;#100;#105;#0;#0;#0 ; amandine
	lda	ok
	cmp	#TRUE
	bne	s10101
	~addchar	#'A';dial

s10101
	~t	#109;#26;#182;#105;#0;#0;#0	; secretaire
	lda	ok
	cmp	#TRUE
	bne	s10102
	~addchar	#'S';dial

s10102
	~charcmp	#'S';dial
	bne	s10103
	~texte	#1655

s10103
	~strcmp	dial;str1011
	bne	s10104
	~dialogue	salle_fin2;#1657;#1671

s10104
	~strcmp	dial;str1012
	bne	s10105
	~dialogue	salle_fin2;#1673;#1680

s10105
	~charcmp	#'A';dial
	bne	s10106
	~texte	#1682

s10106
	~strcmp	dial;str1013
	bne	s10107
	~dialogue	salle_fin2;#1684;#1687

s10107
	~strcmp	dial;str1014
	bne	s10108
	~dialogue	salle_fin2;#1689;#1698

s10108
	rts

str1011	str	'SS'
str1012	str	'SA'
str1013	str	'AS'
str1014	str	'AA'

*---

s102
*	~t	#255;#11;#311;#98;#1789;#0;#183	; presentateur
	~t	#255;#11;#311;#98;#0;#0;#183	; presentateur
	lda	ok
	cmp	#TRUE
	bne	s10200
	~dialogue	salle_fin2;#1789;#1790
s10200
	~t	#192;#0;#239;#60;#0;#0;#0	; gros
	lda	ok
	cmp	#TRUE
	bne	s10201
	~dialogue	salle_fin2;#1729;#1739
s10201
	~t	#37;#28;#76;#57;#0;#0;#0	; chauve
	lda	ok
	cmp	#TRUE
	bne	s10202
	~dialogue	salle_fin2;#1714;#1727
s10202
	~t	#184;#64;#221;#104;#0;#0;#0	; brun
	lda	ok
	cmp	#TRUE
	bne	s10203
	~dialogue	salle_fin2;#1741;#1759
s10203
	~t	#81;#57;#101;#77;#0;#0;#0	; gros sourcils
	lda	ok
	cmp	#TRUE
	bne	s10204
	~dialogue	salle_fin2;#1774;#1787
s10204
	~t	#90;#12;#130;#53;#0;#0;#0	; barbu
	lda	ok
	cmp	#TRUE
	bne	s10205
	~dialogue	salle_fin2;#1761;#1772
s10205
	~t	#137;#0;#188;#61;#0;#0;#0	; amandine
	lda	ok
	cmp	#TRUE
	bne	s10206
	~dialogue	salle_fin2;#1701;#1712
s10206
	rts

*--- Les deux perdus et le gagné

s103
s104
	jsr	initialisation2
	lda	#1
	sta	salle
	jmp	attend_souris
	
*-----------------------
* t
*-----------------------
* F,s xx%
* D,s yy%
* B,s xx2%
* 9,s yy2%
* 7,s nouveau_texte%
* 5,s nouvelle_salle%
* 3,s indicateur%
* 1,s RTS

t
	lda	#FALSE
	sta	ok

	lda	taskWHERE+2
	cmp	15,s
	bcc	t1
	lda	11,s
	cmp	taskWHERE+2
	bcc	t1

	lda	taskWHERE
	cmp	13,s
	bcc	t1
	lda	9,s
	cmp	taskWHERE
	bcs	t2

t1	brl	t9	; wrong click

*--- Teste la fin du son

t2
	brl	t2_bis
	
	lda	follow
	beq	t2_bis

	pha
	PushWord #7
	_FFGeneratorStatus
	pla
	and	#%10000000_00000000
	beq	t2_bis

	stz	follow	; le son est fini

*	lda	seqPlay	; midi playing
*	beq	t2_bis	; nope
*
*	_MSResume

*---

t2_bis

	lda	3,s	; indicateur(indicateur)=0
	beq	t3
	tax		; indicateur(indicateur)=false
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	t1

t3
	sep	#$20
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

	lda	7,s
	sta	nouveau_texte
	
	lda	5,s	; if nouvelle_salle < 0
	bpl	t4	; fade = true

	ldx	#TRUE
	stx	fade

	eor	#-1	; set ABS(nouvelle_salle)
	inc		; c'est le complément à 2
t4
	sta	nouvelle_salle

	bne	t5	; if nouveau_texte <> 0 and nouvelle_salle = 0
	lda	nouveau_texte
	beq	t5
	jsr	texte
	
	lda	#TRUE
	sta	ok

*---

t5	
	lda	nouvelle_salle
	beq	t6
	lda	nouveau_texte
	beq	t6
	jsr	texte
	jsr	attend_souris
* while ... wend
	lda	nouvelle_salle
	sta	salle
	
*	cmp	#2	; la chambre d'Amandine
*	bne	t5_bis
*
*	lda	#1
*	sta	follow
	
t5_bis
	lda	#TRUE
	sta	ok

*---

t6
	lda	nouvelle_salle
	beq	t7
	lda	nouveau_texte
	bne	t7
	
	lda	nouvelle_salle
	sta	salle
	
*	cmp	#2
*	bne	t7
*
*	lda	#1
*	sta	follow

*---

t7
	lda	#TRUE
	sta	ok

*---

t9	
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	plx
	plx
	plx
	plx
	plx
	sta	1,s	; remet le RTS

*--- The following 6 bytes would have saved hundreds of others...	

*	lda	ok
*	cmp	#TRUE
	rts

*-----------------------
* touche
*-----------------------
*
*touche
*	rts
*
*-----------------------
* charge
*-----------------------
*
*charge
*	rts
*
*-----------------------
* ecrit
*-----------------------
*
*ecrit
*	rts
*
*-----------------------
* changement_salle
*-----------------------

changement_salle
	lda	salle
	bne	changement_salle1
	rts
changement_salle1
	lda	salle
	cmp	ancienne_salle
	bne	changement_salle2
	rts
changement_salle2
	jsr	image
	jsr	sonorisation
	jsr	jingle
	jsr	fenetre
	lda	salle
	sta	ancienne_salle
	stz	dial
	stz	numero
	rts
*	jmp	curseur

*-----------------------
* changement_texte
*-----------------------
*
*changement_texte
*	rts
*
*-----------------------
* initialisation
*-----------------------

initialisation
	sep	#$20

	ldx	#NB_INDICATEURS
	lda	#FALSE
]lp	sta	indicateur-1,x
	dex
	bne	]lp

	rep	#$20

	lda	#1
	sta	salle
	stz	ancienne_salle
	rts

*-----------------------
* init_resolution
*-----------------------
*
*init_resolution
*	rts
*
*-----------------------
* init_constantes
*-----------------------

init_constantes
	lda	#NB_SALLES
	sta	nombre_salle
	dec
	sta	salle_fin2
	dec
	sta	salle_fin
	rts

*-----------------------
* init_routine_tiny
*-----------------------
*
*init_routine_tiny
*	rts
*
*-----------------------
* init_routine_son
*-----------------------
*
*init_routine_son
*	rts
*
*-----------------------
* init_fondu
*-----------------------
*
*init_fondu
*	rts
*
*-----------------------
* init_image_titre
*-----------------------
*
*init_image_titre
*	lda	#FALSE
*	sta	fade
*	stz	salle
*	lda	#TRUE
*	sta	fade
*	jmp	image
*
*-----------------------
* init_souris
*-----------------------
*
*init_souris
*	rts
*
*-----------------------
* init_fenetres_texte
*-----------------------
*
*init_fenetres_texte
*	rts
*
*-----------------------
* load_font
*-----------------------

load_font
	jsr	font_it
	bcc	lf_ok

        pha
        PushLong #fntSTR1
        PushLong #fntSTR2
        PushLong #errSTR3
        PushLong #errSTR2
        _TLTextMountVolume
        pla

lf_ok
	rts

*--- Really load the font

font_it
	PushWord #$0900
	PushWord #$0016		; Courier.9
	PushWord #0
	_InstallFont
	rts
	
*-----------------------
* set_texte
*-----------------------

set_texte
	PushWord #0
	PushWord #$29
	_ReadBParam
	pla
	cmp	#20
	bcc	st_ok
	rts

* index
* TEXTES : +16
* DEDICACES : +16
* SOUSTITRES : +16

st_ok
	jsr	st_setit	; try IIgs language
	bcc	st_ok99
	
	lda	#0	; if not, try EN US
	jsr	st_setit
	bcc	st_ok99

	lda	#2	; it not, force FR - It always exists
	jsr	st_setit
st_ok99
	rts

*---

st_setit		; set language code
	sta	saveLANGUAGE
	asl
	tax
	lda	tblLANG,x
	sta	pDEDICACES+16
	sta	pSOUSTITRES+16
	sta	pTEXTES+16

	lda	#pTEXTES	; check file exists
	sta	proOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	st_setit99
	
	lda	proOPEN+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

st_setit99
	rts

*---
	
tblLANG
	asc	'us'	; 0
	asc	'uk'
	asc	'fr'	; 2
	asc	'nl'
	asc	'es'
	asc	'it'
	asc	'de'
	asc	'se'
	asc	'us'
	asc	'ca'
	asc	'nl'	; 10
	asc	'he'
	asc	'jp'
	asc	'ar'
	asc	'gr'
	asc	'tr'
	asc	'fi'
	asc	'ta'
	asc	'hi'
	asc	'us'	; 19

*-----------------------
* load_texte
*-----------------------

load_texte
	lda	#pTEXTES
	sta	proOPEN+4

	jsl	GSOS
        dw	$2010
        adrl	proOPEN
        bcs	lt_err2

        lda	proOPEN+2
        sta	proREAD+2
        sta	proCLOSE+2

        lda	proEOF
        sta	proREAD+8
        lda	proEOF+2
        sta	proREAD+10

	PushLong #0
	PushLong proEOF
	PushWord myID
	PushWord #%11000000_00001100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda   [3]
	sta   ptrTEXTES
	sta   proREAD+4
	ldy   #2
	lda   [3],y
	sta   ptrTEXTES+2
	sta   proREAD+6
	pld
	pla
	pla
	bcc   lt_ok
	
lt_err
	jsl	GSOS
        dw	$2014
        adrl	proCLOSE

lt_err2
	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

lt_ok
        jsl	GSOS
        dw	$2012
        adrl	proREAD
        bcs	lt_err

	jsl	GSOS
        dw	$2014
        adrl	proCLOSE
	rts

*-----------------------
* load_dedicaces
*-----------------------

load_dedicaces
	lda	#pDEDICACES
	sta	proOPEN+4

	jsl	GSOS
        dw	$2010
        adrl	proOPEN
        bcs	ld_err2

        lda	proOPEN+2
        sta	proREAD+2
        sta	proCLOSE+2

        lda	proEOF
        sta	proREAD+8
        lda	proEOF+2
        sta	proREAD+10

	PushLong #0
	PushLong proEOF
	PushWord myID
	PushWord #%11000000_00001100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda   [3]
	sta   ptrDEDICACES
	sta   proREAD+4
	ldy   #2
	lda   [3],y
	sta   ptrDEDICACES+2
	sta   proREAD+6
	pld
	pla
	pla
	bcc   ld_ok
	
ld_err
	jsl	GSOS
        dw	$2014
        adrl	proCLOSE

ld_err2
	stz	ptrDEDICACES	; force reset
	stz	ptrDEDICACES+2
	rts
	
ld_ok
        jsl	GSOS
        dw	$2012
        adrl	proREAD
        bcs	ld_err

	jsl	GSOS
        dw	$2014
        adrl	proCLOSE
	rts

*-----------------------
* load_soustitres
*-----------------------

load_soustitres
	lda	#pSOUSTITRES
	sta	proOPEN+4

	jsl	GSOS
        dw	$2010
        adrl	proOPEN
        bcs	ls_err2

        lda	proOPEN+2
        sta	proREAD+2
        sta	proCLOSE+2

        lda	proEOF
        sta	proREAD+8
        lda	proEOF+2
        sta	proREAD+10

	PushLong #0
	PushLong proEOF
	PushWord myID
	PushWord #%11000000_00001100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda   [3]
	sta   ptrSOUSTITRES
	sta   proREAD+4
	ldy   #2
	lda   [3],y
	sta   ptrSOUSTITRES+2
	sta   proREAD+6
	pld
	pla
	pla
	bcc   ls_ok
	
ls_err
	jsl	GSOS
        dw	$2014
        adrl	proCLOSE

ls_err2
	stz	ptrSOUSTITRES
	stz	ptrSOUSTITRES+2
	
ls_ok
        jsl	GSOS
        dw	$2012
        adrl	proREAD
        bcs	ls_err

	jsl	GSOS
        dw	$2014
        adrl	proCLOSE
	rts

*-----------------------
* init_texte
*-----------------------

init_texte
	stz	nbTEXTES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	it1
	rts

it1
	lda	ptrTEXTES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrTEXTES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2
	
it2
	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	it3
	lda	dpFROM
	cmp	dpTO
	bcc	it3
	rts		; we are done!

it3
	lda	[dpFROM]
	and	#$ff
	cmp	#'*'	; do we have a new string?
	beq	it4

* LOGO

*	cmp	#$0d	; return
*	bne	it3alt
*	sep	#$20
*	lda	#0
*	sta	[dpFROM]
*	rep	#$20

it3alt
	inc	dpFROM	; next char, please
	bne	it2
	inc	dpFROM+2
	bra	it2

it4	inc	dpFROM	; we skip the *
	bne	it5
	inc	dpFROM+2

it5
	lda	nbTEXTES	; save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblTEXTES,x
	lda	dpFROM+2
	sta	tblTEXTES+2,x

	inc	nbTEXTES	; increment the number of strings
	lda	nbTEXTES	; into our limit
	cmp	#NB_TEXTES
	bcc	it2
	rts

*-----------------------
* init_dedicaces
*-----------------------

init_dedicaces
	stz	nbDEDICACES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	id1
	rts

id1
	lda	ptrDEDICACES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrDEDICACES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2

id2
	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	id3
	lda	dpFROM
	cmp	dpTO
	bcc	id3
	rts		; we are done!

id3
	lda	[dpFROM]
	and	#$ff
	cmp	#'*'	; do we have a new string?
	beq	id4

	cmp	#$0a	; le LF
	beq	id3bis
	cmp	#$0d	; le CR
	bne	id3alt
id3bis
	sep	#$20
	lda	#0
	sta	[dpFROM]
	rep	#$20

id3alt
	inc	dpFROM	; next char, please
	bne	id2
	inc	dpFROM+2
	bra	id2

id4	sep	#$20	; put a 00 for a C-string
	lda	#0
	sta	[dpFROM]
	rep	#$20

	inc	dpFROM	; we skip the *
	bne	id5
	inc	dpFROM+2

id5
	lda	nbDEDICACES	; save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblDEDICACES,x
	lda	dpFROM+2
	sta	tblDEDICACES+2,x

	inc	nbDEDICACES	; increment the number of strings
	lda	nbDEDICACES	; into our limit
	cmp	#NB_DEDICACES
	bcc	id2
	rts

*-----------------------
* init_soustitres
*-----------------------

init_soustitres
	stz	nbSOUSTITRES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	is1
	rts

is1
	lda	ptrSOUSTITRES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrSOUSTITRES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2

is2
	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	is3
	lda	dpFROM
	cmp	dpTO
	bcc	is3
	rts		; we are done!

is3
	lda	[dpFROM]
	and	#$ff
	cmp	#'*'	; do we have a new string?
	beq	is4

	cmp	#$0a	; le LF
	beq	is3bis
	cmp	#$0d	; le CR
	bne	is3alt
is3bis
	sep	#$20
	lda	#0
	sta	[dpFROM]
	rep	#$20

is3alt
	inc	dpFROM	; next char, please
	bne	is2
	inc	dpFROM+2
	bra	is2

is4	sep	#$20	; put a 00 for a C-string
	lda	#0
	sta	[dpFROM]
	rep	#$20

	inc	dpFROM	; we skip the *
	bne	is5
	inc	dpFROM+2

is5
	lda	nbSOUSTITRES	; save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblSOUSTITRES,x
	lda	dpFROM+2
	sta	tblSOUSTITRES+2,x

	inc	nbSOUSTITRES	; increment the number of strings
	lda	nbSOUSTITRES	; into our limit
	cmp	#NB_SOUSTITRES
	bcc	is2
	rts

*-----------------------
* initialisation2
*-----------------------

initialisation2
	lda	#1
	sta	salle
	lda	#149
	sta	texte_enfant
	
	sep	#$20
	ldx	#NB_INDICATEURS
]lp	stz	indicateur-1,x
	dex
	bne	]lp
	rep	#$20
	
	stz	numero
	stz	dial
	stz	ancienne_salle
	stz	salle_bain
	rts
	
*-----------------------
* image
*-----------------------
*
*image
*	jsr	souris_off
*	jsr	tiny_load
*	jsr	tiny_disp
*	jsr	tiny_palette
*	jmp	souris_on
*
*-----------------------
* tiny_load
*-----------------------
*
*tiny_load
*	rts
*
*-----------------------
* tiny_disp
*-----------------------
*
*tiny_disp
*	rts
*
*-----------------------
* tiny_palette
*-----------------------
*
*tiny_palette
*	rts
*
*-----------------------
* fade_image
*-----------------------
*
*fade_image
*	rts
*
*-----------------------
* fadein
*-----------------------
*
*fadein
*	rts
*
*-----------------------
* fadeout
*-----------------------
*
*fadeout
*	rts
*
*-----------------------
* fenetre(a%, b%, c%, d%)
*-----------------------

fenetre
	lda	salle
	beq	fenetre9
	dec
	asl
	asl
	asl
	tax
	lda	tblFENETRE+2,x
	sta	myRECT
	lda	tblFENETRE,x
	sta	myRECT+2
	lda	tblFENETRE+6,x
	sta	myRECT+4
	lda	tblFENETRE+4,x
	sta	myRECT+6

*	PushLong #myRECT
*	_FrameRect

fenetre9
	rts

*-----------------------
* texte(texte_affiche%)
*-----------------------

texte
	cmp	#0
	bne	texte1
	rts
texte1
	cmp	nbTEXTES
	bcc	texte2
	beq	texte2
	rts
texte2
	sta	le_texte
	dec
	asl
	asl
	tax
	lda	tblTEXTES+2,x	; get pointer to string
	pha
	lda	tblTEXTES,x
	pha

	lda	tblTEXTES+4,x	; calculate length
	sec
	sbc	tblTEXTES,x
	dec
	pha			; push length

	PushLong #myRECT
	PushWord #0	; left justified
	_LETextBox2
	rts

myRECT	dw	161
	dw	2
	dw	198
	dw	317
	
*-----------------------
* dialogue
*-----------------------
* 7,s destination%
* 5,s debut%
* 3,s fin%
* 1,s RTS

dialogue
	lda	7,s
	sta	temp_salle
	lda	5,s
	sta	debut
	lda	3,s
	sta	fin

]lp	lda	debut
	jsr	texte
	jsr	attend_souris

	inc	debut
	lda	debut
	cmp	fin
	bcc	]lp
	beq	]lp
	
	lda	temp_salle
	beq	dialogue9
	sta	salle

dialogue9
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	plx
	sta	1,s	; remet le RTS
	rts

more_variables
debut	ds	2
fin	ds	2
temp_salle	ds	2

*-----------------------
* curseur
*-----------------------
*
*curseur
*	rts
*
*-----------------------
* attend_souris
*-----------------------

attend_souris
	PushWord #0
	PushWord #%00000000_00000100
	PushLong #taskREC
	_GetNextEvent

*---

	lda	follow
	beq	as_bis

	pha
	PushWord #7
	_FFGeneratorStatus
	pla
	and	#%10000000_00000000
	beq	as_bis

	stz	follow	; le son est fini

*	lda	seqPlay	; midi playing
*	bne	as_bis	; nope
*
*	_MSResume

as_bis

*---

	pla
	beq	attend_souris
	rts

*-----------------------
* attend_souris_touche
*-----------------------
*
*attend_souris_touche
*	PushWord #0
*	PushWord #%00000000_00001100
*	PushLong #taskREC
*	_GetNextEvent
*	pla
*	beq	attend_souris_touche
*	rts
*
*-----------------------
* souris_off
*-----------------------

souris_off
	_HideCursor
	rts

*-----------------------
* souris_on
*-----------------------

souris_on
	_ShowCursor
	rts

*-----------------------
* sonorisation
*-----------------------

sonorisation
	jsr	stop_son

	lda	salle
	cmp	#5
	beq	sono1
	cmp	#10
	beq	sono1
	cmp	#11
	beq	sono1
	cmp	#28
	beq	sono1
	cmp	#44
	beq	sono1
	cmp	#45
	beq	sono1
	cmp	#77
	beq	sono1
	cmp	#79
	beq	sono1
	cmp	#82
	beq	sono1
	cmp	#86
	beq	sono1
	cmp	#87
	beq	sono1
	cmp	#89
	beq	sono1
	cmp	#95
	beq	sono1
	cmp	#98
	bne	sono2
sono1	jsr	charge_son

sono2	lda	salle
	cmp	#24+1
	bcs	sono4
	cmp	#22
	bcc	sono4
	lda	#22
	jsr	charge_son

sono4	lda	salle
	cmp	#40+1
	bcs	sono6
	cmp	#34
	bcc	sono6
	lda	#34
	jsr	charge_son

sono6	lda	salle	; telephone sonne
	cmp	#2
	bne	sono7
	lda	ancienne_salle
	cmp	#1
	bne	sono7
	lda	#2
	jsr	charge_son
        ~son	#4200;#6;FALSE
sono7
	lda	salle	; restaurant brouhaha
	cmp	#13
	bne	sono8
	jsr	charge_son
	~son	#10000;#12;FALSE
sono8
	lda	salle	; marché
	cmp	#27
	bne	sono9
	jsr	charge_son
	~son	#7500;#12;FALSE
sono9
	lda	salle	; vernissage
	cmp	#43
	bne	sono10
	jsr	charge_son
	~son	#7500;#12;FALSE
sono10
	lda	salle	; aspirateur
	cmp	#52
	bne	sono11
	jsr	charge_son
	~son	#7500;#12;FALSE
sono11
	lda	salle	; woody
	cmp	#59
	bne	sono12
	jsr	charge_son
	~son	#7500;#12;FALSE
sono12
	lda	salle	; soirée coke,cheb
	cmp	#64
	bne	sono13
	jsr	charge_son
	~son	#4915;#12;FALSE
sono13
	lda	salle	; tele erasure
	cmp	#65
	bne	sono14
	jsr	charge_son
	~son	#5600;#12;FALSE
sono14
	lda	salle	; Afrique
	cmp	#66
	bne	sono15
	jsr	charge_son
	~son	#10000;#12;FALSE
sono15
	lda	salle	; psy
	cmp	#67
	bne	sono16
	jsr	charge_son
	~son	#10000;#12;FALSE
sono16
	lda	salle	; groupe
	cmp	#78
	bne	sono17
	jsr	charge_son
	~son	#8000;#12;FALSE
sono17
	lda	salle	; danseuses
	cmp	#94
	bne	sono18
	jsr	charge_son
	~son	#9400;#12;FALSE
sono18
	lda	salle
	cmp	#103	; fin 1
	beq	sono19
	cmp	#104	; fin 2
	bne	sono20
sono19
	jsr	charge_son
	~son	#11025;#1;FALSE
sono20
	rts

*-----------------------
* jingle
*-----------------------

jingle
	lda	salle
	cmp	#10
	bne	jingle1
	~son	#9400;#2;TRUE
jingle1
	lda	salle
	cmp	#11
	bne	jingle2
	~son	#10000;#2;TRUE
jingle2
	lda	salle
	cmp	#34
	bcc	jingle3
	cmp	#40+1
	bcs	jingle3
	~son	#9400;#2;TRUE
jingle3
	lda	salle
	cmp	#22
	bcc	jingle4
	cmp	#24+1
	bcs	jingle4
	~son	#14000;#2;TRUE
jingle4
	lda	salle
	cmp	#28
	bne	jingle5
	~son	#10000;#2;TRUE
jingle5
	lda	salle
	cmp	#44
	bne	jingle6
	~son	#7500;#2;TRUE
jingle6
	lda	salle
	cmp	#45
	bne	jingle7
	~son	#10000;#2;TRUE
jingle7
	lda	salle
	cmp	#79
	bne	jingle8
	~son	#7500;#2;TRUE
jingle8
	lda	salle
	cmp	#86
	bne	jingle9
	~son	#10000;#2;TRUE
jingle9
	lda	salle
	cmp	#87
	bne	jingle10
	~son	#5000;#2;TRUE
jingle10
	lda	salle
	cmp	#89
	bne	jingle11
	~son	#10000;#2;TRUE
jingle11
	lda	salle
	cmp	#95
	bne	jingle12
	~son	#10000;#2;TRUE
jingle12
	lda	salle
	cmp	#98
	bne	jingle13
	~son	#10000;#2;TRUE
jingle13
	rts

*-----------------------
* son
*-----------------------
* 7,s frequence%
* 5,s repetition%
* 3,s anti_click
* 1,s RTS

son
	lda	fgSND	; sound load
	bne	son2	; not ok, skip
	
	lda	#1
	sta	follow

*	lda	seqPlay	; midi playing
*	beq	son1	; nope
*
*	_MSSuspend

son1	PushWord #%0000_0000_1000_0000
	_FFStopSound

	PushWord #$0701
	PushLong #waveSTART
	_FFStartSound

*	lda	seqPlay	; midi playing
*	beq	son2	; nope
*
*	_MSResume

son2	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	plx
	sta	1,s	; remet le RTS
	rts

*--- Donnees Sound Tool Set

waveSTART	ds	4	; waveStart
waveSIZE	ds	2	; waveSize
	dw	214	; freqOffset
	dw	$0000	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
	dw	255	; volSetting

*-----------------------
* volume
*-----------------------
*
*volume
*	rts
*
*-----------------------
* stop_son
*-----------------------

stop_son
	stz	follow

	lda	fgSND	; sound load
	bne	stop_son2	; not ok, skip
	
*	lda	seqPlay	; midi playing
*	beq	stop_son1	; nope
*
*	_MSSuspend

stop_son1
	PushWord #%0000_0000_1000_0000
	_FFStopSound

*	lda	seqPlay	; midi playing
*	beq	stop_son2	; nope
*
*	_MSResume

stop_son2
	rts

*-----------------------
* charge_son
*-----------------------

charge_son
	pha		; set the sound filename
	PushLong #tempSTR
	PushWord #3
	PushWord #0
	_Int2Dec

	lda	tempSTR
	ora	#'00'
	sta	pSON+17
	lda	tempSTR+1
	ora	#'00'
	sta	pSON+18
*
	lda	#pSON	; load the sound now
	sta	proOPEN+4

	stz	fgSND	; flag for sound load

	lda	haSND	; do we have a sound handle?
	ora	haSND+2
	beq	cs_1

	PushLong haSND	; yes, dispose it
	_DisposeHandle
	
	stz	haSND	; and say we have
	stz	haSND+2	; no sound handle
	
cs_1
	jsl	GSOS
        dw	$2010
        adrl	proOPEN
        bcs	cs_err

        lda	proOPEN+2
        sta	proREAD+2
        sta	proCLOSE+2

        lda	proEOF
        sta	proREAD+8
        lda	proEOF+2
        sta	proREAD+10

	PushLong #0
	PushLong proEOF
	PushWord myID
	PushWord #%11000000_00001100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	waveSTART
	sta	proREAD+4
	ldy	#2
	lda	[3],y
	sta	waveSTART+2
	sta	proREAD+6
	pld
	pla
	sta	haSND
	pla
	sta	haSND+2
	bcc	cs_ok
	
cs_err
	inc	fgSND	; load KO
	bra	cs_end

cs_ok
        jsl	GSOS
        dw	$2012
        adrl	proREAD
        bcs	cs_err

	lda	proEOF+1	; length is $00001F22
	inc			; return is $0020
	sta	waveSIZE

cs_end
	jsl	GSOS
        dw	$2014
        adrl	proCLOSE
	rts

*-----------------------
* fade_son
*-----------------------
*
*fade_son
*	rts
*
*-----------------------
* titre
*-----------------------

titre
	lda	#2
	jsr	nowWAIT

	pha
	_GetBackColor
	PullWord tempBG
	
	pha
	_GetForeColor
	PullWord tempFG

	pea	$0000
	_SetBackColor
	
	pea	$0fff
	_SetForeColor
	
	jsr	titre_affichage

	PushWord tempBG
	_SetBackColor
	
	PushWord tempFG
	_SetForeColor
	
	lda	#2
	jmp	nowWAIT

tempFG	ds	2
tempBG	ds	2

*-----------------------
* titre_debut
*-----------------------
*
*titre_debut
*	rts
*
*-----------------------
* titre_fin
*-----------------------
*
*titre_fin
*	rts
*
*-----------------------
* titre_affichage
*-----------------------

titre_affichage
	jsr	fadeOUT
	jsr	cls
	
	lda	#1	; L'EGERIE
	ldy	#9
	jsr	dedicace

	lda	#2	; ou
	ldy	#11
	jsr	dedicace

]lp	jsr	Random
	cmp	#75
	bcs	]lp
	ora	#1	; pour l'impair
	pha
	ldy	#13
	jsr	soustitre
	
	pla
	inc
	ldy	#14
	jsr	soustitre
	jsr	fadeIMAGE

	lda	#3
	jsr	nowWAIT
	
*---

	jsr	fadeOUT
	jsr	cls
	
	lda	#3	; APP
	ldy	#9
	jsr	dedicace

	lda	#4	; INPI
	ldy	#11
	jsr	dedicace
	jsr	fadeIMAGE

	lda	#2
	jsr	nowWAIT

*---

	jsr	fadeOUT
	jsr	cls
	
	lda	#5	; Réalisé par
	ldy	#9
	jsr	dedicace

	lda	#6	; Coulon & Cotton
	ldy	#11
	jsr	dedicace
	jsr	fadeIMAGE

	lda	#2
	jsr	nowWAIT

*---

	jsr	fadeOUT
	jsr	cls
	
	lda	#7	; Version IIgs
	ldy	#8
	jsr	dedicace

	lda	#8	; BDS
	ldy	#10
	jsr	dedicace

	lda	#9	; Vignau & Zardini
	ldy	#12
	jsr	dedicace
	jsr	fadeIMAGE
	
	lda	#3
	jsr	nowWAIT

*---

	jsr	fadeOUT
	jsr	cls
	
	lda	#10	; Traduit par
	ldy	#9
	jsr	dedicace

	lda	#11	; Coulon & Cotton
	ldy	#11
	jsr	dedicace
	jsr	fadeIMAGE

	lda	#2
	jsr	nowWAIT

*---

	jsr	fadeOUT
	jsr	cls
	
	lda	#1	; L'EGERIE
	ldy	#9
	jsr	dedicace

	lda	#2	; ou
	ldy	#11
	jsr	dedicace

]lp	jsr	Random
	and	#3	; keep the last two bits
	clc
	adc	#17
	ora	#1	; pour l'impair
	pha
	ldy	#11
	jsr	dedicace
	
	pla
	inc
	ldy	#12
	jsr	dedicace
	jsr	fadeIMAGE

	lda	#2
	jsr	nowWAIT

*---

	jsr	fadeOUT
	jsr	cls
	jsr	fadeIMAGE
	
	lda	#12	; Bon...
	ldy	#8
	jsr	dedicace
	lda	#1
	jsr	nowWAIT

	lda	#13	; Qu'est-ce...
	ldy	#10
	jsr	dedicace
	lda	#1
	jsr	nowWAIT

	lda	#14	; Houhou
	ldy	#12
	jsr	dedicace
	lda	#1
	jsr	nowWAIT

	lda	#15	; Bon
	ldy	#14
	jsr	dedicace
	lda	#1
	jsr	nowWAIT

	lda	#16	; Bonsoir
	ldy	#16
	jsr	dedicace
	lda	#2
	jsr	nowWAIT

*---

	jmp	fadeOUT

*-----------------------
* titre_texte
*-----------------------
*
*titre_texte
*	rts
*
*-----------------------
* dedicaces(texte_affiche%)
*-----------------------

dedicace
	cmp	#0
	bne	dedicace1
	rts
dedicace1
	cmp	nbDEDICACES
	bcc	dedicace2
	beq	dedicace2
	rts
dedicace2
	dec
	asl
	asl
	tax
	lda	tblDEDICACES,x
	sta	lenFROM
	lda	tblDEDICACES+2,x
	sta	lenFROM+2

	lda	tblDEDICACES+4,x
	sec
	sbc	tblDEDICACES,x
	dec
	dec
	sta	lenTO
	
	tya
	asl
	pha
	asl
	asl
	clc
	adc	1,s
	sta	lenTO+2
	
	PushLong lenFROM	; space for result is above
	PushWord lenTO
	_TextWidth

	lda	#320
	sec
	sbc	1,s
	lsr
	sta	1,s
	PushWord lenTO+2
	_MoveTo

	PushLong lenFROM
	_DrawCString
	rts
	
*-----------------------
* soustitre(texte_affiche%)
*-----------------------

soustitre
	cmp	#0
	bne	soustitre1
	rts
soustitre1
	cmp	nbSOUSTITRES
	bcc	soustitre2
	beq	soustitre2
	rts
soustitre2
	dec
	asl
	asl
	tax
	lda	tblSOUSTITRES,x
	sta	lenFROM
	lda	tblSOUSTITRES+2,x
	sta	lenFROM+2

	lda	tblSOUSTITRES+4,x
	sec
	sbc	tblSOUSTITRES,x
	dec
	dec
	sta	lenTO
	
	tya
	asl
	pha
	asl
	asl
	clc
	adc	1,s
	sta	lenTO+2
	
	PushLong lenFROM	; space for result is above
	PushWord lenTO
	_TextWidth

	lda	#320
	sec
	sbc	1,s
	lsr
	sta	1,s
	PushWord lenTO+2
	_MoveTo

	PushLong lenFROM
	_DrawCString
	rts

*-----------------------
* affiche
*-----------------------
*
*affiche
*	rts
*
*-----------------------
* titre_pause
*-----------------------
*
*titre_pause
*	rts
*	
*-----------------------
* cls
*-----------------------

cls
	ldx	#$7d00-2
	lda	#0
]lp	stal	$e12000,x
	stal	$012000,x
	dex
	dex
	bpl	]lp
	rts

*-----------------------
* stop
*-----------------------
*
*stop
*	rts
*
*-----------------------
* TEXT ROUTINES
*-----------------------

*-----------------------
* add_char
*-----------------------
* 5,s char to add
* 3,s pointer to string
* 1,s RTS

add_char
	lda	3,s
	sta	dpTO

	sep	#$30		; 02 AB
	lda	(dpTO)	; cannot exceed 255 chars
	cmp	#$ff
	bcs	add_char1

	inc			; 03 AB
	sta	(dpTO)		; 03
	tay
	lda	5,s		; C
	sta	(dpTO),y	; 03 ABC
	
add_char1
	rep	#$30
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	sta	1,s	; remet le RTS
	rts

*-----------------------
* add_string
*-----------------------
* 5,s pointer to source string
* 3,s pointer to destination string
* 1,s RTS

add_string
	lda	5,s
	sta	dpFROM
	lda	3,s
	sta	dpTO

* check added length

	sep	#$30	; cannot exceed 255 chars
	lda	(dpTO)	; get destination length
	tay
	lda	(dpFROM)
	tax		; get source length
	clc
	adc	(dpTO)
	bcs	add_string1
	sta	(dpTO)

	rep	#$20
	inc	dpFROM	; from++
	tya		; to += original length
	inc
	clc
	adc	dpTO
	sta	dpTO

]lp	sep	#$20
	lda	(dpFROM)	; recopie les caractères
	sta	(dpTO)
	rep	#$20
	inc	dpFROM
	inc	dpTO
	dex
	bne	]lp
	
add_string1
	rep	#$30
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	sta	1,s	; remet le RTS
	rts

*-----------------------
* charcmp
*-----------------------
* 5,s character to compare
* 3,s pointer to string
* 1,s RTS

charcmp
	lda	3,s
	sta	dpFROM
	lda	5,s	; A
	ora	#$0100	; 01 A
	xba
	sta	dpTO
	
	ldx	#FALSE	; default value, les chaînes sont différentes

	lda	(dpFROM)
	cmp	dpTO	; compare strings
	bne	charcmp1

	ldx	#TRUE	; même chaîne

charcmp1
	lda	1,s	; récupère RTS
	ply		; dépile les paramètres
	ply
	sta	1,s	; remet le RTS
	txa		; return value
	cmp	#TRUE	; met les valeurs de comparaison
	rts

*-----------------------
* strcmp
*-----------------------
* 5,s pointer to string 1
* 3,s pointer to string 2
* 1,s RTS

strcmp
	lda	3,s
	sta	dpFROM
	lda	5,s
	sta	dpTO
	
	ldx	#FALSE	; default value, les chaînes sont différentes

	sep	#$30
	ldy	#0		; 02 AB
]lp	lda	(dpFROM),y
	cmp	(dpTO),y
	bne	strcmp2
	iny
	tya
	cmp	(dpFROM)
	bcc	]lp
	beq	]lp
strcmp1
	ldx	#TRUE	; même chaîne

strcmp2
	rep	#$30
	lda	1,s	; récupère RTS
	ply		; dépile les paramètres
	ply
	sta	1,s	; remet le RTS
	txa		; return value
	cmp	#TRUE	; met les valeurs de comparaison
	rts

*-----------------------
* data
*-----------------------

tblFENETRE
*
* 1 À 10
*
	dw 168,4,319,199
	dw 163,0,319,199
	dw 0,136,319,199
	dw 0,0,165,199
*	dw 143,61,319,199
	dw 180,0,319,199	; telephone
	dw 0,136,319,199
	dw 148,0,308,199
	dw 104,4,310,82
	dw 0,0,148,199
*	dw 194,100,319,199
	dw 220,80,319,199
*
* 11 À 20
*
	dw 0,53,128,199
	dw 97,3,311,99
	dw 10,114,309,189
*	dw 89,4,319,76
	dw 89,0,319,76
	dw 0,138,319,199
	dw 0,130,319,199
	dw 146,0,319,158
*	dw 133,20,319,179
	dw 166,20,319,179
	dw 0,141,319,199
	dw 0,0,159,199
*
* 21 À 30
*
*	dw 142,0,319,199
	dw 152,0,319,199
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0
	dw 10,10,309,100
*	dw 149,0,319,199
	dw 169,0,319,199
	dw 171,0,319,199
	dw 0,0,166,199
	dw 0,148,319,199
	dw 162,0,319,199
*
* 31 À 40
*
	dw 0,0,157,199
	dw 165,0,319,199
	dw 0,152,319,199
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0
*
* 41 À 50
*
	dw 127,0,319,199
	dw 0,149,319,199
	dw 0,151,319,199
	dw 163,0,319,199
	dw 0,0,151,199
	dw 173,0,319,199
	dw 0,0,154,199
	dw 155,0,319,199
	dw 0,119,319,199
	dw 0,119,319,199
*
* 51 À 60
*
	dw 0,135,319,199
	dw 170,0,319,199
	dw 10,10,309,46
	dw 0,145,319,199
	dw 145,0,319,199
	dw 0,0,0,0
	dw 113,0,319,199
	dw 130,0,319,199
	dw 0,0,195,199
	dw 0,0,155,199
*
* 61 À 70
*
	dw 0,138,319,199
*	dw 10,110,309,199
	dw 10,154,309,199
	dw 90,72,309,189
	dw 0,138,319,199
	dw 10,10,309,75
	dw 67,64,250,199
	dw 0,0,168,199
	dw 68,118,319,199
	dw 0,0,153,199
	dw 140,31,309,189
*
*
* 71 À 80
*
	dw 0,91,319,199
	dw 162,0,319,199
	dw 0,0,319,67
*	dw 156,0,319,199
	dw 160,0,319,199
*	dw 158,0,319,199
	dw 160,0,319,199
	dw 10,10,309,80
	dw 10,10,309,98
	dw 80,106,319,199
	dw 10,103,260,189
	dw 0,0,0,0
*
* 81 À 90
*
*	dw 163,0,319,199
	dw 184,0,319,199
	dw 0,139,319,199
	dw 0,114,319,199
	dw 0,0,319,72
	dw 161,0,319,120
	dw 171,0,319,199
	dw 10,10,309,57
	dw 10,10,309,96
	dw 162,0,319,124
*	dw 10,10,309,73
	dw 10,0,309,88
*
* 91 À 100
*
	dw 0,0,152,199
	dw 10,130,309,192
	dw 10,116,309,192
*	dw 161,0,319,199
	dw 164,0,319,199
	dw 0,0,319,78
	dw 0,0,159,199
	dw 0,130,319,199
	dw 0,0,0,0
*	dw 0,121,319,199
	dw 0,131,319,199
*	dw 151,10,309,192
	dw 160,0,320,200
*
* 101 À 105
*
	dw 10,106,309,192
	dw 10,106,309,192
	dw 0,0,0,0
	dw 0,0,0,0
	dw 0,0,0,0

*-----------------------
* Variables 
*-----------------------

*--- Variables du jeu

x1	ds	2
x2	ds	2
y1	ds	2
y2	ds	2
ok	ds	2
follow	ds	2
nombre_salle	ds	2
salle_fin	ds	2
salle_fin2	ds	2
salle2	ds	2
salle	ds	2
ancienne_salle	ds	2
nouvelle_salle	ds	2
nouveau_texte	ds	2
dial	ds	3	; 1 (len) + 2 lettres
*dial2	ds	3
numero	ds	7	; 1 (len) + 6 chiffres
le_texte	ds	2	; texte courant (pour le refresh)
*disquette	ds	2
chiffre	ds	2
fade	ds	2
texte_enfant	ds	2
salle_bain	ds	2
indicateur	ds	NB_INDICATEURS

*--- Variables Apple IIgs

nbTEXTES	ds	2
nbDEDICACES	ds	2
nbSOUSTITRES	ds	2
tblDEDICACES	ds	4*NB_DEDICACES
tblSOUSTITRES	ds	4*NB_SOUSTITRES
tblTEXTES	ds	4*NB_TEXTES

