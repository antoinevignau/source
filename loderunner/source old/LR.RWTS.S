*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

*---------------------------------------
* RWTS
*---------------------------------------

LB7B5	PHP
	SEI
	JSR	LBD00
	BCS	LB7BF
	PLP
LBD00	CLC
	RTS
LB7BF	PLP
	SEC
	RTS

LB7E8	DB	$01
LB7E9	DB	$70
LB7EA	DB	$01
LB7EB	DB	$FF
LB7EC	DB	$13
LB7ED	DB	$05
	DA	LB7FB
LB7F0	DA	$9600
	DB	$00
	DB	$01
LB7F4	DB	$01
	DB	$00
	DB	$01
LB7F7	DB	$60
LB7F8	DB	$01
	DB	$00
	DB	$00
LB7FB	DB	$00
	DB	$01
	DB	$EF
	DB	$D8
	DB	$00
