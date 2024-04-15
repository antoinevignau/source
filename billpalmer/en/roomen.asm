*
* Bill Palmer
*

lessalles
	da	s00,s01,s02,s03,s04,s05,s06,s07,s08,s09
	da	s10,s11,s12,s13,s14,s15,s16,s17,s18,s19
	da	s20,s21,s22,s23,s24,s25,s26,s27,s28,s29
	da	s30,s31,s32,s33,s34,s35,s36,s37,s38,s39
	da	s40,s41,s42,s43,s44,s45,s46,s47,s48,s49
	da	s50,s51,s52,s53,s54,s55,s56

*---

s00
	rts

*---

s01
	lda	instruction1
	cmp	#main
	bne	s0199
	lda	zone_cliquee
	cmp	#1
	bne	s012
	
	ldx	#laitue
	lda	#s1_str1
	jmp	apparition_objet

s012	cmp	#2
	bne	s013
	
	ldx	#journal
	lda	#s1_str2
	jmp	apparition_objet

s013	cmp	#4
	bne	s0199
	
	lda	#2
	sta	salle
	
s0199	rts

s1_str1	str	'Bill collects a not very fresh lettuce'
s1_str2	str	'Here, the newspaper of the day has arrived'

*---

s02
	lda	instruction1
	cmp	#main
	bne	s0299
	lda	zone_cliquee
	cmp	#3
	bne	s022

	ldx	#livre
	lda	#s2_str3
	jmp	apparition_objet
	
s022	cmp	#2
	bne	s0299
	
	ldx	#carte_de_credit
	lda	#s2_str2
	jmp	apparition_objet
	
s0299	rts

s2_str3	str	'Bill notices an old manual'
s2_str2	str	'By crikey! The credit card Bill thought he lost forever'

*---

s03
	lda	instruction1
	cmp	#main
	bne	s0399
	lda	zone_cliquee
	cmp	#1
	bne	s032

	ldx	#machette
	lda	#strVIDE
	jsr	apparition_objet
	ldx	#souris_mecanique
	lda	#strVIDE
	jsr	apparition_objet
	ldx	#carte_didentite
	lda	#strVIDE
	jsr	apparition_objet
	ldx	#boite_de_conserve
	lda	#strVIDE
	jsr	apparition_objet
	ldx	#ouvre_boite
	lda	#strVIDE
	jmp	apparition_objet
		
s032	cmp	#2
	bne	s0399
	
	ldx	#passeport
	lda	#s3_str2
	jmp	apparition_objet
		
s0399	rts

s3_str2	str	'Damn! The passport that Bill in his heroic disorganization had lost after a stay in South Africa ...'

*---

s04
	lda	instruction1
	cmp	#main
	bne	s0499
	lda	zone_cliquee
	cmp	#3
	bne	s0499
	
	lda	#5
	sta	salle
s0499	rts

*---

s05
	lda	instruction1
	cmp	#oeil
	bne	s0599
	lda	zone_cliquee
	cmp	#1
	bne	s0599
	
	ldx	#bombe
	lda	#s5_str1
	jmp	apparition_objet
	
s0599	rts

s5_str1	str	'Gently exploring the recesses of the vehicle'27's engine, Bill notices a curious device visibly placed there for hostile purposes.'

*---

s06
	lda	instruction1
	cmp	#main
	bne	s0699
	lda	zone_cliquee
	cmp	#1
	bne	s063

	ldx	#bombe
	lda	objet-1,x
	and	#$ff
	cmp	#objet_inexistant
	bne	s062

	lda	#s6_str1
	jmp	fin

s062	lda	#s6_str2
	jsr	ecriture
	lda	#7
	sta	salle
	rts

s063	cmp	#3
	bne	s0699
	
	ldx	#briquet
	lda	#s6_str3
	jmp	apparition_objet

s0699	rts

s6_str1	str	'Baaaaooooouuuuummmmm!!!!!! Without Bill having had time to react, the car explodes into a thousand pieces. Fail so close to the goal...'
s6_str2	str	'The car starts...'
s6_str3	str	'A brick was lying around there...'
*---

s07
s0799	rts

*---

s08
s0899	rts

*---

s09
	lda	instruction1
	cmp	#main
	bne	s0999
	lda	instruction2
	cmp	#carte_de_credit
	bne	s0901

	ldx	#billet_davion
	lda	#s9_str1
	jmp	apparition_objet

s0901	cmp	#billet_davion
	bne	s0999
	
	lda	#10
	sta	salle
	
s0999	rts

s9_str1	str	'The hostess gives Bill his ticket to N'27'Gwanal'8e'l'8e

*---

s10
	lda	instruction1
	cmp	#droite
	bne	s1001
	
	lda	#s10_str1
	jmp	ecriture

s1001	cmp	#main
	bne	s1099
	lda	instruction2
	cmp	#passeport
	bne	s1099
	
	lda	#11
	sta	salle
	lda	#s10_str2
	jmp	ecriture
	
s1099	rts

s10_str1	str	'We do not pass!'
s10_str2	str	'It is in order, you can pass!'

*---

s11
s1199	rts

*---

s12
s1299	rts

*---

s13
	lda	instruction1
	cmp	#main
	bne	s1399
	lda	zone_cliquee
	cmp	#3
	bne	s1399
	
	lda	#s13_str3
	jmp	fin
	
s1399	rts

s13_str3	str	'Stones can hide a lot of animals. And snakes are often very dangerous...'

*---

s14
s1499	rts

*---

s15
	lda	instruction1
	cmp	#main
	bne	s1599
	lda	instruction2
	cmp	#carte_de_credit
	bne	s1501
	
	lda	#s15_str1
	jmp	ecriture

s1501	cmp	#livre
	bne	s1502
	
	ldx	#livre
	lda	#s15_str2
	jsr	disparition_objet
	sep	#$20
	ldx	#livre_donne
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

s1502	lda	instruction2
	cmp	#laitue
	bne	s1599

	ldx	#livre_donne
	lda	indicateur-1,x
	and	#$ff
	beq	s1503	; FALSE

	lda	#17
	sta	salle

	ldx	#laitue
	lda	#s15_str3
	jmp	disparition_objet
	
s1503
	lda	#s15_str4
	jmp	ecriture

s1599	rts

s15_str1	str	'What is that? You don'27't pay it like that...'
s15_str2	str	'You'27're a real adventurer then !! I keep the book there for you and you go with the dromedary!'
s15_str3	str	'The dromedary swallows the lettuce and bends down so that Bill goes on his back.'
s15_str4	str	'The man refuses to let Bill feed the dromaderies'

*---

s16
	sep	#$20
	ldx	#bill_desert
	lda	indicateur-1,x
	cmp	#-1
	beq	s1601
	inc	indicateur-1,x
s1601	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#4
	bne	s1699
	
	lda	#s16_str1
	jmp	fin
s1699	rts

s16_str1	str	'Without safe and fast transportation, Bill soon dies exhausted'

*--- Was protection check

s17
s1799	rts

*---

s18
s1899	rts

*---

s19
	lda	instruction1
	cmp	#main
	bne	s1999
	lda	instruction2
	cmp	#carte_de_credit
	bne	s1902
	
	lda	#s19_str1
	jmp	ecriture

s1902	cmp	#machette
	bne	s1999
	
	lda	#s19_str2
	jmp	ecriture
	
s1999	rts

s19_str1	str	'Credit cards are not accepted. Bill'27's gonna have to take the train without a ticket.'
s19_str2	str	'We do not play proudly in my station. The man goes back to sleep...'

*---

s20
	lda	instruction1
	cmp	#main
	bne	s2099
	lda	zone_cliquee
	cmp	#4
	bne	s2001

	lda	#s20_str4
	jsr	ecriture
	
	sep	#$20
	ldx	#train_arrete
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	
s2001	lda	zone_cliquee
	cmp	#5
	bne	s2003

	ldx	#train_arrete
	lda	indicateur-1,x
	and	#$ff
	beq	s2002
	
	lda	#22
	sta	salle
	bra	s2003

s2002	lda	#23
	sta	salle

s2003	sep	#$20
	ldx	#controleur_passe
	lda	indicateur-1,x
	cmp	#-1
	beq	s2004
	inc	indicateur-1,x
s2004	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#8
	bcc	s2099
	
	lda	#s20_str3
	jmp	fin
	
s2099	rts

s20_str4	str	'The train is stopped'
s20_str3	str	'The controller comes and stops Bill, who has no ticket.'

*---

s21
s2199	rts

*---

s22
s2299	rts

*---

s23
	lda	instruction1
	cmp	#main
	bne	s2399
	lda	zone_cliquee
	cmp	#1
	bne	s2399
	
	lda	#s23_str1
	jmp	fin
	
s2399	rts

s23_str1	str	'

*---

s24
s2499	rts

*---

s25
	sep	#$20
	ldx	#elephant_arrive
	lda	indicateur-1,x
	cmp	#-1
	beq	s2500
	inc	indicateur-1,x
s2500	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#6
	bcc	s2501

	lda	#s25_str1
	jmp	fin

s2501	lda	instruction1
	cmp	#main
	bne	s2599
	lda	instruction2
	cmp	#souris_mecanique
	bne	s2599
	
	lda	#s25_str2
	jsr	ecriture
	
	sep	#$20
	ldx	#elephant_enfuis
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

	lda	#26
	sta	salle
	
s2599	rts

s25_str1	str	'
s25_str2	str	'

*---

s26
	lda	instruction1
	cmp	#main
	bne	s2699
	lda	instruction2
	cmp	#machette
	bne	s2699
	
	ldx	#brindilles
	lda	#s26_str1
	jmp	apparition_objet
	
s2699	rts

s26_str1	str	'

*---

s27
	lda	instruction1
	cmp	#main
	bne	s2799
	lda	zone_cliquee
	cmp	#1
	bne	s2701
		
	lda	#30
	sta	salle

s2701	cmp	#3
	bne	s2799
	
	ldx	#photo
	lda	#s27_str3
	jmp	apparition_objet
	
s2799	rts

s27_str3	str	'

*---

s28
	lda	instruction1
	cmp	#main
	bne	s2899
	lda	zone_cliquee
	cmp	#1
	bne	s2899
	
	lda	#s28_str1
	jsr	ecriture
	
	lda	#29
	sta	salle

s2899	rts

s28_str1	str	'

*---

s29
	sep	#$20
	ldx	#mechant
	lda	indicateur-1,x
	cmp	#-1
	beq	s2901
	inc	indicateur-1,x
s2901	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#4
	bcc	s2999
	
	lda	#s29_str1
	jmp	fin
s2999	rts

s29_str1	str	'

*---

s30
	lda	instruction1
	cmp	#main
	bne	s3099
	lda	zone_cliquee
	cmp	#2
	bne	s3099
	
	lda	#s30_str2
	jmp	fin
	
s3099	rts

s30_str2	str	'

*---

s31
s3199	rts

*---

s32
	sep	#$20
	ldx	#mechant
	lda	indicateur-1,x
	cmp	#-1
	beq	s3200
	inc	indicateur-1,x
s3200	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#8
	bcc	s3201

	lda	#s32_str8
	jmp	fin
	
s3201	lda	instruction1
	cmp	#main
	bne	s3299
	lda	zone_cliquee
	cmp	#1
	bne	s3299

	lda	#s32_str1
	jsr	ecriture

	sep	#$20
	ldx	#mechant_assome
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	
	lda	#31
	sta	salle
s3299	rts

s32_str8	str	'
s32_str1	str	'

*---

s33
	ldx	#photo_montree
	lda	indicateur-1,x
	and	#$ff
	bne	s3301

	sep	#$20
	ldx	#camera_mort
	lda	indicateur-1,x
	cmp	#-1
	beq	s3300
	inc	indicateur-1,x
s3300	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#8
	bcc	s3301

	lda	#s33_str1
	jmp	fin
	
s3301	lda	instruction1
	cmp	#main
	bne	s3399
	lda	instruction2
	cmp	#photo
	bne	s3399

	lda	#s33_str2
	jsr	ecriture
	
	sep	#$20
	ldx	#photo_montree
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	
s3399	rts

s33_str1	str	'
s33_str2	str	'

*---

s34
	lda	instruction1
	cmp	#main
	bne	s3499
	lda	instruction2
	cmp	#briquet
	bne	s3402

	ldx	#brindilles
	lda	objet-1,x
	and	#$ff
*	cmp	#34		; LOGO - original code
	cmp	#objet_pris
	bne	s3401

	ldx	#brindilles
	lda	#s34_str2
	jsr	disparition_objet
	
	sep	#$20
	ldx	#feu_allume
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	
	lda	#35
	sta	salle
	rts
	
s3401	lda	#s34_str2
	jmp	ecriture
	
s3402	cmp	#brindilles
	bne	s3499
	
	lda	#s34_str3
	jmp	ecriture
	
s3499	rts

s34_str1	str	'
s34_str2	str	'
s34_str3	str	'
*---

s35
s3599	rts

*---

s36
	lda	instruction1
	cmp	#main
	bne	s3699
	lda	zone_cliquee
	cmp	#1
	bne	s3699
	
	ldx	#professeur_parti
	lda	indicateur-1,x
	and	#$ff
	cmp	#4
	bcs	s3601
	
	lda	#s36_str1
	jmp	fin
	
s3601	lda	#38
	sta	salle
	lda	#s36_str2
	jmp	ecriture
	
s3699	rts

s36_str1	str	'
s36_str2	str	'

*---

s37
s3799	rts

*---

s38
	lda	instruction1
	cmp	#main
	bne	s3803
	lda	zone_cliquee
	cmp	#1
	bne	s3801
	
	ldx	#appeau
	lda	#s38_str1
	jmp	apparition_objet
	
s3801	cmp	#2
	bne	s3802
	
	ldx	#mitraillette
	lda	#s38_str2
	jmp	apparition_objet
	
s3802	cmp	#3
	bne	s3803

	lda	#s38_str3
	jmp	fin
	
s3803	lda	instruction1
	cmp	#bouche
	bne	s3899
	lda	zone_cliquee
	cmp	#3
	bne	s3899
	
	lda	#s38_str4
	jmp	fin
	
s3899	rts

s38_str1	str	'
s38_str2	str	'
s38_str3	str	'
s38_str4	str	'

*---

s39
	lda	instruction1
	cmp	#oeil
	bne	s3999
	lda	zone_cliquee
	cmp	#2
	bne	s3999
	
	sep	#$20
	ldx	#professeur_parti
	lda	indicateur-1,x
	cmp	#-1
	beq	s3901
	inc	indicateur-1,x
s3901	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#3+1
	bcc	s3999
	
	lda	#s39_str1
	jmp	ecriture
	
s3999	rts

s39_str1	str	'

*---

s40
	lda	instruction1
	cmp	#bouche
	bne	s4001
	lda	instruction2
	cmp	#appeau
	bne	s4001
	
	lda	#41
	sta	salle
	lda	#s40_str1
	jsr	ecriture

s4001	lda	instruction1
	cmp	#oeil
	bne	s4099
	lda	zone_cliquee
	cmp	#2
	bne	s4099
	
	ldx	#feu_allume
	lda	indicateur-1,x
	and	#$ff
	beq	s4002

	lda	#s40_str2
	jmp	ecriture

s4002	lda	#s40_str3
	jmp	ecriture
	
s4099	rts

s40_str1	str	'
s40_str2	str	'
s40_str3	str	'

*---

s41
	ldx	#feu_allume
	lda	indicateur-1,x
	and	#$ff
	bne	s4101
	
	lda	#40
	sta	salle
	lda	#s41_str1
	jmp	ecriture
	
s4101	lda	#42
	sta	salle
	lda	#s41_str2
	jmp	ecriture
	
s4199	rts

s41_str1	str	'
s41_str2	str	'

*---

s42
	sep	#$20
	ldx	#homme_attaque
	lda	indicateur-1,x
	cmp	#-1
	beq	s4200
	inc	indicateur-1,x
s4200	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#8
	bcc	s4201
	
	lda	#s42_str1
	jmp	fin

s4201	lda	instruction1
	cmp	#main
	bne	s4299
	lda	instruction2
	cmp	#mitraillette
	bne	s4202

	lda	#43
	sta	salle
	lda	#s42_str2
	jsr	ecriture
	jsr	chargement_image
	lda	#s42_str3
	jsr	ecriture
	
	lda	#3
	jsr	nowWAIT
	
	lda	#44
	sta	salle
	rts
	
s4202	cmp	#machette
	bne	s4299
	
	lda	#s42_str4
	jmp	fin
	
s4299	rts

s42_str1	str	'
s42_str2	str	'
s42_str3	str	'
s42_str4	str	'

*--- Check protection

s43
s4399	rts

*---

s44
s4499	rts

*---

s45
	lda	instruction1
	cmp	#main
	bne	s4599
	lda	zone_cliquee
	cmp	#2
	bne	s4599
	
	lda	#46
	sta	salle
	lda	#s45_str2
	jsr	ecriture
	jsr	chargement_image
	lda	#s45_str3
	jsr	ecriture
	
	lda	#48
	sta	salle
	
	lda	#3
	jsr	nowWAIT
	
	ldx	#1
]lp	phx
	lda	#strVIDE
	jsr	disparition_objet
	plx
	inx
	cpx	#nombre_objets
	bcc	]lp
	
s4599	rts

s45_str2	str	'
s45_str3	str	'

*---

s46
s4699	rts

*---

s47
s4799	rts

*---

s48
	sep	#$20
	ldx	#canon
	lda	indicateur-1,x
	cmp	#-1
	beq	s4600
	inc	indicateur-1,x
s4600	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#6
	bcc	s4801
	
	lda	#s48_str6
	jmp	fin

s4801	lda	instruction1
	cmp	#main
	bne	s4899
	lda	zone_cliquee
	cmp	#1
	bne	s4899
	
	lda	#s48_str1
	jsr	ecriture
	
	lda	#49
	sta	salle
	
s4899	rts

s48_str6	str	'
s48_str1	str	'

*---

s49
	lda	instruction1
	cmp	#main
	bne	s4999
	lda	zone_cliquee
	cmp	#2
	beq	s4901
	cmp	#3
	bne	s4902
	
s4901	lda	#s49_str2
	jmp	fin

s4902	cmp	#1
	bne	s4999
	
	lda	#s49_str1
	jsr	ecriture
	lda	#50
	sta	salle
	
s4999	rts

s49_str2	str	'
s49_str1	str	'

*---

s50
	lda	instruction1
	cmp	#main
	bne	s5099
	lda	zone_cliquee
	beq	s5099
	
	lda	#s50_str1
	jmp	fin
	
s5099	rts

s50_str1	str	'

*---

s51
	lda	instruction1
	cmp	#main
	bne	s5102
	lda	zone_cliquee
	cmp	#2
	bne	s5101
	
	lda	#s51_str2
	jmp	fin

s5101	cmp	#3
	bne	s5102
	
	sep	#$20
	ldx	#destruction_base
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

s5102	ldx	#destruction_base
	lda	indicateur-1,x
	and	#$ff
	beq	s5103

	sep	#$20
	ldx	#compte_a_rebours
	lda	indicateur-1,x
	cmp	#-1
	beq	s5100
	inc	indicateur-1,x
s5100	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#6
	bcc	s5103
	
	lda	#s51_str2
	jmp	fin
	
s5103	lda	instruction1
	cmp	#main
	bne	s5105
	lda	zone_cliquee
	cmp	#4
	bne	s5104

	lda	#s51_str4
	jsr	ecriture
	lda	#54
	sta	salle

s5104	cmp	#6
	bne	s5105

	ldx	#revolver
	lda	#s51_str6
	jmp	apparition_objet
	
s5105	lda	instruction1
	cmp	#bouche
	bne	s5199
	lda	zone_cliquee
	cmp	#5
	bne	s5199
	
	lda	#52
	sta	salle

s5199	rts

s51_str2	str	'
s51_str4	str	'
s51_str6	str	'

*---

s52
	lda	instruction1
	cmp	#main
	bne	s5201
	lda	instruction2
	cmp	#revolver
	bne	s5201
	
	lda	#53
	sta	salle
	
	ldx	#fetiche
	lda	#s52_str1
	jsr	apparition_objet

s5201	ldx	#lieutenant
	sep	#$20
	lda	indicateur-1,x
	cmp	#-1
	beq	s5200
	inc	indicateur-1,x
s5200	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#4
	bcc	s5202
	
	lda	#s52_str2
	jmp	fin

s5202	lda	instruction1
	cmp	#main
	bne	s5204
	lda	zone_cliquee
	cmp	#2
	bne	s5203

	lda	#s52_str3
	jmp	fin
	
s5203	cmp	#3
	bne	s5204

	sep	#$20
	ldx	#destruction_base
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20
	
s5204	ldx	#destruction_base
	lda	indicateur-1,x
	and	#$ff
	beq	s5205
	
	sep	#$20
	ldx	#compte_a_rebours
	lda	indicateur-1,x
	cmp	#-1
	beq	s5252
	inc	indicateur-1,x
s5252	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#6
	bcc	s5205
	
	lda	#s52_str3
	jmp	fin
	
s5205	lda	instruction1
	cmp	#main
	bne	s5299
	lda	zone_cliquee
	cmp	#4
	bne	s5206

	lda	#s52_str4
	jsr	ecriture
	lda	#54
	sta	salle
	
s5206	cmp	#6
	bne	s5299
	
	ldx	#revolver
	lda	#s52_str6
	jmp	apparition_objet
	
s5299	rts

s52_str1	str	'
s52_str2	str	'
s52_str3	str	'
s52_str4	str	'
s52_str6	str	'

*---

s53
	lda	instruction1
	cmp	#main
	bne	s5302
	lda	zone_cliquee
	cmp	#2
	bne	s5301
	
	lda	#s53_str2
	jmp	fin

s5301	cmp	#3
	bne	s5302

	sep	#$20
	ldx	#destruction_base
	lda	#TRUE
	sta	indicateur-1,x
	rep	#$20

s5302	ldx	#destruction_base
	lda	indicateur-1,x
	and	#$ff
	beq	s5303

	sep	#$20
	ldx	#compte_a_rebours
	lda	indicateur-1,x
	cmp	#-1
	beq	s5300
	inc	indicateur-1,x
s5300	rep	#$20
	
	lda	indicateur-1,x
	and	#$ff
	cmp	#6
	bcc	s5303
	
	lda	#s53_str2
	jmp	fin
	
s5303	lda	instruction1
	cmp	#main
	bne	s5399
	lda	zone_cliquee
	cmp	#4
	bne	s5399
	
	lda	#s53_str4
	jsr	ecriture
	lda	#54
	sta	salle
s5399	rts

s53_str2	str	'
s53_str4	str	'

*---

s54
	lda	#55
	sta	salle
	jsr	chargement_image
	
	lda	#3
	jsr	nowWAIT
	
	ldx	#destruction_base
	lda	indicateur-1,x
	and	#$ff
	bne	s5401
	
	lda	#s54_str1
	jmp	fin

s5401	ldx	#fetiche
	lda	objet-1,x
	and	#$ff
	cmp	#objet_pris
	beq	s5402
	
	lda	#s54_str2
	jmp	fin

s5402	lda	#56
	sta	salle
	jsr	chargement_image
	
	lda	#3
	jsr	nowWAIT
	
	lda	#s54_str3	; on a gagné !
	jmp	fin
	
s5499	rts

s54_str1	str	'
s54_str2	str	'
s54_str3	str	'

*---

s55
s5599	rts

*---

s56
s5699	rts