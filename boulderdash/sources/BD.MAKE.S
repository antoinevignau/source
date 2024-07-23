*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022, Brutal Deluxe Software
*

*-----------------------------

            LST   OFF
            TYP   BIN
            ORG   $000800
            MX    %11

            USE   BD.EQUATES.S

*-----------------------------

	put	BD.0800.S	; $0800 - code

HGR1	ds	$2000	; $2000 - HGR1
HGR2	ds	$2000	; $4000 - HGR2

	put	BD.6000.S	; $6000 - data
	put	BD.7500.S	; $7500 - code

*-----------------------------
