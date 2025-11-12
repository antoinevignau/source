*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022-2025, Brutal Deluxe Software
*

*-----------------------------
*
*            TYP   BIN
*            ORG   $007500
*            MX    %11
*
*-----------------------------

*-----------------------------
* DRAW THE GAME BOARD
*-----------------------------

drawBOARD   LDA   theCOUNTER	; increment the counter
            CLC
            ADC   #$01
            STA   theCOUNTER
            CLC
            AND   #$01
            BEQ   drawPAGE1	; draw on page 1 and display it
            JMP   drawPAGE2	; draw on page 2 and display it

*----------------
* DRAW ON PAGE 1
*----------------

drawPAGE1   LDA   $05
            LDX   #>tblFORE
            LDY   $06
L7515       DEY
            BMI   L7520
            ADC   #WIDTH
            BCC   L7515
            INX
            CLC
            BNE   L7515
L7520       STA   L7618+1	; 
            STX   L7618+2
            ADC   #WIDTH
            BCC   L752C
            INX
            CLC
L752C       STA   L76E9+1	; 
            STX   L76E9+2
            ADC   #WIDTH
            BCC   L7538
            INX
            CLC
L7538       STA   L77BA+1	; 
            STX   L77BA+2
            ADC   #WIDTH
            BCC   L7544
            INX
            CLC
L7544       STA   L788B+1	; 
            STX   L788B+2
            ADC   #WIDTH
            BCC   L7550
            INX
            CLC
L7550       STA   L795C+1	; 
            STX   L795C+2
            ADC   #WIDTH
            BCC   L755C
            INX
            CLC
L755C       STA   L7A2D+1	; 
            STX   L7A2D+2
            ADC   #WIDTH
            BCC   L7568
            INX
            CLC
L7568       STA   L7AFE+1	; 
            STX   L7AFE+2
            ADC   #WIDTH
            BCC   L7574
            INX
            CLC
L7574       STA   L7BCF+1	; 
            STX   L7BCF+2
            ADC   #WIDTH
            BCC   L7580
            INX
            CLC
L7580       STA   L7CA0+1	; 
            STX   L7CA0+2
            ADC   #WIDTH
            BCC   L758C
            INX
            CLC
L758C       STA   L7D71+1	; 
            STX   L7D71+2
            ADC   #WIDTH
            BCC   L7598
            INX
            CLC
L7598       STA   L7E42+1	; 
            STX   L7E42+2
            ADC   #WIDTH
            BCC   L75A4
            INX
            CLC
L75A4       STA   L7F13+1	; 
            STX   L7F13+2

* First part is the menu bar

            LDX   #$13	; width of a line is 20
L75AC       STX   $4E
            LDY   theSTRING,X
            TXA
            ASL
            TAX
            STX   $4F
            LDA   sprDATA1+1,Y	; 0
            STA   $2001,X
            LDA   sprDATA2+1,Y	; 1
            STA   $2401,X
            LDA   sprDATA3+1,Y	; 2
            STA   $2801,X
            LDA   sprDATA4+1,Y	; 3
            STA   $2C01,X
            LDA   sprDATA5+1,Y	; 4
            STA   $3001,X
            LDA   sprDATA6+1,Y	; 5
            STA   $3401,X
            LDA   sprDATA7+1,Y	; 6
            STA   $3801,X
            LDA   sprDATA8+1,Y	; 7
            STA   $3C01,X
            LDA   sprDATA1,Y	; 0
            STA   $2000,X
            LDA   sprDATA2,Y	; 1
            STA   $2400,X
            LDA   sprDATA3,Y	; 2
            STA   $2800,X
            LDA   sprDATA4,Y	; 3
            STA   $2C00,X
            LDA   sprDATA5,Y	; 4
            STA   $3000,X
            LDA   sprDATA6,Y	; 5
            STA   $3400,X
            LDA   sprDATA7,Y	; 6
            STA   $3800,X
            LDA   sprDATA8,Y	; 7
            STA   $3C00,X

* First board row

            LDY   $4E
L7618       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDA   $E8
            BEQ   L7625
L7622       STA   SPKR
L7625       LDX   $4F
            LDA   sprDATA1+3,Y	; 16
            STA   $2101,X
            LDA   sprDATA2+3,Y	; 17
            STA   $2501,X
            LDA   sprDATA3+3,Y	; 18
            STA   $2901,X
            LDA   sprDATA4+3,Y	; 19
            STA   $2D01,X
            LDA   sprDATA5+3,Y	; 20
            STA   $3101,X
            LDA   sprDATA6+3,Y	; 21
            STA   $3501,X
            LDA   sprDATA7+3,Y	; 22
            STA   $3901,X
            LDA   sprDATA8+3,Y	; 23
            STA   $3D01,X
            LDA   sprDATA1+2,Y	; 16
            STA   $2100,X
            LDA   sprDATA2+2,Y	; 17
            STA   $2500,X
            LDA   sprDATA3+2,Y	; 18
            STA   $2900,X
            LDA   sprDATA4+2,Y	; 19
            STA   $2D00,X
            LDA   sprDATA5+2,Y	; 20
            STA   $3100,X
            LDA   sprDATA6+2,Y	; 21
            STA   $3500,X
            LDA   sprDATA7+2,Y	; 22
            STA   $3900,X
            LDA   sprDATA8+2,Y	; 23
            STA   $3D00,X
            LDA   sprDATA1+1,Y	;  8
            STA   $2081,X
            LDA   sprDATA2+1,Y	;  9
            STA   $2481,X
            LDA   sprDATA3+1,Y	; 10
            STA   $2881,X
            LDA   sprDATA4+1,Y	; 11
            STA   $2C81,X
            LDA   sprDATA5+1,Y	; 12
            STA   $3081,X
            LDA   sprDATA6+1,Y	; 13
            STA   $3481,X
            LDA   sprDATA7+1,Y	; 14
            STA   $3881,X
            LDA   sprDATA8+1,Y	; 15
            STA   $3C81,X
            LDA   sprDATA1,Y	;  8
            STA   $2080,X
            LDA   sprDATA2,Y	;  9
            STA   $2480,X
            LDA   sprDATA3,Y	; 10
            STA   $2880,X
            LDA   sprDATA4,Y	; 11
            STA   $2C80,X
            LDA   sprDATA5,Y	; 12
            STA   $3080,X
            LDA   sprDATA6,Y	; 13
            STA   $3480,X
            LDA   sprDATA7,Y	; 14
            STA   $3880,X
            LDA   sprDATA8,Y	; 15
            STA   $3C80,X

            LDY   $4E
L76E9       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $E9
            BEQ   L76F8
L76F5       STA   SPKR
L76F8       LDA   sprDATA1+3,Y	; 
            STA   $2201,X
            LDA   sprDATA2+3,Y	; 
            STA   $2601,X
            LDA   sprDATA3+3,Y	; 
            STA   $2A01,X
            LDA   sprDATA4+3,Y	; 
            STA   $2E01,X
            LDA   sprDATA5+3,Y	; 
            STA   $3201,X
            LDA   sprDATA6+3,Y	; 
            STA   $3601,X
            LDA   sprDATA7+3,Y	; 
            STA   $3A01,X
            LDA   sprDATA8+3,Y	; 
            STA   $3E01,X
            LDA   sprDATA1+2,Y	; 
            STA   $2200,X
            LDA   sprDATA2+2,Y	; 
            STA   $2600,X
            LDA   sprDATA3+2,Y	; 
            STA   $2A00,X
            LDA   sprDATA4+2,Y	; 
            STA   $2E00,X
            LDA   sprDATA5+2,Y	; 
            STA   $3200,X
            LDA   sprDATA6+2,Y	; 
            STA   $3600,X
            LDA   sprDATA7+2,Y	; 
            STA   $3A00,X
            LDA   sprDATA8+2,Y	; 
            STA   $3E00,X
            LDA   sprDATA1+1,Y	; 
            STA   $2181,X
            LDA   sprDATA2+1,Y	; 
            STA   $2581,X
            LDA   sprDATA3+1,Y	; 
            STA   $2981,X
            LDA   sprDATA4+1,Y	; 
            STA   $2D81,X
            LDA   sprDATA5+1,Y	; 
            STA   $3181,X
            LDA   sprDATA6+1,Y	; 
            STA   $3581,X
            LDA   sprDATA7+1,Y	; 
            STA   $3981,X
            LDA   sprDATA8+1,Y	; 
            STA   $3D81,X
            LDA   sprDATA1,Y	; 
            STA   $2180,X
            LDA   sprDATA2,Y	; 
            STA   $2580,X
            LDA   sprDATA3,Y	; 
            STA   $2980,X
            LDA   sprDATA4,Y	; 
            STA   $2D80,X
            LDA   sprDATA5,Y	; 
            STA   $3180,X
            LDA   sprDATA6,Y	; 
            STA   $3580,X
            LDA   sprDATA7,Y	; 
            STA   $3980,X
            LDA   sprDATA8,Y	; 
            STA   $3D80,X

            LDY   $4E
L77BA       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EA
            BEQ   L77C9
L77C6       STA   SPKR
L77C9       LDA   sprDATA1+3,Y	; 
            STA   $2301,X
            LDA   sprDATA2+3,Y	; 
            STA   $2701,X
            LDA   sprDATA3+3,Y	; 
            STA   $2B01,X
            LDA   sprDATA4+3,Y	; 
            STA   $2F01,X
            LDA   sprDATA5+3,Y	; 
            STA   $3301,X
            LDA   sprDATA6+3,Y	; 
            STA   $3701,X
            LDA   sprDATA7+3,Y	; 
            STA   $3B01,X
            LDA   sprDATA8+3,Y	; 
            STA   $3F01,X
            LDA   sprDATA1+2,Y	; 
            STA   $2300,X
            LDA   sprDATA2+2,Y	; 
            STA   $2700,X
            LDA   sprDATA3+2,Y	; 
            STA   $2B00,X
            LDA   sprDATA4+2,Y	; 
            STA   $2F00,X
            LDA   sprDATA5+2,Y	; 
            STA   $3300,X
            LDA   sprDATA6+2,Y	; 
            STA   $3700,X
            LDA   sprDATA7+2,Y	; 
            STA   $3B00,X
            LDA   sprDATA8+2,Y	; 
            STA   $3F00,X
            LDA   sprDATA1+1,Y
            STA   $2281,X
            LDA   sprDATA2+1,Y
            STA   $2681,X
            LDA   sprDATA3+1,Y
            STA   $2A81,X
            LDA   sprDATA4+1,Y
            STA   $2E81,X
            LDA   sprDATA5+1,Y
            STA   $3281,X
            LDA   sprDATA6+1,Y
            STA   $3681,X
            LDA   sprDATA7+1,Y
            STA   $3A81,X
            LDA   sprDATA8+1,Y
            STA   $3E81,X
            LDA   sprDATA1,Y
            STA   $2280,X
            LDA   sprDATA2,Y
            STA   $2680,X
            LDA   sprDATA3,Y
            STA   $2A80,X
            LDA   sprDATA4,Y
            STA   $2E80,X
            LDA   sprDATA5,Y
            STA   $3280,X
            LDA   sprDATA6,Y
            STA   $3680,X
            LDA   sprDATA7,Y
            STA   $3A80,X
            LDA   sprDATA8,Y
            STA   $3E80,X

            LDY   $4E
L788B       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EB
            BEQ   L789A
L7897       STA   SPKR
L789A       LDA   sprDATA1+3,Y	; 
            STA   $2029,X
            LDA   sprDATA2+3,Y	; 
            STA   $2429,X
            LDA   sprDATA3+3,Y	; 
            STA   $2829,X
            LDA   sprDATA4+3,Y	; 
            STA   $2C29,X
            LDA   sprDATA5+3,Y	; 
            STA   $3029,X
            LDA   sprDATA6+3,Y	; 
            STA   $3429,X
            LDA   sprDATA7+3,Y	; 
            STA   $3829,X
            LDA   sprDATA8+3,Y	; 
            STA   $3C29,X
            LDA   sprDATA1+2,Y	; 
            STA   $2028,X
            LDA   sprDATA2+2,Y	; 
            STA   $2428,X
            LDA   sprDATA3+2,Y	; 
            STA   $2828,X
            LDA   sprDATA4+2,Y	; 
            STA   $2C28,X
            LDA   sprDATA5+2,Y	; 
            STA   $3028,X
            LDA   sprDATA6+2,Y	; 
            STA   $3428,X
            LDA   sprDATA7+2,Y	; 
            STA   $3828,X
            LDA   sprDATA8+2,Y	; 
            STA   $3C28,X
            LDA   sprDATA1+1,Y	; 
            STA   $2381,X
            LDA   sprDATA2+1,Y	; 
            STA   $2781,X
            LDA   sprDATA3+1,Y	; 
            STA   $2B81,X
            LDA   sprDATA4+1,Y	; 
            STA   $2F81,X
            LDA   sprDATA5+1,Y	; 
            STA   $3381,X
            LDA   sprDATA6+1,Y	; 
            STA   $3781,X
            LDA   sprDATA7+1,Y	; 
            STA   $3B81,X
            LDA   sprDATA8+1,Y	; 
            STA   $3F81,X
            LDA   sprDATA1,Y	; 
            STA   $2380,X
            LDA   sprDATA2,Y	; 
            STA   $2780,X
            LDA   sprDATA3,Y	; 
            STA   $2B80,X
            LDA   sprDATA4,Y	; 
            STA   $2F80,X
            LDA   sprDATA5,Y	; 
            STA   $3380,X
            LDA   sprDATA6,Y	; 
            STA   $3780,X
            LDA   sprDATA7,Y	; 
            STA   $3B80,X
            LDA   sprDATA8,Y	; 
            STA   $3F80,X

            LDY   $4E
L795C       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EC
            BEQ   L796B
L7968       STA   SPKR
L796B       LDA   sprDATA1+3,Y	; 
            STA   $2129,X
            LDA   sprDATA2+3,Y	; 
            STA   $2529,X
            LDA   sprDATA3+3,Y	; 
            STA   $2929,X
            LDA   sprDATA4+3,Y	; 
            STA   $2D29,X
            LDA   sprDATA5+3,Y	; 
            STA   $3129,X
            LDA   sprDATA6+3,Y	; 
            STA   $3529,X
            LDA   sprDATA7+3,Y	; 
            STA   $3929,X
            LDA   sprDATA8+3,Y	; 
            STA   $3D29,X
            LDA   sprDATA1+2,Y	; 
            STA   $2128,X
            LDA   sprDATA2+2,Y	; 
            STA   $2528,X
            LDA   sprDATA3+2,Y	; 
            STA   $2928,X
            LDA   sprDATA4+2,Y	; 
            STA   $2D28,X
            LDA   sprDATA5+2,Y	; 
            STA   $3128,X
            LDA   sprDATA6+2,Y	; 
            STA   $3528,X
            LDA   sprDATA7+2,Y	; 
            STA   $3928,X
            LDA   sprDATA8+2,Y	; 
            STA   $3D28,X
            LDA   sprDATA1+1,Y	; 
            STA   $20A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $24A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $28A9,X
            LDA   sprDATA4+1,Y	; 
            STA   $2CA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $30A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $34A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $38A9,X
            LDA   sprDATA8+1,Y	; 
            STA   $3CA9,X
            LDA   sprDATA1,Y	; 
            STA   $20A8,X
            LDA   sprDATA2,Y	; 
            STA   $24A8,X
            LDA   sprDATA3,Y	; 
            STA   $28A8,X
            LDA   sprDATA4,Y	; 
            STA   $2CA8,X
            LDA   sprDATA5,Y	; 
            STA   $30A8,X
            LDA   sprDATA6,Y	; 
            STA   $34A8,X
            LDA   sprDATA7,Y	; 
            STA   $38A8,X
            LDA   sprDATA8,Y	; 
            STA   $3CA8,X

            LDY   $4E
L7A2D       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $ED
            BEQ   L7A3C
L7A39       STA   SPKR
L7A3C       LDA   sprDATA1+3,Y	; 
            STA   $2229,X
            LDA   sprDATA2+3,Y	; 
            STA   $2629,X
            LDA   sprDATA3+3,Y	; 
            STA   $2A29,X
            LDA   sprDATA4+3,Y	; 
            STA   $2E29,X
            LDA   sprDATA5+3,Y	; 
            STA   $3229,X
            LDA   sprDATA6+3,Y	; 
            STA   $3629,X
            LDA   sprDATA7+3,Y	; 
            STA   $3A29,X
            LDA   sprDATA8+3,Y	; 
            STA   $3E29,X
            LDA   sprDATA1+2,Y	; 
            STA   $2228,X
            LDA   sprDATA2+2,Y	; 
            STA   $2628,X
            LDA   sprDATA3+2,Y	; 
            STA   $2A28,X
            LDA   sprDATA4+2,Y	; 
            STA   $2E28,X
            LDA   sprDATA5+2,Y	; 
            STA   $3228,X
            LDA   sprDATA6+2,Y	; 
            STA   $3628,X
            LDA   sprDATA7+2,Y	; 
            STA   $3A28,X
            LDA   sprDATA8+2,Y	; 
            STA   $3E28,X
            LDA   sprDATA1+1,Y	; 
            STA   $21A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $25A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $29A9,X
            LDA   sprDATA4+1,Y	; 
            STA   $2DA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $31A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $35A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $39A9,X
            LDA   sprDATA8+1,Y	; 
            STA   $3DA9,X
            LDA   sprDATA1,Y	; 
            STA   $21A8,X
            LDA   sprDATA2,Y	; 
            STA   $25A8,X
            LDA   sprDATA3,Y	; 
            STA   $29A8,X
            LDA   sprDATA4,Y	; 
            STA   $2DA8,X
            LDA   sprDATA5,Y	; 
            STA   $31A8,X
            LDA   sprDATA6,Y	; 
            STA   $35A8,X
            LDA   sprDATA7,Y	; 
            STA   $39A8,X
            LDA   sprDATA8,Y	; 
            STA   $3DA8,X

            LDY   $4E
L7AFE       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EE
            BEQ   L7B0D
L7B0A       STA   SPKR
L7B0D       LDA   sprDATA1+3,Y	; 
            STA   $2329,X
            LDA   sprDATA2+3,Y	; 
            STA   $2729,X
            LDA   sprDATA3+3,Y	; 
            STA   $2B29,X
            LDA   sprDATA4+3,Y	; 
            STA   $2F29,X
            LDA   sprDATA5+3,Y	; 
            STA   $3329,X
            LDA   sprDATA6+3,Y	; 
            STA   $3729,X
            LDA   sprDATA7+3,Y	; 
            STA   $3B29,X
            LDA   sprDATA8+3,Y	; 
            STA   $3F29,X
            LDA   sprDATA1+2,Y	; 
            STA   $2328,X
            LDA   sprDATA2+2,Y	; 
            STA   $2728,X
            LDA   sprDATA3+2,Y	; 
            STA   $2B28,X
            LDA   sprDATA4+2,Y	; 
            STA   $2F28,X
            LDA   sprDATA5+2,Y	; 
            STA   $3328,X
            LDA   sprDATA6+2,Y	; 
            STA   $3728,X
            LDA   sprDATA7+2,Y	; 
            STA   $3B28,X
            LDA   sprDATA8+2,Y	; 
            STA   $3F28,X
            LDA   sprDATA1+1,Y	; 
            STA   $22A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $26A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $2AA9,X
            LDA   sprDATA4+1,Y	; 
            STA   $2EA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $32A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $36A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $3AA9,X
            LDA   sprDATA8+1,Y	; 
            STA   $3EA9,X
            LDA   sprDATA1,Y	; 
            STA   $22A8,X
            LDA   sprDATA2,Y	; 
            STA   $26A8,X
            LDA   sprDATA3,Y	; 
            STA   $2AA8,X
            LDA   sprDATA4,Y	; 
            STA   $2EA8,X
            LDA   sprDATA5,Y	; 
            STA   $32A8,X
            LDA   sprDATA6,Y	; 
            STA   $36A8,X
            LDA   sprDATA7,Y	; 
            STA   $3AA8,X
            LDA   sprDATA8,Y	; 
            STA   $3EA8,X

            LDY   $4E
L7BCF       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EF
            BEQ   L7BDE
L7BDB       STA   SPKR
L7BDE       LDA   sprDATA1+3,Y	; 
            STA   $2051,X
            LDA   sprDATA2+3,Y	; 
            STA   $2451,X
            LDA   sprDATA3+3,Y	; 
            STA   $2851,X
            LDA   sprDATA4+3,Y	; 
            STA   $2C51,X
            LDA   sprDATA5+3,Y	; 
            STA   $3051,X
            LDA   sprDATA6+3,Y	; 
            STA   $3451,X
            LDA   sprDATA7+3,Y	; 
            STA   $3851,X
            LDA   sprDATA8+3,Y	; 
            STA   $3C51,X
            LDA   sprDATA1+2,Y	; 
            STA   $2050,X
            LDA   sprDATA2+2,Y	; 
            STA   $2450,X
            LDA   sprDATA3+2,Y	; 
            STA   $2850,X
            LDA   sprDATA4+2,Y	; 
            STA   $2C50,X
            LDA   sprDATA5+2,Y	; 
            STA   $3050,X
            LDA   sprDATA6+2,Y	; 
            STA   $3450,X
            LDA   sprDATA7+2,Y	; 
            STA   $3850,X
            LDA   sprDATA8+2,Y	; 
            STA   $3C50,X
            LDA   sprDATA1+1,Y	; 
            STA   $23A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $27A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $2BA9,X
            LDA   sprDATA4+1,Y	; 
            STA   $2FA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $33A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $37A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $3BA9,X
            LDA   sprDATA8+1,Y	; 
            STA   $3FA9,X
            LDA   sprDATA1,Y	; 
            STA   $23A8,X
            LDA   sprDATA2,Y	; 
            STA   $27A8,X
            LDA   sprDATA3,Y	; 
            STA   $2BA8,X
            LDA   sprDATA4,Y	; 
            STA   $2FA8,X
            LDA   sprDATA5,Y	; 
            STA   $33A8,X
            LDA   sprDATA6,Y	; 
            STA   $37A8,X
            LDA   sprDATA7,Y	; 
            STA   $3BA8,X
            LDA   sprDATA8,Y	; 
            STA   $3FA8,X

            LDY   $4E
L7CA0       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F0
            BEQ   L7CAF
L7CAC       STA   SPKR
L7CAF       LDA   sprDATA1+3,Y	; 
            STA   $2151,X
            LDA   sprDATA2+3,Y	; 
            STA   $2551,X
            LDA   sprDATA3+3,Y	; 
            STA   $2951,X
            LDA   sprDATA4+3,Y	; 
            STA   $2D51,X
            LDA   sprDATA5+3,Y	; 
            STA   $3151,X
            LDA   sprDATA6+3,Y	; 
            STA   $3551,X
            LDA   sprDATA7+3,Y	; 
            STA   $3951,X
            LDA   sprDATA8+3,Y	; 
            STA   $3D51,X
            LDA   sprDATA1+2,Y	; 
            STA   $2150,X
            LDA   sprDATA2+2,Y	; 
            STA   $2550,X
            LDA   sprDATA3+2,Y	; 
            STA   $2950,X
            LDA   sprDATA4+2,Y	; 
            STA   $2D50,X
            LDA   sprDATA5+2,Y	; 
            STA   $3150,X
            LDA   sprDATA6+2,Y	; 
            STA   $3550,X
            LDA   sprDATA7+2,Y	; 
            STA   $3950,X
            LDA   sprDATA8+2,Y	; 
            STA   $3D50,X
            LDA   sprDATA1+1,Y	; 
            STA   $20D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $24D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $28D1,X
            LDA   sprDATA4+1,Y	; 
            STA   $2CD1,X
            LDA   sprDATA5+1,Y	; 
            STA   $30D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $34D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $38D1,X
            LDA   sprDATA8+1,Y	; 
            STA   $3CD1,X
            LDA   sprDATA1,Y	; 
            STA   $20D0,X
            LDA   sprDATA2,Y	; 
            STA   $24D0,X
            LDA   sprDATA3,Y	; 
            STA   $28D0,X
            LDA   sprDATA4,Y	; 
            STA   $2CD0,X
            LDA   sprDATA5,Y	; 
            STA   $30D0,X
            LDA   sprDATA6,Y	; 
            STA   $34D0,X
            LDA   sprDATA7,Y	; 
            STA   $38D0,X
            LDA   sprDATA8,Y	; 
            STA   $3CD0,X

            LDY   $4E
L7D71       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F1
            BEQ   L7D80
L7D7D       STA   SPKR
L7D80       LDA   sprDATA1+3,Y	; 
            STA   $2251,X
            LDA   sprDATA2+3,Y	; 
            STA   $2651,X
            LDA   sprDATA3+3,Y	; 
            STA   $2A51,X
            LDA   sprDATA4+3,Y	; 
            STA   $2E51,X
            LDA   sprDATA5+3,Y	; 
            STA   $3251,X
            LDA   sprDATA6+3,Y	; 
            STA   $3651,X
            LDA   sprDATA7+3,Y	; 
            STA   $3A51,X
            LDA   sprDATA8+3,Y	; 
            STA   $3E51,X
            LDA   sprDATA1+2,Y	; 
            STA   $2250,X
            LDA   sprDATA2+2,Y	; 
            STA   $2650,X
            LDA   sprDATA3+2,Y	; 
            STA   $2A50,X
            LDA   sprDATA4+2,Y	; 
            STA   $2E50,X
            LDA   sprDATA5+2,Y	; 
            STA   $3250,X
            LDA   sprDATA6+2,Y	; 
            STA   $3650,X
            LDA   sprDATA7+2,Y	; 
            STA   $3A50,X
            LDA   sprDATA8+2,Y	; 
            STA   $3E50,X
            LDA   sprDATA1+1,Y	; 
            STA   $21D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $25D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $29D1,X
            LDA   sprDATA4+1,Y	; 
            STA   $2DD1,X
            LDA   sprDATA5+1,Y	; 
            STA   $31D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $35D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $39D1,X
            LDA   sprDATA8+1,Y	; 
            STA   $3DD1,X
            LDA   sprDATA1,Y	; 
            STA   $21D0,X
            LDA   sprDATA2,Y	; 
            STA   $25D0,X
            LDA   sprDATA3,Y	; 
            STA   $29D0,X
            LDA   sprDATA4,Y	; 
            STA   $2DD0,X
            LDA   sprDATA5,Y	; 
            STA   $31D0,X
            LDA   sprDATA6,Y	; 
            STA   $35D0,X
            LDA   sprDATA7,Y	; 
            STA   $39D0,X
            LDA   sprDATA8,Y	; 
            STA   $3DD0,X

            LDY   $4E
L7E42       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F2
            BEQ   L7E51
L7E4E       STA   SPKR
L7E51       LDA   sprDATA1+3,Y	; 
            STA   $2351,X
            LDA   sprDATA2+3,Y	; 
            STA   $2751,X
            LDA   sprDATA3+3,Y	; 
            STA   $2B51,X
            LDA   sprDATA4+3,Y	; 
            STA   $2F51,X
            LDA   sprDATA5+3,Y	; 
            STA   $3351,X
            LDA   sprDATA6+3,Y	; 
            STA   $3751,X
            LDA   sprDATA7+3,Y	; 
            STA   $3B51,X
            LDA   sprDATA8+3,Y	; 
            STA   $3F51,X
            LDA   sprDATA1+2,Y	; 
            STA   $2350,X
            LDA   sprDATA2+2,Y	; 
            STA   $2750,X
            LDA   sprDATA3+2,Y	; 
            STA   $2B50,X
            LDA   sprDATA4+2,Y	; 
            STA   $2F50,X
            LDA   sprDATA5+2,Y	; 
            STA   $3350,X
            LDA   sprDATA6+2,Y	; 
            STA   $3750,X
            LDA   sprDATA7+2,Y	; 
            STA   $3B50,X
            LDA   sprDATA8+2,Y	; 
            STA   $3F50,X
            LDA   sprDATA1+1,Y	; 
            STA   $22D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $26D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $2AD1,X
            LDA   sprDATA4+1,Y	; 
            STA   $2ED1,X
            LDA   sprDATA5+1,Y	; 
            STA   $32D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $36D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $3AD1,X
            LDA   sprDATA8+1,Y	; 
            STA   $3ED1,X
            LDA   sprDATA1,Y	; 
            STA   $22D0,X
            LDA   sprDATA2,Y	; 
            STA   $26D0,X
            LDA   sprDATA3,Y	; 
            STA   $2AD0,X
            LDA   sprDATA4,Y	; 
            STA   $2ED0,X
            LDA   sprDATA5,Y	; 
            STA   $32D0,X
            LDA   sprDATA6,Y	; 
            STA   $36D0,X
            LDA   sprDATA7,Y	; 
            STA   $3AD0,X
            LDA   sprDATA8,Y	; 
            STA   $3ED0,X

            LDY   $4E
L7F13       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F3
            BEQ   L7F22
L7F1F       STA   SPKR
L7F22       LDA   sprDATA1+1,Y	; 184
            STA   $23D1,X
            LDA   sprDATA2+1,Y	; 185
            STA   $27D1,X
            LDA   sprDATA3+1,Y	; 186
            STA   $2BD1,X
            LDA   sprDATA4+1,Y	; 187
            STA   $2FD1,X
            LDA   sprDATA5+1,Y	; 188
            STA   $33D1,X
            LDA   sprDATA6+1,Y	; 189
            STA   $37D1,X
            LDA   sprDATA7+1,Y	; 190
            STA   $3BD1,X
            LDA   sprDATA8+1,Y	; 191
            STA   $3FD1,X
            LDA   sprDATA1,Y	; 184
            STA   $23D0,X
            LDA   sprDATA2,Y	; 185
            STA   $27D0,X
            LDA   sprDATA3,Y	; 186
            STA   $2BD0,X
            LDA   sprDATA4,Y	; 187
            STA   $2FD0,X
            LDA   sprDATA5,Y	; 188
            STA   $33D0,X
            LDA   sprDATA6,Y	; 189
            STA   $37D0,X
            LDA   sprDATA7,Y	; 190
            STA   $3BD0,X
            LDA   sprDATA8,Y	; 191
            STA   $3FD0,X

            LDX   $4E
            DEX
            BPL   L7F8B
            LDA   TXTPAGE1
            RTS
L7F8B       JMP   L75AC

*----------------
* DRAW ON PAGE 2
*----------------

drawPAGE2   LDA   $05
            LDX   #>tblFORE
            LDY   $06
L7F94       DEY
            BMI   L7F9F
            ADC   #WIDTH
            BCC   L7F94
            INX
            CLC
            BNE   L7F94
L7F9F       STA   L8097+1
            STX   L8097+2
            ADC   #WIDTH
            BCC   L7FAB
            INX
            CLC
L7FAB       STA   L8168+1
            STX   L8168+2
            ADC   #WIDTH
            BCC   L7FB7
            INX
            CLC
L7FB7       STA   L8239+1
            STX   L8239+2
            ADC   #WIDTH
            BCC   L7FC3
            INX
            CLC
L7FC3       STA   L830A+1
            STX   L830A+2
            ADC   #WIDTH
            BCC   L7FCF
            INX
            CLC
L7FCF       STA   L83DB+1
            STX   L83DB+2
            ADC   #WIDTH
            BCC   L7FDB
            INX
            CLC
L7FDB       STA   L84AC+1
            STX   L84AC+2
            ADC   #WIDTH
            BCC   L7FE7
            INX
            CLC
L7FE7       STA   L857D+1
            STX   L857D+2
            ADC   #WIDTH
            BCC   L7FF3
            INX
            CLC
L7FF3       STA   L864E+1
            STX   L864E+2
            ADC   #WIDTH
            BCC   L7FFF
            INX
            CLC
L7FFF       STA   L871F+1
            STX   L871F+2
            ADC   #WIDTH
            BCC   L800B
            INX
            CLC
L800B       STA   L87F0+1
            STX   L87F0+2
            ADC   #WIDTH
            BCC   L8017
            INX
            CLC
L8017       STA   L88C1+1
            STX   L88C1+2
            ADC   #WIDTH
            BCC   L8023
            INX
            CLC
L8023       STA   L8992+1
            STX   L8992+2

            LDX   #$13
L802B       STX   $4E
            LDY   theSTRING,X
            TXA
            ASL
            TAX
            STX   $4F
            LDA   sprDATA1+1,Y	; 
            STA   $4001,X
            LDA   sprDATA2+1,Y	; 
            STA   $4401,X
            LDA   sprDATA3+1,Y	; 
            STA   $4801,X
            LDA   sprDATA4+1,Y	; 
            STA   $4C01,X
            LDA   sprDATA5+1,Y	; 
            STA   $5001,X
            LDA   sprDATA6+1,Y	; 
            STA   $5401,X
            LDA   sprDATA7+1,Y	; 
            STA   $5801,X
            LDA   sprDATA8+1,Y	; 
            STA   $5C01,X
            LDA   sprDATA1,Y	; 
            STA   $4000,X
            LDA   sprDATA2,Y	; 
            STA   $4400,X
            LDA   sprDATA3,Y	; 
            STA   $4800,X
            LDA   sprDATA4,Y	; 
            STA   $4C00,X
            LDA   sprDATA5,Y	; 
            STA   $5000,X
            LDA   sprDATA6,Y	; 
            STA   $5400,X
            LDA   sprDATA7,Y	; 
            STA   $5800,X
            LDA   sprDATA8,Y	; 
            STA   $5C00,X

            LDY   $4E
L8097       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $E8
            BEQ   L80A6
L80A3       STA   SPKR
L80A6       LDA   sprDATA1+3,Y	; 
            STA   $4101,X
            LDA   sprDATA2+3,Y	; 
            STA   $4501,X
            LDA   sprDATA3+3,Y	; 
            STA   $4901,X
            LDA   sprDATA4+3,Y	; 
            STA   $4D01,X
            LDA   sprDATA5+3,Y	; 
            STA   $5101,X
            LDA   sprDATA6+3,Y	; 
            STA   $5501,X
            LDA   sprDATA7+3,Y	; 
            STA   $5901,X
            LDA   sprDATA8+3,Y	; 
            STA   $5D01,X
            LDA   sprDATA1+2,Y	; 
            STA   $4100,X
            LDA   sprDATA2+2,Y	; 
            STA   $4500,X
            LDA   sprDATA3+2,Y	; 
            STA   $4900,X
            LDA   sprDATA4+2,Y	; 
            STA   $4D00,X
            LDA   sprDATA5+2,Y	; 
            STA   $5100,X
            LDA   sprDATA6+2,Y	; 
            STA   $5500,X
            LDA   sprDATA7+2,Y	; 
            STA   $5900,X
            LDA   sprDATA8+2,Y	; 
            STA   $5D00,X
            LDA   sprDATA1+1,Y	; 
            STA   $4081,X
            LDA   sprDATA2+1,Y	; 
            STA   $4481,X
            LDA   sprDATA3+1,Y	; 
            STA   $4881,X
            LDA   sprDATA4+1,Y	; 
            STA   $4C81,X
            LDA   sprDATA5+1,Y	; 
            STA   $5081,X
            LDA   sprDATA6+1,Y	; 
            STA   $5481,X
            LDA   sprDATA7+1,Y	; 
            STA   $5881,X
            LDA   sprDATA8+1,Y	; 
            STA   $5C81,X
            LDA   sprDATA1,Y	; 
            STA   $4080,X
            LDA   sprDATA2,Y	; 
            STA   $4480,X
            LDA   sprDATA3,Y	; 
            STA   $4880,X
            LDA   sprDATA4,Y	; 
            STA   $4C80,X
            LDA   sprDATA5,Y	; 
            STA   $5080,X
            LDA   sprDATA6,Y	; 
            STA   $5480,X
            LDA   sprDATA7,Y	; 
            STA   $5880,X
            LDA   sprDATA8,Y	; 
            STA   $5C80,X
            LDY   $4E
L8168       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $E9
            BEQ   L8177
L8174       STA   SPKR
L8177       LDA   sprDATA1+3,Y	; 
            STA   $4201,X
            LDA   sprDATA2+3,Y	; 
            STA   $4601,X
            LDA   sprDATA3+3,Y	; 
            STA   $4A01,X
            LDA   sprDATA4+3,Y	; 
            STA   $4E01,X
            LDA   sprDATA5+3,Y	; 
            STA   $5201,X
            LDA   sprDATA6+3,Y	; 
            STA   $5601,X
            LDA   sprDATA7+3,Y	; 
            STA   $5A01,X
            LDA   sprDATA8+3,Y	; 
            STA   $5E01,X
            LDA   sprDATA1+2,Y	; 
            STA   $4200,X
            LDA   sprDATA2+2,Y	; 
            STA   $4600,X
            LDA   sprDATA3+2,Y	; 
            STA   $4A00,X
            LDA   sprDATA4+2,Y	; 
            STA   $4E00,X
            LDA   sprDATA5+2,Y	; 
            STA   $5200,X
            LDA   sprDATA6+2,Y	; 
            STA   $5600,X
            LDA   sprDATA7+2,Y	; 
            STA   $5A00,X
            LDA   sprDATA8+2,Y	; 
            STA   $5E00,X
            LDA   sprDATA1+1,Y	; 
            STA   $4181,X
            LDA   sprDATA2+1,Y	; 
            STA   $4581,X
            LDA   sprDATA3+1,Y	; 
            STA   $4981,X
            LDA   sprDATA4+1,Y	; 
            STA   $4D81,X
            LDA   sprDATA5+1,Y	; 
            STA   $5181,X
            LDA   sprDATA6+1,Y	; 
            STA   $5581,X
            LDA   sprDATA7+1,Y	; 
            STA   $5981,X
            LDA   sprDATA8+1,Y	; 
            STA   $5D81,X
            LDA   sprDATA1,Y	; 
            STA   $4180,X
            LDA   sprDATA2,Y	; 
            STA   $4580,X
            LDA   sprDATA3,Y	; 
            STA   $4980,X
            LDA   sprDATA4,Y	; 
            STA   $4D80,X
            LDA   sprDATA5,Y	; 
            STA   $5180,X
            LDA   sprDATA6,Y	; 
            STA   $5580,X
            LDA   sprDATA7,Y	; 
            STA   $5980,X
            LDA   sprDATA8,Y	; 
            STA   $5D80,X
            LDY   $4E
L8239       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EA
            BEQ   L8248
L8245       STA   SPKR
L8248       LDA   sprDATA1+3,Y	; 
            STA   $4301,X
            LDA   sprDATA2+3,Y	; 
            STA   $4701,X
            LDA   sprDATA3+3,Y	; 
            STA   $4B01,X
            LDA   sprDATA4+3,Y	; 
            STA   $4F01,X
            LDA   sprDATA5+3,Y	; 
            STA   $5301,X
            LDA   sprDATA6+3,Y	; 
            STA   $5701,X
            LDA   sprDATA7+3,Y	; 
            STA   $5B01,X
            LDA   sprDATA8+3,Y	; 
            STA   $5F01,X
            LDA   sprDATA1+2,Y	; 
            STA   $4300,X
            LDA   sprDATA2+2,Y	; 
            STA   $4700,X
            LDA   sprDATA3+2,Y	; 
            STA   $4B00,X
            LDA   sprDATA4+2,Y	; 
            STA   $4F00,X
            LDA   sprDATA5+2,Y	; 
            STA   $5300,X
            LDA   sprDATA6+2,Y	; 
            STA   $5700,X
            LDA   sprDATA7+2,Y	; 
            STA   $5B00,X
            LDA   sprDATA8+2,Y	; 
            STA   $5F00,X
            LDA   sprDATA1+1,Y	; 
            STA   $4281,X
            LDA   sprDATA2+1,Y	; 
            STA   $4681,X
            LDA   sprDATA3+1,Y	; 
            STA   $4A81,X
            LDA   sprDATA4+1,Y	; 
            STA   $4E81,X
            LDA   sprDATA5+1,Y	; 
            STA   $5281,X
            LDA   sprDATA6+1,Y	; 
            STA   $5681,X
            LDA   sprDATA7+1,Y	; 
            STA   $5A81,X
            LDA   sprDATA8+1,Y	; 
            STA   $5E81,X
            LDA   sprDATA1,Y	; 
            STA   $4280,X
            LDA   sprDATA2,Y	; 
            STA   $4680,X
            LDA   sprDATA3,Y	; 
            STA   $4A80,X
            LDA   sprDATA4,Y	; 
            STA   $4E80,X
            LDA   sprDATA5,Y	; 
            STA   $5280,X
            LDA   sprDATA6,Y	; 
            STA   $5680,X
            LDA   sprDATA7,Y	; 
            STA   $5A80,X
            LDA   sprDATA8,Y	; 
            STA   $5E80,X
            LDY   $4E
L830A       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EB
            BEQ   L8319
L8316       STA   SPKR
L8319       LDA   sprDATA1+3,Y	; 
            STA   $4029,X
            LDA   sprDATA2+3,Y	; 
            STA   $4429,X
            LDA   sprDATA3+3,Y	; 
            STA   $4829,X
            LDA   sprDATA4+3,Y	; 
            STA   $4C29,X
            LDA   sprDATA5+3,Y	; 
            STA   $5029,X
            LDA   sprDATA6+3,Y	; 
            STA   $5429,X
            LDA   sprDATA7+3,Y	; 
            STA   $5829,X
            LDA   sprDATA8+3,Y	; 
            STA   $5C29,X
            LDA   sprDATA1+2,Y	; 
            STA   $4028,X
            LDA   sprDATA2+2,Y	; 
            STA   $4428,X
            LDA   sprDATA3+2,Y	; 
            STA   $4828,X
            LDA   sprDATA4+2,Y	; 
            STA   $4C28,X
            LDA   sprDATA5+2,Y	; 
            STA   $5028,X
            LDA   sprDATA6+2,Y	; 
            STA   $5428,X
            LDA   sprDATA7+2,Y	; 
            STA   $5828,X
            LDA   sprDATA8+2,Y	; 
            STA   $5C28,X
            LDA   sprDATA1+1,Y	; 
            STA   $4381,X
            LDA   sprDATA2+1,Y	; 
            STA   $4781,X
            LDA   sprDATA3+1,Y	; 
            STA   $4B81,X
            LDA   sprDATA4+1,Y	; 
            STA   $4F81,X
            LDA   sprDATA5+1,Y	; 
            STA   $5381,X
            LDA   sprDATA6+1,Y	; 
            STA   $5781,X
            LDA   sprDATA7+1,Y	; 
            STA   $5B81,X
            LDA   sprDATA8+1,Y	; 
            STA   $5F81,X
            LDA   sprDATA1,Y	; 
            STA   $4380,X
            LDA   sprDATA2,Y	; 
            STA   $4780,X
            LDA   sprDATA3,Y	; 
            STA   $4B80,X
            LDA   sprDATA4,Y	; 
            STA   $4F80,X
            LDA   sprDATA5,Y	; 
            STA   $5380,X
            LDA   sprDATA6,Y	; 
            STA   $5780,X
            LDA   sprDATA7,Y	; 
            STA   $5B80,X
            LDA   sprDATA8,Y	; 
            STA   $5F80,X
            LDY   $4E
L83DB       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EC
            BEQ   L83EA
L83E7       STA   SPKR
L83EA       LDA   sprDATA1+3,Y	; 
            STA   $4129,X
            LDA   sprDATA2+3,Y	; 
            STA   $4529,X
            LDA   sprDATA3+3,Y	; 
            STA   $4929,X
            LDA   sprDATA4+3,Y	; 
            STA   $4D29,X
            LDA   sprDATA5+3,Y	; 
            STA   $5129,X
            LDA   sprDATA6+3,Y	; 
            STA   $5529,X
            LDA   sprDATA7+3,Y	; 
            STA   $5929,X
            LDA   sprDATA8+3,Y	; 
            STA   $5D29,X
            LDA   sprDATA1+2,Y	; 
            STA   $4128,X
            LDA   sprDATA2+2,Y	; 
            STA   $4528,X
            LDA   sprDATA3+2,Y	; 
            STA   $4928,X
            LDA   sprDATA4+2,Y	; 
            STA   $4D28,X
            LDA   sprDATA5+2,Y	; 
            STA   $5128,X
            LDA   sprDATA6+2,Y	; 
            STA   $5528,X
            LDA   sprDATA7+2,Y	; 
            STA   $5928,X
            LDA   sprDATA8+2,Y	; 
            STA   $5D28,X
            LDA   sprDATA1+1,Y	; 
            STA   $40A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $44A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $48A9,X
            LDA   sprDATA4+1,Y	; 
            STA   $4CA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $50A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $54A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $58A9,X
            LDA   sprDATA8+1,Y	; 
            STA   $5CA9,X
            LDA   sprDATA1,Y	; 
            STA   $40A8,X
            LDA   sprDATA2,Y	; 
            STA   $44A8,X
            LDA   sprDATA3,Y	; 
            STA   $48A8,X
            LDA   sprDATA4,Y	; 
            STA   $4CA8,X
            LDA   sprDATA5,Y	; 
            STA   $50A8,X
            LDA   sprDATA6,Y	; 
            STA   $54A8,X
            LDA   sprDATA7,Y	; 
            STA   $58A8,X
            LDA   sprDATA8,Y	; 
            STA   $5CA8,X
            LDY   $4E
L84AC       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $ED
            BEQ   L84BB
L84B8       STA   SPKR
L84BB       LDA   sprDATA1+3,Y	; 
            STA   $4229,X
            LDA   sprDATA2+3,Y	; 
            STA   $4629,X
            LDA   sprDATA3+3,Y	; 
            STA   $4A29,X
            LDA   sprDATA4+3,Y	; 
            STA   $4E29,X
            LDA   sprDATA5+3,Y	; 
            STA   $5229,X
            LDA   sprDATA6+3,Y	; 
            STA   $5629,X
            LDA   sprDATA7+3,Y	; 
            STA   $5A29,X
            LDA   sprDATA8+3,Y	; 
            STA   $5E29,X
            LDA   sprDATA1+2,Y	; 
            STA   $4228,X
            LDA   sprDATA2+2,Y	; 
            STA   $4628,X
            LDA   sprDATA3+2,Y	; 
            STA   $4A28,X
            LDA   sprDATA4+2,Y	; 
            STA   $4E28,X
            LDA   sprDATA5+2,Y	; 
            STA   $5228,X
            LDA   sprDATA6+2,Y	; 
            STA   $5628,X
            LDA   sprDATA7+2,Y	; 
            STA   $5A28,X
            LDA   sprDATA8+2,Y	; 
            STA   $5E28,X
            LDA   sprDATA1+1,Y	; 
            STA   $41A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $45A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $49A9,X
            LDA   sprDATA4+1,Y	; 
            STA   $4DA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $51A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $55A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $59A9,X
            LDA   sprDATA8+1,Y	; 
            STA   $5DA9,X
            LDA   sprDATA1,Y	; 
            STA   $41A8,X
            LDA   sprDATA2,Y	; 
            STA   $45A8,X
            LDA   sprDATA3,Y	; 
            STA   $49A8,X
            LDA   sprDATA4,Y	; 
            STA   $4DA8,X
            LDA   sprDATA5,Y	; 
            STA   $51A8,X
            LDA   sprDATA6,Y	; 
            STA   $55A8,X
            LDA   sprDATA7,Y	; 
            STA   $59A8,X
            LDA   sprDATA8,Y	; 
            STA   $5DA8,X
            LDY   $4E
L857D       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EE
            BEQ   L858C
L8589       STA   SPKR
L858C       LDA   sprDATA1+3,Y	; 
            STA   $4329,X
            LDA   sprDATA2+3,Y	; 
            STA   $4729,X
            LDA   sprDATA3+3,Y	; 
            STA   $4B29,X
            LDA   sprDATA4+3,Y	; 
            STA   $4F29,X
            LDA   sprDATA5+3,Y	; 
            STA   $5329,X
            LDA   sprDATA6+3,Y	; 
            STA   $5729,X
            LDA   sprDATA7+3,Y	; 
            STA   $5B29,X
            LDA   sprDATA8+3,Y	; 
            STA   $5F29,X
            LDA   sprDATA1+2,Y	; 
            STA   $4328,X
            LDA   sprDATA2+2,Y	; 
            STA   $4728,X
            LDA   sprDATA3+2,Y	; 
            STA   $4B28,X
            LDA   sprDATA4+2,Y	; 
            STA   $4F28,X
            LDA   sprDATA5+2,Y	; 
            STA   $5328,X
            LDA   sprDATA6+2,Y	; 
            STA   $5728,X
            LDA   sprDATA7+2,Y	; 
            STA   $5B28,X
            LDA   sprDATA8+2,Y	; 
            STA   $5F28,X
            LDA   sprDATA1+1,Y	; 
            STA   $42A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $46A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $4AA9,X
            LDA   sprDATA4+1,Y	; 
            STA   $4EA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $52A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $56A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $5AA9,X
            LDA   sprDATA8+1,Y	; 
            STA   $5EA9,X
            LDA   sprDATA1,Y	; 
            STA   $42A8,X
            LDA   sprDATA2,Y	; 
            STA   $46A8,X
            LDA   sprDATA3,Y	; 
            STA   $4AA8,X
            LDA   sprDATA4,Y	; 
            STA   $4EA8,X
            LDA   sprDATA5,Y	; 
            STA   $52A8,X
            LDA   sprDATA6,Y	; 
            STA   $56A8,X
            LDA   sprDATA7,Y	; 
            STA   $5AA8,X
            LDA   sprDATA8,Y	; 
            STA   $5EA8,X
            LDY   $4E
L864E       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EF
            BEQ   L865D
L865A       STA   SPKR
L865D       LDA   sprDATA1+3,Y	; 
            STA   $4051,X
            LDA   sprDATA2+3,Y	; 
            STA   $4451,X
            LDA   sprDATA3+3,Y	; 
            STA   $4851,X
            LDA   sprDATA4+3,Y	; 
            STA   $4C51,X
            LDA   sprDATA5+3,Y	; 
            STA   $5051,X
            LDA   sprDATA6+3,Y	; 
            STA   $5451,X
            LDA   sprDATA7+3,Y	; 
            STA   $5851,X
            LDA   sprDATA8+3,Y	; 
            STA   $5C51,X
            LDA   sprDATA1+2,Y	; 
            STA   $4050,X
            LDA   sprDATA2+2,Y	; 
            STA   $4450,X
            LDA   sprDATA3+2,Y	; 
            STA   $4850,X
            LDA   sprDATA4+2,Y	; 
            STA   $4C50,X
            LDA   sprDATA5+2,Y	; 
            STA   $5050,X
            LDA   sprDATA6+2,Y	; 
            STA   $5450,X
            LDA   sprDATA7+2,Y	; 
            STA   $5850,X
            LDA   sprDATA8+2,Y	; 
            STA   $5C50,X
            LDA   sprDATA1+1,Y	; 
            STA   $43A9,X
            LDA   sprDATA2+1,Y	; 
            STA   $47A9,X
            LDA   sprDATA3+1,Y	; 
            STA   $4BA9,X
            LDA   sprDATA4+1,Y	; 
            STA   $4FA9,X
            LDA   sprDATA5+1,Y	; 
            STA   $53A9,X
            LDA   sprDATA6+1,Y	; 
            STA   $57A9,X
            LDA   sprDATA7+1,Y	; 
            STA   $5BA9,X
            LDA   sprDATA8+1,Y	; 
            STA   $5FA9,X
            LDA   sprDATA1,Y	; 
            STA   $43A8,X
            LDA   sprDATA2,Y	; 
            STA   $47A8,X
            LDA   sprDATA3,Y	; 
            STA   $4BA8,X
            LDA   sprDATA4,Y	; 
            STA   $4FA8,X
            LDA   sprDATA5,Y	; 
            STA   $53A8,X
            LDA   sprDATA6,Y	; 
            STA   $57A8,X
            LDA   sprDATA7,Y	; 
            STA   $5BA8,X
            LDA   sprDATA8,Y	; 
            STA   $5FA8,X
            LDY   $4E
L871F       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F0
            BEQ   L872E
L872B       STA   SPKR
L872E       LDA   sprDATA1+3,Y	; 
            STA   $4151,X
            LDA   sprDATA2+3,Y	; 
            STA   $4551,X
            LDA   sprDATA3+3,Y	; 
            STA   $4951,X
            LDA   sprDATA4+3,Y	; 
            STA   $4D51,X
            LDA   sprDATA5+3,Y	; 
            STA   $5151,X
            LDA   sprDATA6+3,Y	; 
            STA   $5551,X
            LDA   sprDATA7+3,Y	; 
            STA   $5951,X
            LDA   sprDATA8+3,Y	; 
            STA   $5D51,X
            LDA   sprDATA1+2,Y	; 
            STA   $4150,X
            LDA   sprDATA2+2,Y	; 
            STA   $4550,X
            LDA   sprDATA3+2,Y	; 
            STA   $4950,X
            LDA   sprDATA4+2,Y	; 
            STA   $4D50,X
            LDA   sprDATA5+2,Y	; 
            STA   $5150,X
            LDA   sprDATA6+2,Y	; 
            STA   $5550,X
            LDA   sprDATA7+2,Y	; 
            STA   $5950,X
            LDA   sprDATA8+2,Y	; 
            STA   $5D50,X
            LDA   sprDATA1+1,Y	; 
            STA   $40D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $44D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $48D1,X
            LDA   sprDATA4+1,Y	; 
            STA   $4CD1,X
            LDA   sprDATA5+1,Y	; 
            STA   $50D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $54D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $58D1,X
            LDA   sprDATA8+1,Y	; 
            STA   $5CD1,X
            LDA   sprDATA1,Y	; 
            STA   $40D0,X
            LDA   sprDATA2,Y	; 
            STA   $44D0,X
            LDA   sprDATA3,Y	; 
            STA   $48D0,X
            LDA   sprDATA4,Y	; 
            STA   $4CD0,X
            LDA   sprDATA5,Y	; 
            STA   $50D0,X
            LDA   sprDATA6,Y	; 
            STA   $54D0,X
            LDA   sprDATA7,Y	; 
            STA   $58D0,X
            LDA   sprDATA8,Y	; 
            STA   $5CD0,X
            LDY   $4E
L87F0       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F1
            BEQ   L87FF
L87FC       STA   SPKR
L87FF       LDA   sprDATA1+3,Y	; 
            STA   $4251,X
            LDA   sprDATA2+3,Y	; 
            STA   $4651,X
            LDA   sprDATA3+3,Y	; 
            STA   $4A51,X
            LDA   sprDATA4+3,Y	; 
            STA   $4E51,X
            LDA   sprDATA5+3,Y	; 
            STA   $5251,X
            LDA   sprDATA6+3,Y	; 
            STA   $5651,X
            LDA   sprDATA7+3,Y	; 
            STA   $5A51,X
            LDA   sprDATA8+3,Y	; 
            STA   $5E51,X
            LDA   sprDATA1+2,Y	; 
            STA   $4250,X
            LDA   sprDATA2+2,Y	; 
            STA   $4650,X
            LDA   sprDATA3+2,Y	; 
            STA   $4A50,X
            LDA   sprDATA4+2,Y	; 
            STA   $4E50,X
            LDA   sprDATA5+2,Y	; 
            STA   $5250,X
            LDA   sprDATA6+2,Y	; 
            STA   $5650,X
            LDA   sprDATA7+2,Y	; 
            STA   $5A50,X
            LDA   sprDATA8+2,Y	; 
            STA   $5E50,X
            LDA   sprDATA1+1,Y	; 
            STA   $41D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $45D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $49D1,X
            LDA   sprDATA4+1,Y	; 
            STA   $4DD1,X
            LDA   sprDATA5+1,Y	; 
            STA   $51D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $55D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $59D1,X
            LDA   sprDATA8+1,Y	; 
            STA   $5DD1,X
            LDA   sprDATA1,Y	; 
            STA   $41D0,X
            LDA   sprDATA2,Y	; 
            STA   $45D0,X
            LDA   sprDATA3,Y	; 
            STA   $49D0,X
            LDA   sprDATA4,Y	; 
            STA   $4DD0,X
            LDA   sprDATA5,Y	; 
            STA   $51D0,X
            LDA   sprDATA6,Y	; 
            STA   $55D0,X
            LDA   sprDATA7,Y	; 
            STA   $59D0,X
            LDA   sprDATA8,Y	; 
            STA   $5DD0,X
            LDY   $4E
L88C1       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F2
            BEQ   L88D0
L88CD       STA   SPKR
L88D0       LDA   sprDATA1+3,Y	; 
            STA   $4351,X
            LDA   sprDATA2+3,Y	; 
            STA   $4751,X
            LDA   sprDATA3+3,Y	; 
            STA   $4B51,X
            LDA   sprDATA4+3,Y	; 
            STA   $4F51,X
            LDA   sprDATA5+3,Y	; 
            STA   $5351,X
            LDA   sprDATA6+3,Y	; 
            STA   $5751,X
            LDA   sprDATA7+3,Y	; 
            STA   $5B51,X
            LDA   sprDATA8+3,Y	; 
            STA   $5F51,X
            LDA   sprDATA1+2,Y	; 
            STA   $4350,X
            LDA   sprDATA2+2,Y	; 
            STA   $4750,X
            LDA   sprDATA3+2,Y	; 
            STA   $4B50,X
            LDA   sprDATA4+2,Y	; 
            STA   $4F50,X
            LDA   sprDATA5+2,Y	; 
            STA   $5350,X
            LDA   sprDATA6+2,Y	; 
            STA   $5750,X
            LDA   sprDATA7+2,Y	; 
            STA   $5B50,X
            LDA   sprDATA8+2,Y	; 
            STA   $5F50,X
            LDA   sprDATA1+1,Y	; 
            STA   $42D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $46D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $4AD1,X
            LDA   sprDATA4+1,Y	; 
            STA   $4ED1,X
            LDA   sprDATA5+1,Y	; 
            STA   $52D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $56D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $5AD1,X
            LDA   sprDATA8+1,Y	; 
            STA   $5ED1,X
            LDA   sprDATA1,Y	; 
            STA   $42D0,X
            LDA   sprDATA2,Y	; 
            STA   $46D0,X
            LDA   sprDATA3,Y	; 
            STA   $4AD0,X
            LDA   sprDATA4,Y	; 
            STA   $4ED0,X
            LDA   sprDATA5,Y	; 
            STA   $52D0,X
            LDA   sprDATA6,Y	; 
            STA   $56D0,X
            LDA   sprDATA7,Y	; 
            STA   $5AD0,X
            LDA   sprDATA8,Y	; 
            STA   $5ED0,X
            LDY   $4E
L8992       LDA   tblFORE,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F3
            BEQ   L89A1
L899E       STA   SPKR
L89A1       LDA   sprDATA1+1,Y	; 
            STA   $43D1,X
            LDA   sprDATA2+1,Y	; 
            STA   $47D1,X
            LDA   sprDATA3+1,Y	; 
            STA   $4BD1,X
            LDA   sprDATA4+1,Y	; 
            STA   $4FD1,X
            LDA   sprDATA5+1,Y	; 
            STA   $53D1,X
            LDA   sprDATA6+1,Y	; 
            STA   $57D1,X
            LDA   sprDATA7+1,Y	; 
            STA   $5BD1,X
            LDA   sprDATA8+1,Y	; 
            STA   $5FD1,X
            LDA   sprDATA1,Y	; 
            STA   $43D0,X
            LDA   sprDATA2,Y	; 
            STA   $47D0,X
            LDA   sprDATA3,Y	; 
            STA   $4BD0,X
            LDA   sprDATA4,Y	; 
            STA   $4FD0,X
            LDA   sprDATA5,Y	; 
            STA   $53D0,X
            LDA   sprDATA6,Y	; 
            STA   $57D0,X
            LDA   sprDATA7,Y	; 
            STA   $5BD0,X
            LDA   sprDATA8,Y	; 
            STA   $5FD0,X
            LDX   $4E
            DEX
            BPL   L8A0A
            LDA   TXTPAGE2
            RTS
L8A0A       JMP   L802B

*-----------------------------
* HIGH SCORES
*-----------------------------

ptrSCORES	=	*	; length is 50 bytes

L8A0D       HEX   4E4E4E
L8A10       HEX   00
L8A11       HEX   00
L8A12       HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
L8A17       HEX   4E4E4E
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
L8A21       HEX   4E4E4E
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
L8A2B       HEX   4E4E4E
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
L8A35       HEX   4E4E4E
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00
            HEX   00

*-----------------------------
* TITANIUM WALL ACTIONS
*-----------------------------

L8A3F       INC   $2E
            STY   $0B
            LDA   $0D
            STA   $0C
            JSR   getMOVE
            LDA   joyBTN
            BMI   L8A54
            JMP   L8AE2	; check movement
L8A51       JMP   L8ADF

L8A54       TXA
            BEQ   L8A51	; no movement
            CMP   #moveUP	; and DOWN
            BCS   L8AB3
            CMP   #moveLEFT
            BEQ   L8A62	; yes
            INY		; move right
            BNE   L8A63
L8A62       DEY
L8A63       LDA   ($58),Y
            CMP   #sprGRASS	; grass
            BEQ   L8AAB
            CMP   #sprDIAMOND	; diamond
            BNE   L8A73
            JSR   increaseSCORE
            JMP   L8AAB

L8A73       CMP   #sprBOULDER	; boulder?
            BNE   L8ADD
            LDA   theCOUNTER	; can I move
            AND   #$03
            BNE   L8ADD

            TXA
            CMP   #moveLEFT	; was I moving left?
            BEQ   L8A97	; yes
            INY		; no, right
            LDA   ($58),Y
            CMP   #sprEMPTY	; is the next block empty?
            BNE   L8ADD	; no
            LDA   #sprBOULDER	; yes, put the boulder
            STA   ($58),Y
            DEY
            LDA   #sprEMPTY	; put empty block
            STA   ($58),Y
            INY
            STA   $DF
            BNE   L8ADF

L8A97       DEY		; moving left
            LDA   ($58),Y
            CMP   #sprEMPTY	; is the block on the left empty?
            BNE   L8ADD	; no
            LDA   #sprBOULDER	; yes, put the boulder
            STA   ($58),Y
            INY
            LDA   #sprEMPTY	; put empty block
            STA   ($58),Y
            STA   $DF
            BNE   L8ADD
L8AAB       LDA   #sprEMPTY	; empty block
            STA   ($58),Y
            STA   $E0
            BNE   L8ADD

*--- Can I move up or down?

L8AB3       BNE   L8ACA	; it is down
            LDA   ($56),Y	; it is up
            CMP   #sprGRASS	; is this grass?
            BEQ   L8AC2	; yes
            CMP   #sprDIAMOND	; a diamond?
            BNE   L8ADD
            JSR   increaseSCORE
L8AC2       LDA   #sprEMPTY	; empty block
            STA   ($56),Y
            STA   $E0
            BNE   L8ADD
L8ACA       LDA   ($5A),Y
            CMP   #sprGRASS	; grass?
            BEQ   L8AD7
            CMP   #sprDIAMOND	; diamond
            BNE   L8ADD
            JSR   increaseSCORE
L8AD7       LDA   #sprEMPTY	; empty block
            STA   ($5A),Y
            STA   $E0
L8ADD       LDY   theY
L8ADF       JMP   L0B32

L8AE2       TXA
            BEQ   L8ADF	; no movement
            LDA   #$03
            STA   $0E
            TXA
            CMP   #$03	; up/down?
            BCC   L8AF1	; no, left/right
            JMP   L8BAC	; yes, up/down

* Check left

L8AF1       CMP   #moveLEFT
            BNE   L8B4D
            DEY
            LDA   ($58),Y	; what is on the left?
            CMP   #sprEMPTY	; empty block?
            BEQ   L8B12
            CMP   #sprEXIT	; exit?
            BEQ   L8B04
            CMP   #sprENTRY	; or entry
            BNE   L8B0C
L8B04       LDA   fgEXIT
            BPL   L8ADD
            STA   fgWON
            BNE   L8B12
L8B0C       CMP   #sprGRASS	; grass?
            BNE   L8B20
            STA   $E0
L8B12       LDA   #sprROCKFORD	; move Rockford
            STA   ($58),Y
            INY
            LDA   #sprEMPTY	; previous place is empty now
            STA   ($58),Y
            STA   $DF
L8B1D       JMP   L0B32

L8B20       CMP   #sprDIAMOND	; a diamond!
            BNE   L8B2A
            JSR   increaseSCORE
            JMP   L8B12	; move Rockford

L8B2A       CMP   #sprBOULDER	; boulder?
            BNE   L8ADD
            DEY
            LDA   ($58),Y	; check if I can push the boulder
            CMP   #sprEMPTY	; empty block on its left?
            BNE   L8ADD	; no
            LDA   theCOUNTER	; yes
            AND   #$03
            BNE   L8ADD
            LDA   #sprBOULDER	; move the boulder
            STA   ($58),Y
            INY
            LDA   #sprROCKFORD	; and Rockford
            STA   ($58),Y
            INY
            LDA   #sprEMPTY	; make the place clean
            STA   ($58),Y
            STA   $DF
            BNE   L8ADF

*--- Check right

L8B4D       INY
            LDA   ($58),Y
            CMP   #sprEMPTY	; empty block
            BEQ   L8B6A
            CMP   #sprEXIT	; exit?
            BEQ   L8B5C
            CMP   #sprENTRY	; or entry
            BNE   L8B64
L8B5C       LDA   fgEXIT	; exit activated?
            BPL   L8BA7
            STA   fgWON	; tell we won!
            BNE   L8B6A
L8B64       CMP   #sprGRASS	; grass
            BNE   L8B78
            STA   $E0
L8B6A       LDA   #sprROCKFORD	; move Rockford
            STA   ($58),Y
            DEY
            LDA   #sprEMPTY	; put empty block
            STA   ($58),Y
            INY
            STA   $DF
            BNE   L8B1D
L8B78       CMP   #sprDIAMOND	; diamond
            BNE   L8B82
            JSR   increaseSCORE
            JMP   L8B6A

L8B82       CMP   #sprBOULDER
            BNE   L8BA7
            INY
            LDA   ($58),Y
            CMP   #sprEMPTY
            BNE   L8BA7
            LDA   theCOUNTER
            AND   #$03
            BNE   L8BA7
            LDA   #sprBOULDER
            STA   ($58),Y
            DEY
            LDA   #sprROCKFORD
            STA   ($58),Y
            DEY
            LDA   #sprEMPTY
            STA   ($58),Y
            INY
            INY
            STA   $DF
            BNE   L8BA9
L8BA7       LDY   theY
L8BA9       JMP   L0B32

*--- Check up/down

L8BAC       BNE   L8BD2	; not up
            LDA   ($56),Y	; up
            CMP   #sprGRASS
            BEQ   L8C0B
            CMP   #sprEMPTY
            BEQ   L8C0B
            CMP   #sprEXIT
            BEQ   L8BC0
            CMP   #sprENTRY
            BNE   L8BC8
L8BC0       LDA   fgEXIT
            BPL   L8BA9
            STA   fgWON
            BNE   L8C0B
L8BC8       CMP   #sprDIAMOND
            BNE   L8BA9
            JSR   increaseSCORE
            JMP   L8C0B

L8BD2       LDA   ($5A),Y	; do down
            CMP   #sprGRASS
            BEQ   L8BF3
            CMP   #sprEMPTY
            BEQ   L8BF3
            CMP   #sprEXIT
            BEQ   L8BE4
            CMP   #sprENTRY
            BNE   L8BEC
L8BE4       LDA   fgEXIT
            BPL   L8BA9
            STA   fgWON
            BNE   L8BF3
L8BEC       CMP   #sprDIAMOND
            BNE   L8BA9
            JSR   increaseSCORE
L8BF3       INC   $0C
            CMP   #sprGRASS
            BNE   L8BFB
            STA   $E0
L8BFB       STA   $DF
            LDA   #sprROCKFORD
            STA   ($5A),Y
            STA   |$0084,Y
            LDA   #sprEMPTY
            STA   ($58),Y
            JMP   L0B32

L8C0B       DEC   $0C
            CMP   #sprGRASS
            BNE   L8C13
            STA   $E0
L8C13       STA   $DF
            LDA   #sprROCKFORD
            STA   ($56),Y
            LDA   #sprEMPTY
            STA   ($58),Y
            JMP   L0B32

L8C20       LDA   $37
            STA   ($58),Y
            STA   $E3
            INC   $34
            LDA   $36
            BNE   L8C62
            LDA   ($56),Y
            CMP   #sprEMPTY
            BEQ   L8C5C
            CMP   #sprGRASS
            BEQ   L8C5C
            LDA   ($5A),Y
            CMP   #sprEMPTY
            BEQ   L8C5C
            CMP   #sprGRASS
            BEQ   L8C5C
            INY
            LDA   ($58),Y
            CMP   #sprGRASS
            BEQ   L8C5C
            CMP   #sprEMPTY
            BEQ   L8C5C
            DEY
            DEY
            LDA   ($58),Y
            CMP   #sprGRASS
            BEQ   L8C5C
            CMP   #sprEMPTY
            BEQ   L8C5C
L8C57       LDY   theY
            JMP   L0B32

L8C5C       LDA   #$01
            STA   $36
            LDY   theY
L8C62       JSR   getRANDOM
            AND   rndMASK
            CMP   #$04
            BCS   L8C57
            ASL
            TAX
            LDA   L8C7C,X
            STA   L8C79+1
            LDA   L8C7C+1,X
            STA   L8C79+2
L8C79       JMP   L8C7C

L8C7C       DA    L8C84
            DA    L8C95
            DA    L8CA8
            DA    L8CB9

L8C84       LDA   ($56),Y
            CMP   #sprGRASS
            BCC   L8CC9
            CMP   #sprSPACE
            BCS   L8CC9
            LDA   #sprAMEOBA
            STA   ($56),Y
            JMP   L0B32

L8C95       INY
            LDA   ($58),Y
            CMP   #sprGRASS
            BCC   L8C57
            CMP   #sprSPACE
            BCS   L8C57
            LDA   #sprAMEOBA
            STA   ($58),Y
            DEY
            JMP   L0B32

L8CA8       LDA   ($5A),Y
            CMP   #sprGRASS
            BCC   L8CC9
            CMP   #sprSPACE
            BCS   L8CC9
            LDA   #sprAMEOBA
            STA   ($5A),Y
            JMP   L0B32

L8CB9       DEY
            LDA   ($58),Y
            CMP   #sprGRASS
            BCC   L8C57
            CMP   #sprSPACE
            BCS   L8C57
            LDA   #sprAMEOBA
            STA   ($58),Y
            INY
L8CC9       JMP   L0B32

* B2 - Ameoba becomes diamonds

L8CCC       LDA   theCOUNTER
            AND   #$07
            BEQ   L8CD9
L8CD2       LDA   #sprENTRY+1
            STA   ($58),Y
            JMP   L0B32

L8CD9       DEC   $4D
            BNE   L8CD2
            LDA   #sprDISGRASS+1
            STA   ($58),Y
            STA   $E1
            LDA   saveTIME
            STA   theTIME
            LDA   #$04
            STA   $2E
            JMP   L0B32

L8CEE       LDA   #sprEXIT+1
            STA   ($58),Y
            JMP   L0B32

L8CF5       LDA   #$A5
            STA   ($58),Y
            STA   $E1
            JMP   L0B32

L8CFE       LDA   #$A9
            STA   ($58),Y
            STA   $E1
            JMP   L0B32

L8D07       LDA   #sprROCKFORD
            STA   ($58),Y
            STA   $E1
            JMP   L0B32

*-----------------------------
* GET RANDOM NUMBER
*-----------------------------

getRANDOM   LDA   rndPTR1
            CLC
            ADC   #$01
            STA   rndPTR1
            LDA   rndPTR1+1
            ADC   #$00
            CMP   #>LD000
            BCS   L8D21
            LDA   #>LD000
L8D21       STA   rndPTR1+1
            LDA   rndPTR2
            SEC
            SBC   #$01
            STA   rndPTR2
            LDA   rndPTR2+1
            SBC   #$00
            CMP   #>LD000
            BCS   L8D34
            LDA   #>LFF00
L8D34       STA   rndPTR2+1
            STY   theY
            LDY   #$00
            LDA   (rndPTR1),Y
            ADC   (rndPTR2),Y
            LDY   theY
            ADC   rndVALUE1
            STA   rndVALUE1
            RTS

*-----------------------------
* GET RANDOM NUMBER
*-----------------------------

getRANDOM2  STA   $02
            JSR   getRANDOM
            STA   $00
            LDA   #$00
            STA   $01
            LDY   #$08
L8D52       LDA   $00
            CLC
            ADC   $00
            STA   $00
            LDA   $01
            ADC   $01
            STA   $01
            SEC
            SBC   $02
            BCC   L8D66
            STA   $01
L8D66       DEY
            BNE   L8D52
            LDY   theY
            LDA   $01
            RTS

*-----------------------------
* GET RANDOM NUMBER
*-----------------------------

getRANDOM3  LDA   rndVALUE3	; 0000_0000
            ROR		; 0000_0000
            ROR		; 0000_0000
            AND   #$80	; 0000_0000
            STA   rndVALUE4	; 0000_0000
            LDA   rndVALUE2	; 0000_1010
            ROR		; 0000_0101
            AND   #$7F	; 0000_0101
            STA   rndVALUE5	; 0000_0101
            LDA   rndVALUE2	; 0000_1010
            ROR		; 0000_0101
            ROR		; 0000_0010 1
            AND   #$80	; 0000_0000
            CLC		; 0000_0000
            ADC   rndVALUE2	; 0000_1010
            ADC   #$13	; 0001_0011
            STA   rndVALUE2	; 0001_1101
            LDA   rndVALUE3	; 0000_0000
            ADC   rndVALUE4	; 0000_0000
            ADC   rndVALUE5	; 0000_0101
            STA   rndVALUE3	; 0000_0101
            RTS

*-----------------------------
* ENTRY ANIMATION
*-----------------------------

L8D93       LDA   #$1E
            STA   strY
L8D97       LDA   #$46
            STA   strX
L8D9B       JSR   getRANDOM
            AND   #$03
            TAX
            CLC
            ADC   #>tblFORE
            STA   $00+1
            JSR   getRANDOM
            TAY
            LDA   #<tblFORE
            STA   $00
            LDA   #sprWTITA
            STA   ($00),Y
            DEC   strX
            BNE   L8D9B

            JSR   animSPRITES

            LDY   #$60	; rolling sprite
L8DBB       LDA   sprDATA1,Y
            STA   $02
            LDA   sprDATA2,Y
            STA   sprDATA1,Y
            LDA   sprDATA3,Y
            STA   sprDATA2,Y
            LDA   sprDATA4,Y
            STA   sprDATA3,Y
            LDA   sprDATA5,Y
            STA   sprDATA4,Y
            LDA   sprDATA6,Y
            STA   sprDATA5,Y
            LDA   sprDATA7,Y
            STA   sprDATA6,Y
            LDA   sprDATA8,Y
            STA   sprDATA7,Y
            LDA   $02
            STA   sprDATA8,Y
            INY
            CPY   #$64
            BNE   L8DBB
            JSR   drawBOARD
            DEC   strY
            BEQ   L8DFE
            JMP   L8D97

L8DFE       LDA   #<tblFORE	; clear everything now
            STA   $00
            LDA   #>tblFORE
            STA   $00+1
            LDA   #sprWTITA
            LDY   #$00
L8E0A       STA   ($00),Y
            INY
            BNE   L8E0A
            LDX   $00+1
            INX
            STX   $00+1
            CPX   #>sprDATA1
            BNE   L8E0A
            JMP   drawBOARD

*-----------------------------
* INCREASE SCORE
*-----------------------------

increaseSCORE
            SED		; set decimal mode
            STY   strY	; save Y
            STX   strX	; save X

            LDY   curPLAYER	; the current player
            LDX   levelP1,Y	; get the player's level

            LDY   #$00	; no action
            INC   $30
            LDA   $30
            STA   $E6
            CMP   L7409,X	; has player reached the minimum
            BCC   L8E48	; quantity of diamonds to collect
            BNE   L8E43

            LDA   #$01	; yyyeess
            STA   flashCOUNTER
            LDA   #$FF
            STA   fgEXIT
            STA   $E2
            LDA   #$02
            STA   theACTION
            BNE   L8E4A

L8E43       LDA   #$FF
            STA   fgEXIT
            INY
L8E48       STY   theACTION

L8E4A       CLC
            LDA   #$00	; offset of PLR1
            LDX   curPLAYER	; is this P1?
            BEQ   L8E53	; yes
            ADC   #$03	; no, offset of PLR2

* Add to score

L8E53       TAX
            LDA   scoreP1+2,X
            ADC   L7400+2,Y
            STA   scoreP1+2,X
            LDA   scoreP1+1,X
            ADC   #$00
            STA   scoreP1+1,X
            BCC   L8E65
            INC   scoreP1,X

* Check if extra life

L8E65       LDA   scoreP1+1,X	; we have an extra life if
            LDX   curPLAYER	; we reach 500, then 1000, then 1500...
            CMP   extraP1,X
            BNE   L8E82	; no...

            LDA   extraP1,X	; ...yes
            CLC
            ADC   #$05
            STA   extraP1,X	; next limit is +500 points
	  
            LDA   #$F0	; flash for 16 times
            STA   flashCOUNTER
            LDA   livesP1,X	; extra life
            CMP   #MAXLIVES
            BCS   L8E82
            ADC   #$01
            STA   livesP1,X

L8E82       LDX   strX	; restore X
            INC   theACTION
            LDY   strY	; restore Y
            CLD		; clear decimal mode
            RTS

*-----------------------------
* CLEAR ZP FOR ROWS
*-----------------------------

clearZPROWS LDA   #$00	; clear ZP $DF..$F3
            LDX   #$14	; see L7500 and after
L8E8E       STA   $DF,X
            DEX
            BPL   L8E8E
            RTS

*-----------------------------
* PLAY MUSIC
*-----------------------------

playMUSIC   LDA   #$08
            STA   $FA
            LDA   #$13
            STA   $FB
            LDX   #$00
L8E9E       LDA   L8FA1,X
            BEQ   L8EBE
            SEC
            SBC   #$0F
            STA   $FC
            JSR   L8EBF
            INX
            cpx   #$33
            bne   notMIDDLE
            txa
            pha
            jsr   drawHIGHSCORES
            pla
            tax
notMIDDLE   LDA   #$4F
            JSR   WAIT
            JSR   checkBUTTON
            BCS   L8EBE
            LDA   KBD
            BPL   L8E9E
            STA   KBDSTROBE
            cmp   #$91
            beq   L8EC0
L8EBE       RTS
L8EBF       JMP   L8EF6
L8EC0       jmp   doQUIT

L8EC2       LDY   $F5
L8EC4       LDA   SPKR
L8EC7       INC   $F6
            BNE   L8ED0
            INC   $F7
            BNE   L8ED4
            RTS

L8ED0       NOP
            JMP   L8ED4

L8ED4       DEY
            BEQ   L8EDC
            JMP   L8EDA

L8EDA       BNE   L8EC7
L8EDC       LDY   $F4
L8EDE       LDA   SPKR
L8EE1       INC   $F6
            BNE   L8EEA
            INC   $F7
            BNE   L8EEE
            RTS

L8EEA       NOP
            JMP   L8EEE

L8EEE       DEY
            BEQ   L8EC2
            JMP   L8EF4

L8EF4       BNE   L8EE1
L8EF6       LDA   $FC
            ASL
            TAY
            LDA   L8F3B,Y
            STA   $F4
            LDA   $FA
L8F01       LSR
            BEQ   L8F08
            LSR   $F4
            BNE   L8F01
L8F08       LDA   L8F3B,Y
            SEC
            SBC   $F4
            STA   $F5
            INY
            LDA   L8F3B,Y
            ADC   $F4
            STA   $F4
            LDA   #$00
            SEC
            SBC   $FB
            STA   $F7
            LDA   #$00
            STA   $F6
            LDA   $F5
            BNE   L8EC2
L8F27       NOP
            NOP
            JMP   L8F2C

L8F2C       INC   $F6
            BNE   L8F35
            INC   $F7
            BNE   L8F39
            RTS

L8F35       NOP
            JMP   L8F39
L8F39       BNE   L8F27

*-----------------------------
* MUSIC DATA
*-----------------------------

L8F3B       HEX   0000F6F6E8E8DBDBCFCFC3C3B8B8AEAE
            HEX   A4A49B9B92928A8A82827B7B74746D6E
            HEX   676861625C5C575752524D4E49494545
            HEX   41413D3E3A3A3637333430312E2E2B2C
            HEX   292926272425222320211E1F1D1D1B1C
            HEX   1A1A1819171715161415131412121111
            HEX   10100F100E0F

L8FA1       HEX   2226292E242729302A2C2E312C372D35
            HEX   222E1D2420302420222E1D242A3A2E2A
            HEX   202C1B2228382C281D2D1F2E27273327
            HEX   16161616222216161414141420201414
            HEX   16321633223216331432143320301431
            HEX   2E3A2E382E372E352C382C382C332C38
            HEX   16321633223216331432143320301431
            HEX   322E2926302C2720322E2926302C2720
            HEX   00

*-----------------------------
* DRAW HIGH SCORES
*-----------------------------

drawHIGHSCORES
	jsr	clearHGRPAGES
	jsr	drawBOULDERDASH

            LDX   #$13
L9037       LDA   strBOULDERDASHERS,X
            STA   theSTRING,X
            DEX
            BPL   L9037
            LDY   #$14
            JSR   drawSTRING

L9045       LDX   #$13	; clear string
            LDA   #sprSPACE
L9049       STA   theSTRING,X
            DEX
            BPL   L9049

            LDX   #$02	; draw diamonds
L9051       LDA   L8A0D,X
            STA   theSTRING+5,X	; L639D,X
            DEX
            BPL   L9051
            LDY   #$00
            JSR   L90FA
            LDY   #$32
            JSR   drawSTRING

            LDX   #$02	; draw name
L9066       LDA   L8A17,X
            STA   theSTRING+5,x	; L639D,X
            DEX
            BPL   L9066
            LDY   #$0A
            JSR   L90FA
            LDY   #$46
            JSR   drawSTRING

            LDX   #$02
L907B       LDA   L8A21,X
            STA   theSTRING+5,x	; L639D,X
            DEX
            BPL   L907B
            LDY   #$14
            JSR   L90FA
            LDY   #$5A
            JSR   drawSTRING

            LDX   #$02
L9090       LDA   L8A2B,X
            STA   theSTRING+5,x	; L639D,X
            DEX
            BPL   L9090
            LDY   #$1E
            JSR   L90FA
            LDY   #$6E
            JSR   drawSTRING

            LDX   #$02
L90A5       LDA   L8A35,X
            STA   theSTRING+5,x	; L639D,X
            DEX
            BPL   L90A5
            LDY   #$28
            JSR   L90FA
            LDY   #$82
            JMP   drawSTRING

*---

L90B8       LDX   #$13
            LDA   #sprSPACE	; space character
L90BC       STA   theSTRING,X
            DEX
            BPL   L90BC

            LDX   #$06	; draw PLAYER
L90C4       LDA   strPLAYER,X
            STA   theSTRING+6,X	; L639E,X
            DEX
            BPL   L90C4

            LDA   curPLAYER
            ASL
            ADC   #$02
            STA   theSTRING+14	; L63A6
            LDY   #$A0
            JSR   drawSTRING

            LDX   #$13
L90DC       LDA   strENTERINITIALS,X
            STA   theSTRING,X
            DEX
            BPL   L90DC
            LDY   #$AA
            JSR   drawSTRING

            LDX   #$13
L90EC       LDA   strORPRESSBUTTON,X
            STA   theSTRING,X
            DEX
            BPL   L90EC
            LDY   #$B4
            JMP   drawSTRING

L90FA       LDA   L8A10,Y
            LDX   #$09
            JSR   int2ASCII
            INX
            LDA   L8A11,Y
            JSR   int2ASCII
            INX
            LDA   L8A12,Y
            JMP   int2ASCII

*-----------------------------
* CHECK HIGH SCORES
*-----------------------------

checkHIGHSCORES
	lda	#0	; no high scores to save on disk
	sta	fgHIGH

            LDA   #$FF	; start with player -1 :-)
            STA   curPLAYER
L9114       INC   curPLAYER	; check the two players'
            LDA   curPLAYER	; score
            CMP   #MAXPLRS
            BNE   L911D
            
	lda	fgHIGH	; did we change something
	beq	noneTOSAVE	; in the list?
	jsr	saveSCORES	; yes, save
noneTOSAVE	rts

L911D       LDA   #$00	; get the player's score
            STA   $58+1	; pointer
            CLC
            LDA   #scoreP1
            LDX   curPLAYER
            BEQ   L912A
            ADC   #$03	; or player 2
L912A       STA   $58

            LDA   #<L8A10	; get high scores
            STA   $56	; pointer
            LDA   #>L8A10
            STA   $56+1
            STA   $5B

            LDX   #$00	; compare the scores
L9138       LDY   #$00
L913A       LDA   ($56),Y	; high score
            CMP   ($58),Y	; player's score
            BCC   L9158	; old is lower
            BEQ   L9150	; old is equal
L9142       LDA   $56	; old is higher
            ADC   #SIZEHIGH	; next high score
            STA   $56
            INX		; index
            CPX   #MAXHIGH
            BCC   L9138
            JMP   L9114	; do the other player

L9150       INY		; check next score byte
            CPY   #SIZESCORE	; until the end
            BNE   L913A
            SEC		; nope
            BEQ   L9142	; loop

L9158       STX   theX	; move scores
            LDA   $56
            STA   $02
            LDA   #<L8A35
            STA   $56
L9162       CPX   #$04
            BEQ   L917D
            LDA   $56
            SEC
            SBC   #$0A
            STA   $5A
            LDY   #$05
L916F       LDA   ($5A),Y
            STA   ($56),Y
            DEY
            BPL   L916F
            LDA   $5A
            STA   $56
            INX
            BNE   L9162
L917D       LDX   theX
            LDA   $02
            STA   $56
            LDY   #$02
L9185       LDA   ($58),Y
            STA   ($56),Y
            DEY
            BPL   L9185
            LDA   $56
            SEC
            SBC   #$03
            STA   $56

            LDY   #$02
            LDA   #chrDIAMOND
L9197       STA   ($56),Y
            DEY
            BPL   L9197
            JSR   drawHIGHSCORES
            JSR   L90B8
            LDY   #$00
L91A4       STY   theY
            JSR   L9045
L91A9       ldy   theY
*       JSR   getMOVE
*            LDA   joyBTN	; did we press a button?
*            BMI   L91E0	; yes
            LDA   KBD	; did we press a key?
            BPL   L91A9	; no, we did not
            STA   KBDSTROBE	; yes, we did
            CMP   #$8D	; RETURN
            BEQ   L91E0	; ...exit
            CMP   #$88	; LEFT ARROW
            BEQ   L91D6

	cmp	#"a"	; lower to upper
	bcc	hsKEY
	cmp	#"z"+1
	bcs	hsKEY
	sbc	#$1f
	
hsKEY       CMP   #"A"	; A
            BCC   L91A9
            CMP   #"Z"+1	; Z+1
            BCS   L91A9
            SBC   #"A"-1	; 1..1B
            ASL		; 2..36
            ADC   #$14	; 16..4A
            CPY   #$03
            BEQ   L91A4
            STA   ($56),Y	; save A..Z
            INY
            BPL   L91A4
L91D6       DEY
            BPL   L91DA
            INY
L91DA       LDA   #chrDIAMOND	; diamond
            STA   ($56),Y
            BNE   L91A4

L91E0	inc	fgHIGH	; tell to saves scores
	jmp	L9114	; loop for the next player

*-----------------------------
* STRINGS
*-----------------------------

strBOULDERDASH
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   16	; B
            HEX   30	; O
            HEX   3C	; U
            HEX   2A	; L
            HEX   1A	; D
            HEX   1C	; E
            HEX   36	; R
            HEX   74	; space
            HEX   1A	; D
            HEX   14	; A
            HEX   38	; S
            HEX   22	; H
            HEX   74	; space
            HEX   74	; space

strBOULDERDASHERS
            HEX   74	; space
            HEX   74	; space
            HEX   16	; B
            HEX   30	; O
            HEX   3C	; U
            HEX   2A	; L
            HEX   1A	; D
            HEX   1C	; E
            HEX   36	; R
            HEX   74	; space
            HEX   74	; space
            HEX   16	; B
            HEX   14	; A
            HEX   38	; S
            HEX   22	; H
            HEX   1C	; E
            HEX   36	; R
            HEX   38	; S
            HEX   74	; space
            HEX   74	; space

strENTERINITIALS
            HEX   1C	; E
            HEX   2E	; N
            HEX   3A	; T
            HEX   1C	; E
            HEX   36	; R
            HEX   74	; space
            HEX   44	; Y
            HEX   30	; O
            HEX   3C	; U
            HEX   36	; R
            HEX   74	; space
            HEX   24	; I
            HEX   2E	; N
            HEX   24	; I
            HEX   3A	; T
            HEX   24	; I
            HEX   14	; A
            HEX   2A	; L
            HEX   38	; S
            HEX   4A	; ,

strORPRESSBUTTON
            HEX   74	; space
            HEX   74	; space
            HEX   30	; O
            HEX   36	; R
            HEX   74	; space
            HEX   32	; P
            HEX   36	; R
            HEX   1C	; E
            HEX   38	; S
            HEX   38	; S
            HEX   74	; space
            HEX   16	; B
            HEX   3C	; U
            HEX   3A	; T
            HEX   3A	; T
            HEX   30	; O
            HEX   2E	; N
            HEX   48	; :
            HEX   74	; space
            HEX   74	; space

*-----------------------------
* ALL LEVEL DATA
*-----------------------------

L9231       HEX   01	; 7400 cave index
            HEX   14	; 7401 threshold of diamond value
            HEX   0A	; 7402 value of a standard diamond
            HEX   0F	; 7403 value of an extra diamond

            HEX   0A	; 7404 \ number of diamonds
            HEX   0B	; 7405 ! per difficulty level
            HEX   0C	; 7406 !
            HEX   0D	; 7407 !
            HEX   0E	; 7408 /

            HEX   0C	; 7409 \ number of diamonds to collect
            HEX   0C	; 740A ! to activate the exit
            HEX   0C	; 740B !
            HEX   0C	; 740C !
            HEX   0C	; 740D /

            HEX   96	; 740E \ time to finish the level
            HEX   6E	; 740F !
            HEX   46	; 7410 !
            HEX   28	; 7411 !
            HEX   1E	; 7412 /

            HEX   08	; 7413
            HEX   0B	; 7414
            HEX   09	; 7415
            HEX   D4	; 7416
            HEX   20	; 7417

            HEX   00	; 7418
            HEX   10	; 7419
            HEX   14	; 741A
            HEX   00	; 741B

            HEX   3C	; 741C
            HEX   32	; 741D
            HEX   09	; 741E
            HEX   00	; 741F

            HEX   42	; 7420
            HEX   01	; 7421
            HEX   09	; 7422
            HEX   1E	; 7423
            HEX   02	; 7424
            HEX   42	; 7425
            HEX   09	; 7426
            HEX   10	; 7427
            HEX   1E	; 7428
            HEX   02	; 7429
            HEX   25	; 742A
            HEX   03	; 742B
            HEX   04	; 742C
            HEX   04	; 742D
            HEX   26	; 742E
            HEX   12	; 742F
            HEX   FF	; 7430 - end of level

*--- See the exploded view above

*L9231       HEX   01140A0F0A0B0C0D0E0C0C0C0C0C966E
*            HEX   46281E080B09D420001014003C320900
*            HEX   4201091E024209101E02250304042612
*            HEX   FF

L9262       HEX   0214143203000157580A0C090D0A966E
            HEX   4646460A04090000001014083C320902
            HEX   420108260242010F2602420803140442
            HEX   10031404421803140442200314044001
            HEX   05260240010B26024001122602401403
            HEX   1404251215041216FF
L92BB       HEX   03000F00003236343718171817159664
            HEX   5A504609080904000210140064320900
            HEX   250304042714FF
L92E2       HEX   04140514006E70737724242424247864
            HEX   503C3204080900001000000014000000
            HEX   25010304261681080A040400300A0B81
            HEX   100A04040030120B81180A040400301A
            HEX   0B81200A04040030220BFF
L932D       HEX   0514325A000000000004050607089678
            HEX   5A3C1E090A0900000000000000000000
            HEX   25010304271680080A03030080100A03
            HEX   030080180A03030080200A0303001409
            HEX   0C080A0A14110C08120A14190C081A0A
            HEX   14210C08220A80081003030080101003
            HEX   03008018100303008020100303001409
            HEX   12080A10141112081210141912081A10
            HEX   142112082210FF
L93B4       HEX   0614283C001415161704060708089678
            HEX   645A500E0A0900001000000032000000
            HEX   8201030A04008201060A04008201090A
            HEX   040082010C0A0400410A030D04140305
            HEX   08040514030808040814030B08040B14
            HEX   030E08040E821D030A0400821D060A04
            HEX   00821D090A0400821D0C0A0400411D03
            HEX   0D041424050823051424080823081424
            HEX   0B08230B14240E08230E250314042614
            HEX   FF
L9445       HEX   074B0A140207080A090F141919197878
            HEX   787878090A0D00000010080064280200
            HEX   4201070C02421C050B027A1315020214
            HEX   040614040E14041614220414220C1422
            HEX   16251403042707FF
L948D       HEX   08140A1401030405060A0F141414786E
            HEX   645A50020E090000001008005A320200
            HEX   14040614220414220C04000525140342
            HEX   01070C0242010F0C02421C050B02421C
            HEX   0D0B02430E110802140C10000E121413
            HEX   12410E0F0802FF
L94E4       HEX   0914050A64898CFB334B4B50555A9696
            HEX   828278080409000010140000F0780000
            HEX   82050A0D0D00010C0A82190A0D0D0001
            HEX   1F0A4211120902401113090225070C04
            HEX   080CFF
L9527       HEX   0A14193C00000000000C0C0C0C0C9682
            HEX   786E6406080900000000000000000000
            HEX   250D0304271654050411035415041105
            HEX   80050B110308C201041511000D04C207
            HEX   060D0D000D06C209080909000D08C20B
            HEX   0A0505000D0A820306030F0800040654
            HEX   04100404FF
L958C       HEX   0B143200000466976406060606067878
            HEX   9696F00B080900000010080064500200
            HEX   420A0309044214030904421E03090442
            HEX   09160900420C0F110242050B0902420F
            HEX   0B090242190B0902421C130B01140403
            HEX   140E0314180314220314041614231525
            HEX   1414042611FF
L95F2       HEX   0C141400003C023B6613130E1015B4AA
            HEX   A0A0A00C0A090000001014003C320900
            HEX   420A051204420E051204421205120442
            HEX   160512044202060B0242020A0B024202
            HEX   0E0F024202120B02811E040404000820
            HEX   05811E0904040008200A811E0E040400
            HEX   08200F250314042716FF
L965C       HEX   0D8C0508000102030432373C4650A09B
            HEX   96918C06080D00001000000028000000
            HEX   251203040A033A14034205121E027005
            HEX   131E025005141E02C105151E02FF
L969A       HEX   0E140A1400000000001E23282A2D9691
            HEX   8C87820C080900001000000000000000
            HEX   810A0A0D0D00700B0B0C03C10C0A030D
            HEX   C1100A030DC1140A030D5016080C0248
            HEX   16070C02C117060304C11B060304C11F
            HEX   060304250303042714FF
L96F4       HEX   0F080A14011D1E1F200F1414191E7878
            HEX   78788C080E0900000010080064500200
            HEX   4202040A03420F0D0A01410C0E030243
            HEX   0C0F0302041416251403FF
L972F       HEX   10140A140178817E7B0C0F0F0F0C9696
            HEX   969696090A0900001000000032000000
            HEX   250103042704810813040400080A14C2
            HEX   070A060843070A060281101304040008
            HEX   1214C20F0A0608430F0A060281181304
            HEX   0400081A14812013040400082214FF

* The extra levels

L978E       HEX   11141E000A0B0C0D0E06060606060A0A
            HEX   0A0A0A0E0209000000140000FF090000
            HEX   870002281607870002140C00320A0C10
            HEX   0A04010A0525030504120CFF
L97CA       HEX   12140A000A0B0C0D0E10101010100F0F
            HEX   0F0F0F060F0900000000000000000000
            HEX   870002281607870002140C0150010309
            HEX   03480203080354010508035001060703
            HEX   50120309055412050805501206070525
            HEX   0104041204FF
L9820       HEX   13040A000A0B0C0D0E0E0E0E0E0E1414
            HEX   14141406080900000000000000000000
            HEX   870002281607870002140C0054010C12
            HEX   02880F09040408250803041207FF
L985E       HEX   14031E00000000000006060606061414
            HEX   14141406080900000000000000000000
            HEX   870002281607870002140C01D00B0303
            HEX   02800B07030600430B060302430B0A03
            HEX   02500807030325030304090AFF

*-----------------------------
* TABLE OF LEVEL POINTERS
*-----------------------------

tblCAVES    DA    L9231	; A
            DA    L9262	; B
            DA    L92BB	; C
            DA    L92E2	; D
            DA    L978E	; E
            DA    L932D	; F
            DA    L93B4	; G
            DA    L9445	; H
            DA    L948D	; I
            DA    L97CA	; J
            DA    L94E4	; K
            DA    L9527	; L
            DA    L958C	; M
            DA    L95F2	; N
            DA    L9820	; O
            DA    L965C	; P
            DA    L969A	; Q
            DA    L96F4	; R
            DA    L972F	; S
            DA    L985E	; T

*-----------------------------
* MATCHING TABLE
*-----------------------------
* Table index gives sprite index
* when a cave is decoded

L98D3       HEX   70	; 00 
            HEX   6C	; 01 
            HEX   68	; 02 
            HEX   94	; 03 
            HEX   98	; 04 entry/exit
            HEX   9C	; 05 entry/exit
            HEX   00	; 06 
            HEX   64	; 07 
            HEX   83	; 08 
            HEX   80	; 09 
            HEX   81	; 0A 
            HEX   82	; 0B 
            HEX   83	; 0C 
            HEX   80	; 0D 
            HEX   81	; 0E 
            HEX   82	; 0F 
            HEX   88	; 10 
            HEX   88	; 11 
            HEX   89	; 12 
            HEX   89	; 13 
            HEX   8C	; 14 
            HEX   8C	; 15 
            HEX   8D	; 16 
            HEX   8D	; 17 
            HEX   00	; 18 
            HEX   00	; 19 
            HEX   00	; 1A 
            HEX   A0	; 1B 
            HEX   A0	; 1C 
            HEX   A0	; 1D 
            HEX   A0	; 1E 
            HEX   A0	; 1F 
            HEX   A0	; 20 
            HEX   A0	; 21 
            HEX   A0	; 22 
            HEX   A0	; 23 
            HEX   A0	; 24 
            HEX   9D	; 25 
            HEX   9D	; 26 
            HEX   9D	; 27 
            HEX   9D	; 28 
            HEX   00	; 29 
            HEX   00	; 2A 
            HEX   00	; 2B 
            HEX   00	; 2C 
            HEX   00	; 2D 
            HEX   00	; 2E 
            HEX   00	; 2F 
            HEX   86	; 30 
            HEX   87	; 31 
            HEX   84	; 32 
            HEX   85	; 33 
            HEX   86	; 34 
            HEX   87	; 35 
            HEX   84	; 36 
            HEX   85	; 37 
            HEX   F0	; 38 Rockford
            HEX   F0	; 39 Rockford
            HEX   90	; 3A ameoba
            HEX   90	; 3B ameoba

*-----------------------------
* STRINGS
*-----------------------------

strCAVELVL  HEX   18	; C
            HEX   14	; A
            HEX   3E	; V
            HEX   1C	; E
            HEX   48	; :
            HEX   74	; space
            HEX   14	; A
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   2A	; L
            HEX   1C	; E
            HEX   3E	; V
            HEX   1C	; E
            HEX   2A	; L
            HEX   48	; :
            HEX   74	; space
            HEX   02	; 2

str1PLAYER  HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   30	; O
            HEX   2E	; N
            HEX   1C	; E
            HEX   74	; space
            HEX   32	; P
            HEX   2A	; L
            HEX   14	; A
            HEX   44	; Y
            HEX   1C	; E
            HEX   36	; R
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

str2PLAYERS HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   3A	; T
            HEX   40	; W
            HEX   30	; O
            HEX   74	; space
            HEX   32	; P
            HEX   2A	; L
            HEX   14	; A
            HEX   44	; Y
            HEX   1C	; E
            HEX   36	; R
            HEX   38	; S
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

tblSTRPLRL  DB    <str1PLAYER,<str2PLAYERS
tblSTRPLRH  DB    >str1PLAYER,>str2PLAYERS

*-----------------------------
* Each line is on a separate table
* to avoid complex multiplications

tblCHARDATA DB    >sprDATA8,>sprDATA7,>sprDATA6,>sprDATA5
            DB    >sprDATA4,>sprDATA3,>sprDATA2,>sprDATA1

* The usual HGR line tables (a character is always on HGR1)

tblHGRL     HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0

tblHGRH     HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F

*--- End of file

	DS	\

*--- The old zero page

saveZP	ds	256
