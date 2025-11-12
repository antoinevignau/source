*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022, Brutal Deluxe Software
*

*-----------------------------
*
*            TYP   BIN
*            ORG   $007500
*            MX    %11
*
*-----------------------------

L7500       LDA   $19
            CLC
            ADC   #$01
            STA   $19
            CLC
            AND   #$01
            BEQ   L750F
            JMP   L7F8E

L750F       LDA   $05
            LDX   #$64
            LDY   $06
L7515       DEY
            BMI   L7520
            ADC   #$28
            BCC   L7515
            INX
            CLC
            BNE   L7515
L7520       STA   L7618+1
            STX   L7618+2
            ADC   #$28
            BCC   L752C
            INX
            CLC
L752C       STA   L76E9+1
            STX   L76E9+2
            ADC   #$28
            BCC   L7538
            INX
            CLC
L7538       STA   L77BA+1
            STX   L77BA+2
            ADC   #$28
            BCC   L7544
            INX
            CLC
L7544       STA   L788B+1
            STX   L788B+2
            ADC   #$28
            BCC   L7550
            INX
            CLC
L7550       STA   L795C+1
            STX   L795C+2
            ADC   #$28
            BCC   L755C
            INX
            CLC
L755C       STA   L7A2D+1
            STX   L7A2D+2
            ADC   #$28
            BCC   L7568
            INX
            CLC
L7568       STA   L7AFE+1
            STX   L7AFE+2
            ADC   #$28
            BCC   L7574
            INX
            CLC
L7574       STA   L7BCF+1
            STX   L7BCF+2
            ADC   #$28
            BCC   L7580
            INX
            CLC
L7580       STA   L7CA0+1
            STX   L7CA0+2
            ADC   #$28
            BCC   L758C
            INX
            CLC
L758C       STA   L7D71+1
            STX   L7D71+2
            ADC   #$28
            BCC   L7598
            INX
            CLC
L7598       STA   L7E42+1
            STX   L7E42+2
            ADC   #$28
            BCC   L75A4
            INX
            CLC
L75A4       STA   L7F13+1
            STX   L7F13+2
            LDX   #$13
L75AC       STX   $4E
            LDY   L6398,X
            TXA
            ASL
            TAX
            STX   $4F
            LDA   L6801,Y
            STA   $2001,X
            LDA   L6901,Y
            STA   $2401,X
            LDA   L6A01,Y
            STA   $2801,X
            LDA   L6B01,Y
            STA   $2C01,X
            LDA   L6C01,Y
            STA   $3001,X
            LDA   L6D01,Y
            STA   $3401,X
            LDA   L6E01,Y
            STA   $3801,X
            LDA   L6F01,Y
            STA   $3C01,X
            LDA   L6800,Y
            STA   $2000,X
            LDA   L6900,Y
            STA   $2400,X
            LDA   L6A00,Y
            STA   $2800,X
            LDA   L6B00,Y
            STA   $2C00,X
            LDA   L6C00,Y
            STA   $3000,X
            LDA   L6D00,Y
            STA   $3400,X
            LDA   L6E00,Y
            STA   $3800,X
            LDA   L6F00,Y
            STA   $3C00,X
            LDY   $4E
L7618       LDA   L6400,Y
            AND   #$FC
            TAY
            LDA   $E8
            BEQ   L7625
L7622       STA   SPKR
L7625       LDX   $4F
            LDA   L6803,Y
            STA   $2101,X
            LDA   L6903,Y
            STA   $2501,X
            LDA   L6A03,Y
            STA   $2901,X
            LDA   L6B03,Y
            STA   $2D01,X
            LDA   L6C03,Y
            STA   $3101,X
            LDA   L6D03,Y
            STA   $3501,X
            LDA   L6E03,Y
            STA   $3901,X
            LDA   L6F03,Y
            STA   $3D01,X
            LDA   L6802,Y
            STA   $2100,X
            LDA   L6902,Y
            STA   $2500,X
            LDA   L6A02,Y
            STA   $2900,X
            LDA   L6B02,Y
            STA   $2D00,X
            LDA   L6C02,Y
            STA   $3100,X
            LDA   L6D02,Y
            STA   $3500,X
            LDA   L6E02,Y
            STA   $3900,X
            LDA   L6F02,Y
            STA   $3D00,X
            LDA   L6801,Y
            STA   $2081,X
            LDA   L6901,Y
            STA   $2481,X
            LDA   L6A01,Y
            STA   $2881,X
            LDA   L6B01,Y
            STA   $2C81,X
            LDA   L6C01,Y
            STA   $3081,X
            LDA   L6D01,Y
            STA   $3481,X
            LDA   L6E01,Y
            STA   $3881,X
            LDA   L6F01,Y
            STA   $3C81,X
            LDA   L6800,Y
            STA   $2080,X
            LDA   L6900,Y
            STA   $2480,X
            LDA   L6A00,Y
            STA   $2880,X
            LDA   L6B00,Y
            STA   $2C80,X
            LDA   L6C00,Y
            STA   $3080,X
            LDA   L6D00,Y
            STA   $3480,X
            LDA   L6E00,Y
            STA   $3880,X
            LDA   L6F00,Y
            STA   $3C80,X
            LDY   $4E
L76E9       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $E9
            BEQ   L76F8
L76F5       STA   SPKR
L76F8       LDA   L6803,Y
            STA   $2201,X
            LDA   L6903,Y
            STA   $2601,X
            LDA   L6A03,Y
            STA   $2A01,X
            LDA   L6B03,Y
            STA   $2E01,X
            LDA   L6C03,Y
            STA   $3201,X
            LDA   L6D03,Y
            STA   $3601,X
            LDA   L6E03,Y
            STA   $3A01,X
            LDA   L6F03,Y
            STA   $3E01,X
            LDA   L6802,Y
            STA   $2200,X
            LDA   L6902,Y
            STA   $2600,X
            LDA   L6A02,Y
            STA   $2A00,X
            LDA   L6B02,Y
            STA   $2E00,X
            LDA   L6C02,Y
            STA   $3200,X
            LDA   L6D02,Y
            STA   $3600,X
            LDA   L6E02,Y
            STA   $3A00,X
            LDA   L6F02,Y
            STA   $3E00,X
            LDA   L6801,Y
            STA   $2181,X
            LDA   L6901,Y
            STA   $2581,X
            LDA   L6A01,Y
            STA   $2981,X
            LDA   L6B01,Y
            STA   $2D81,X
            LDA   L6C01,Y
            STA   $3181,X
            LDA   L6D01,Y
            STA   $3581,X
            LDA   L6E01,Y
            STA   $3981,X
            LDA   L6F01,Y
            STA   $3D81,X
            LDA   L6800,Y
            STA   $2180,X
            LDA   L6900,Y
            STA   $2580,X
            LDA   L6A00,Y
            STA   $2980,X
            LDA   L6B00,Y
            STA   $2D80,X
            LDA   L6C00,Y
            STA   $3180,X
            LDA   L6D00,Y
            STA   $3580,X
            LDA   L6E00,Y
            STA   $3980,X
            LDA   L6F00,Y
            STA   $3D80,X
            LDY   $4E
L77BA       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EA
            BEQ   L77C9
L77C6       STA   SPKR
L77C9       LDA   L6803,Y
            STA   $2301,X
            LDA   L6903,Y
            STA   $2701,X
            LDA   L6A03,Y
            STA   $2B01,X
            LDA   L6B03,Y
            STA   $2F01,X
            LDA   L6C03,Y
            STA   $3301,X
            LDA   L6D03,Y
            STA   $3701,X
            LDA   L6E03,Y
            STA   $3B01,X
            LDA   L6F03,Y
            STA   $3F01,X
            LDA   L6802,Y
            STA   $2300,X
            LDA   L6902,Y
            STA   $2700,X
            LDA   L6A02,Y
            STA   $2B00,X
            LDA   L6B02,Y
            STA   $2F00,X
            LDA   L6C02,Y
            STA   $3300,X
            LDA   L6D02,Y
            STA   $3700,X
            LDA   L6E02,Y
            STA   $3B00,X
            LDA   L6F02,Y
            STA   $3F00,X
            LDA   L6801,Y
            STA   $2281,X
            LDA   L6901,Y
            STA   $2681,X
            LDA   L6A01,Y
            STA   $2A81,X
            LDA   L6B01,Y
            STA   $2E81,X
            LDA   L6C01,Y
            STA   $3281,X
            LDA   L6D01,Y
            STA   $3681,X
            LDA   L6E01,Y
            STA   $3A81,X
            LDA   L6F01,Y
            STA   $3E81,X
            LDA   L6800,Y
            STA   $2280,X
            LDA   L6900,Y
            STA   $2680,X
            LDA   L6A00,Y
            STA   $2A80,X
            LDA   L6B00,Y
            STA   $2E80,X
            LDA   L6C00,Y
            STA   $3280,X
            LDA   L6D00,Y
            STA   $3680,X
            LDA   L6E00,Y
            STA   $3A80,X
            LDA   L6F00,Y
            STA   $3E80,X
            LDY   $4E
L788B       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EB
            BEQ   L789A
L7897       STA   SPKR
L789A       LDA   L6803,Y
            STA   $2029,X
            LDA   L6903,Y
            STA   $2429,X
            LDA   L6A03,Y
            STA   $2829,X
            LDA   L6B03,Y
            STA   $2C29,X
            LDA   L6C03,Y
            STA   $3029,X
            LDA   L6D03,Y
            STA   $3429,X
            LDA   L6E03,Y
            STA   $3829,X
            LDA   L6F03,Y
            STA   $3C29,X
            LDA   L6802,Y
            STA   $2028,X
            LDA   L6902,Y
            STA   $2428,X
            LDA   L6A02,Y
            STA   $2828,X
            LDA   L6B02,Y
            STA   $2C28,X
            LDA   L6C02,Y
            STA   $3028,X
            LDA   L6D02,Y
            STA   $3428,X
            LDA   L6E02,Y
            STA   $3828,X
            LDA   L6F02,Y
            STA   $3C28,X
            LDA   L6801,Y
            STA   $2381,X
            LDA   L6901,Y
            STA   $2781,X
            LDA   L6A01,Y
            STA   $2B81,X
            LDA   L6B01,Y
            STA   $2F81,X
            LDA   L6C01,Y
            STA   $3381,X
            LDA   L6D01,Y
            STA   $3781,X
            LDA   L6E01,Y
            STA   $3B81,X
            LDA   L6F01,Y
            STA   $3F81,X
            LDA   L6800,Y
            STA   $2380,X
            LDA   L6900,Y
            STA   $2780,X
            LDA   L6A00,Y
            STA   $2B80,X
            LDA   L6B00,Y
            STA   $2F80,X
            LDA   L6C00,Y
            STA   $3380,X
            LDA   L6D00,Y
            STA   $3780,X
            LDA   L6E00,Y
            STA   $3B80,X
            LDA   L6F00,Y
            STA   $3F80,X
            LDY   $4E
L795C       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EC
            BEQ   L796B
L7968       STA   SPKR
L796B       LDA   L6803,Y
            STA   $2129,X
            LDA   L6903,Y
            STA   $2529,X
            LDA   L6A03,Y
            STA   $2929,X
            LDA   L6B03,Y
            STA   $2D29,X
            LDA   L6C03,Y
            STA   $3129,X
            LDA   L6D03,Y
            STA   $3529,X
            LDA   L6E03,Y
            STA   $3929,X
            LDA   L6F03,Y
            STA   $3D29,X
            LDA   L6802,Y
            STA   $2128,X
            LDA   L6902,Y
            STA   $2528,X
            LDA   L6A02,Y
            STA   $2928,X
            LDA   L6B02,Y
            STA   $2D28,X
            LDA   L6C02,Y
            STA   $3128,X
            LDA   L6D02,Y
            STA   $3528,X
            LDA   L6E02,Y
            STA   $3928,X
            LDA   L6F02,Y
            STA   $3D28,X
            LDA   L6801,Y
            STA   $20A9,X
            LDA   L6901,Y
            STA   $24A9,X
            LDA   L6A01,Y
            STA   $28A9,X
            LDA   L6B01,Y
            STA   $2CA9,X
            LDA   L6C01,Y
            STA   $30A9,X
            LDA   L6D01,Y
            STA   $34A9,X
            LDA   L6E01,Y
            STA   $38A9,X
            LDA   L6F01,Y
            STA   $3CA9,X
            LDA   L6800,Y
            STA   $20A8,X
            LDA   L6900,Y
            STA   $24A8,X
            LDA   L6A00,Y
            STA   $28A8,X
            LDA   L6B00,Y
            STA   $2CA8,X
            LDA   L6C00,Y
            STA   $30A8,X
            LDA   L6D00,Y
            STA   $34A8,X
            LDA   L6E00,Y
            STA   $38A8,X
            LDA   L6F00,Y
            STA   $3CA8,X
            LDY   $4E
L7A2D       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $ED
            BEQ   L7A3C
L7A39       STA   SPKR
L7A3C       LDA   L6803,Y
            STA   $2229,X
            LDA   L6903,Y
            STA   $2629,X
            LDA   L6A03,Y
            STA   $2A29,X
            LDA   L6B03,Y
            STA   $2E29,X
            LDA   L6C03,Y
            STA   $3229,X
            LDA   L6D03,Y
            STA   $3629,X
            LDA   L6E03,Y
            STA   $3A29,X
            LDA   L6F03,Y
            STA   $3E29,X
            LDA   L6802,Y
            STA   $2228,X
            LDA   L6902,Y
            STA   $2628,X
            LDA   L6A02,Y
            STA   $2A28,X
            LDA   L6B02,Y
            STA   $2E28,X
            LDA   L6C02,Y
            STA   $3228,X
            LDA   L6D02,Y
            STA   $3628,X
            LDA   L6E02,Y
            STA   $3A28,X
            LDA   L6F02,Y
            STA   $3E28,X
            LDA   L6801,Y
            STA   $21A9,X
            LDA   L6901,Y
            STA   $25A9,X
            LDA   L6A01,Y
            STA   $29A9,X
            LDA   L6B01,Y
            STA   $2DA9,X
            LDA   L6C01,Y
            STA   $31A9,X
            LDA   L6D01,Y
            STA   $35A9,X
            LDA   L6E01,Y
            STA   $39A9,X
            LDA   L6F01,Y
            STA   $3DA9,X
            LDA   L6800,Y
            STA   $21A8,X
            LDA   L6900,Y
            STA   $25A8,X
            LDA   L6A00,Y
            STA   $29A8,X
            LDA   L6B00,Y
            STA   $2DA8,X
            LDA   L6C00,Y
            STA   $31A8,X
            LDA   L6D00,Y
            STA   $35A8,X
            LDA   L6E00,Y
            STA   $39A8,X
            LDA   L6F00,Y
            STA   $3DA8,X
            LDY   $4E
L7AFE       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EE
            BEQ   L7B0D
L7B0A       STA   SPKR
L7B0D       LDA   L6803,Y
            STA   $2329,X
            LDA   L6903,Y
            STA   $2729,X
            LDA   L6A03,Y
            STA   $2B29,X
            LDA   L6B03,Y
            STA   $2F29,X
            LDA   L6C03,Y
            STA   $3329,X
            LDA   L6D03,Y
            STA   $3729,X
            LDA   L6E03,Y
            STA   $3B29,X
            LDA   L6F03,Y
            STA   $3F29,X
            LDA   L6802,Y
            STA   $2328,X
            LDA   L6902,Y
            STA   $2728,X
            LDA   L6A02,Y
            STA   $2B28,X
            LDA   L6B02,Y
            STA   $2F28,X
            LDA   L6C02,Y
            STA   $3328,X
            LDA   L6D02,Y
            STA   $3728,X
            LDA   L6E02,Y
            STA   $3B28,X
            LDA   L6F02,Y
            STA   $3F28,X
            LDA   L6801,Y
            STA   $22A9,X
            LDA   L6901,Y
            STA   $26A9,X
            LDA   L6A01,Y
            STA   $2AA9,X
            LDA   L6B01,Y
            STA   $2EA9,X
            LDA   L6C01,Y
            STA   $32A9,X
            LDA   L6D01,Y
            STA   $36A9,X
            LDA   L6E01,Y
            STA   $3AA9,X
            LDA   L6F01,Y
            STA   $3EA9,X
            LDA   L6800,Y
            STA   $22A8,X
            LDA   L6900,Y
            STA   $26A8,X
            LDA   L6A00,Y
            STA   $2AA8,X
            LDA   L6B00,Y
            STA   $2EA8,X
            LDA   L6C00,Y
            STA   $32A8,X
            LDA   L6D00,Y
            STA   $36A8,X
            LDA   L6E00,Y
            STA   $3AA8,X
            LDA   L6F00,Y
            STA   $3EA8,X
            LDY   $4E
L7BCF       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EF
            BEQ   L7BDE
L7BDB       STA   SPKR
L7BDE       LDA   L6803,Y
            STA   $2051,X
            LDA   L6903,Y
            STA   $2451,X
            LDA   L6A03,Y
            STA   $2851,X
            LDA   L6B03,Y
            STA   $2C51,X
            LDA   L6C03,Y
            STA   $3051,X
            LDA   L6D03,Y
            STA   $3451,X
            LDA   L6E03,Y
            STA   $3851,X
            LDA   L6F03,Y
            STA   $3C51,X
            LDA   L6802,Y
            STA   $2050,X
            LDA   L6902,Y
            STA   $2450,X
            LDA   L6A02,Y
            STA   $2850,X
            LDA   L6B02,Y
            STA   $2C50,X
            LDA   L6C02,Y
            STA   $3050,X
            LDA   L6D02,Y
            STA   $3450,X
            LDA   L6E02,Y
            STA   $3850,X
            LDA   L6F02,Y
            STA   $3C50,X
            LDA   L6801,Y
            STA   $23A9,X
            LDA   L6901,Y
            STA   $27A9,X
            LDA   L6A01,Y
            STA   $2BA9,X
            LDA   L6B01,Y
            STA   $2FA9,X
            LDA   L6C01,Y
            STA   $33A9,X
            LDA   L6D01,Y
            STA   $37A9,X
            LDA   L6E01,Y
            STA   $3BA9,X
            LDA   L6F01,Y
            STA   $3FA9,X
            LDA   L6800,Y
            STA   $23A8,X
            LDA   L6900,Y
            STA   $27A8,X
            LDA   L6A00,Y
            STA   $2BA8,X
            LDA   L6B00,Y
            STA   $2FA8,X
            LDA   L6C00,Y
            STA   $33A8,X
            LDA   L6D00,Y
            STA   $37A8,X
            LDA   L6E00,Y
            STA   $3BA8,X
            LDA   L6F00,Y
            STA   $3FA8,X
            LDY   $4E
L7CA0       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F0
            BEQ   L7CAF
L7CAC       STA   SPKR
L7CAF       LDA   L6803,Y
            STA   $2151,X
            LDA   L6903,Y
            STA   $2551,X
            LDA   L6A03,Y
            STA   $2951,X
            LDA   L6B03,Y
            STA   $2D51,X
            LDA   L6C03,Y
            STA   $3151,X
            LDA   L6D03,Y
            STA   $3551,X
            LDA   L6E03,Y
            STA   $3951,X
            LDA   L6F03,Y
            STA   $3D51,X
            LDA   L6802,Y
            STA   $2150,X
            LDA   L6902,Y
            STA   $2550,X
            LDA   L6A02,Y
            STA   $2950,X
            LDA   L6B02,Y
            STA   $2D50,X
            LDA   L6C02,Y
            STA   $3150,X
            LDA   L6D02,Y
            STA   $3550,X
            LDA   L6E02,Y
            STA   $3950,X
            LDA   L6F02,Y
            STA   $3D50,X
            LDA   L6801,Y
            STA   $20D1,X
            LDA   L6901,Y
            STA   $24D1,X
            LDA   L6A01,Y
            STA   $28D1,X
            LDA   L6B01,Y
            STA   $2CD1,X
            LDA   L6C01,Y
            STA   $30D1,X
            LDA   L6D01,Y
            STA   $34D1,X
            LDA   L6E01,Y
            STA   $38D1,X
            LDA   L6F01,Y
            STA   $3CD1,X
            LDA   L6800,Y
            STA   $20D0,X
            LDA   L6900,Y
            STA   $24D0,X
            LDA   L6A00,Y
            STA   $28D0,X
            LDA   L6B00,Y
            STA   $2CD0,X
            LDA   L6C00,Y
            STA   $30D0,X
            LDA   L6D00,Y
            STA   $34D0,X
            LDA   L6E00,Y
            STA   $38D0,X
            LDA   L6F00,Y
            STA   $3CD0,X
            LDY   $4E
L7D71       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F1
            BEQ   L7D80
L7D7D       STA   SPKR
L7D80       LDA   L6803,Y
            STA   $2251,X
            LDA   L6903,Y
            STA   $2651,X
            LDA   L6A03,Y
            STA   $2A51,X
            LDA   L6B03,Y
            STA   $2E51,X
            LDA   L6C03,Y
            STA   $3251,X
            LDA   L6D03,Y
            STA   $3651,X
            LDA   L6E03,Y
            STA   $3A51,X
            LDA   L6F03,Y
            STA   $3E51,X
            LDA   L6802,Y
            STA   $2250,X
            LDA   L6902,Y
            STA   $2650,X
            LDA   L6A02,Y
            STA   $2A50,X
            LDA   L6B02,Y
            STA   $2E50,X
            LDA   L6C02,Y
            STA   $3250,X
            LDA   L6D02,Y
            STA   $3650,X
            LDA   L6E02,Y
            STA   $3A50,X
            LDA   L6F02,Y
            STA   $3E50,X
            LDA   L6801,Y
            STA   $21D1,X
            LDA   L6901,Y
            STA   $25D1,X
            LDA   L6A01,Y
            STA   $29D1,X
            LDA   L6B01,Y
            STA   $2DD1,X
            LDA   L6C01,Y
            STA   $31D1,X
            LDA   L6D01,Y
            STA   $35D1,X
            LDA   L6E01,Y
            STA   $39D1,X
            LDA   L6F01,Y
            STA   $3DD1,X
            LDA   L6800,Y
            STA   $21D0,X
            LDA   L6900,Y
            STA   $25D0,X
            LDA   L6A00,Y
            STA   $29D0,X
            LDA   L6B00,Y
            STA   $2DD0,X
            LDA   L6C00,Y
            STA   $31D0,X
            LDA   L6D00,Y
            STA   $35D0,X
            LDA   L6E00,Y
            STA   $39D0,X
            LDA   L6F00,Y
            STA   $3DD0,X
            LDY   $4E
L7E42       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F2
            BEQ   L7E51
L7E4E       STA   SPKR
L7E51       LDA   L6803,Y
            STA   $2351,X
            LDA   L6903,Y
            STA   $2751,X
            LDA   L6A03,Y
            STA   $2B51,X
            LDA   L6B03,Y
            STA   $2F51,X
            LDA   L6C03,Y
            STA   $3351,X
            LDA   L6D03,Y
            STA   $3751,X
            LDA   L6E03,Y
            STA   $3B51,X
            LDA   L6F03,Y
            STA   $3F51,X
            LDA   L6802,Y
            STA   $2350,X
            LDA   L6902,Y
            STA   $2750,X
            LDA   L6A02,Y
            STA   $2B50,X
            LDA   L6B02,Y
            STA   $2F50,X
            LDA   L6C02,Y
            STA   $3350,X
            LDA   L6D02,Y
            STA   $3750,X
            LDA   L6E02,Y
            STA   $3B50,X
            LDA   L6F02,Y
            STA   $3F50,X
            LDA   L6801,Y
            STA   $22D1,X
            LDA   L6901,Y
            STA   $26D1,X
            LDA   L6A01,Y
            STA   $2AD1,X
            LDA   L6B01,Y
            STA   $2ED1,X
            LDA   L6C01,Y
            STA   $32D1,X
            LDA   L6D01,Y
            STA   $36D1,X
            LDA   L6E01,Y
            STA   $3AD1,X
            LDA   L6F01,Y
            STA   $3ED1,X
            LDA   L6800,Y
            STA   $22D0,X
            LDA   L6900,Y
            STA   $26D0,X
            LDA   L6A00,Y
            STA   $2AD0,X
            LDA   L6B00,Y
            STA   $2ED0,X
            LDA   L6C00,Y
            STA   $32D0,X
            LDA   L6D00,Y
            STA   $36D0,X
            LDA   L6E00,Y
            STA   $3AD0,X
            LDA   L6F00,Y
            STA   $3ED0,X
            LDY   $4E
L7F13       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F3
            BEQ   L7F22
L7F1F       STA   SPKR
L7F22       LDA   L6801,Y
            STA   $23D1,X
            LDA   L6901,Y
            STA   $27D1,X
            LDA   L6A01,Y
            STA   $2BD1,X
            LDA   L6B01,Y
            STA   $2FD1,X
            LDA   L6C01,Y
            STA   $33D1,X
            LDA   L6D01,Y
            STA   $37D1,X
            LDA   L6E01,Y
            STA   $3BD1,X
            LDA   L6F01,Y
            STA   $3FD1,X
            LDA   L6800,Y
            STA   $23D0,X
            LDA   L6900,Y
            STA   $27D0,X
            LDA   L6A00,Y
            STA   $2BD0,X
            LDA   L6B00,Y
            STA   $2FD0,X
            LDA   L6C00,Y
            STA   $33D0,X
            LDA   L6D00,Y
            STA   $37D0,X
            LDA   L6E00,Y
            STA   $3BD0,X
            LDA   L6F00,Y
            STA   $3FD0,X
            LDX   $4E
            DEX
            BPL   L7F8B
            LDA   TXTPAGE1
            RTS
L7F8B       JMP   L75AC

L7F8E       LDA   $05
            LDX   #$64
            LDY   $06
L7F94       DEY
            BMI   L7F9F
            ADC   #$28
            BCC   L7F94
            INX
            CLC
            BNE   L7F94
L7F9F       STA   L8097+1
            STX   L8097+2
            ADC   #$28
            BCC   L7FAB
            INX
            CLC
L7FAB       STA   L8168+1
            STX   L8168+2
            ADC   #$28
            BCC   L7FB7
            INX
            CLC
L7FB7       STA   L8239+1
            STX   L8239+2
            ADC   #$28
            BCC   L7FC3
            INX
            CLC
L7FC3       STA   L830A+1
            STX   L830A+2
            ADC   #$28
            BCC   L7FCF
            INX
            CLC
L7FCF       STA   L83DB+1
            STX   L83DB+2
            ADC   #$28
            BCC   L7FDB
            INX
            CLC
L7FDB       STA   L84AC+1
            STX   L84AC+2
            ADC   #$28
            BCC   L7FE7
            INX
            CLC
L7FE7       STA   L857D+1
            STX   L857D+2
            ADC   #$28
            BCC   L7FF3
            INX
            CLC
L7FF3       STA   L864E+1
            STX   L864E+2
            ADC   #$28
            BCC   L7FFF
            INX
            CLC
L7FFF       STA   L871F+1
            STX   L871F+2
            ADC   #$28
            BCC   L800B
            INX
            CLC
L800B       STA   L87F0+1
            STX   L87F0+2
            ADC   #$28
            BCC   L8017
            INX
            CLC
L8017       STA   L88C1+1
            STX   L88C1+2
            ADC   #$28
            BCC   L8023
            INX
            CLC
L8023       STA   L8992+1
            STX   L8992+2
            LDX   #$13
L802B       STX   $4E
            LDY   L6398,X
            TXA
            ASL
            TAX
            STX   $4F
            LDA   L6801,Y
            STA   $4001,X
            LDA   L6901,Y
            STA   $4401,X
            LDA   L6A01,Y
            STA   $4801,X
            LDA   L6B01,Y
            STA   $4C01,X
            LDA   L6C01,Y
            STA   $5001,X
            LDA   L6D01,Y
            STA   $5401,X
            LDA   L6E01,Y
            STA   $5801,X
            LDA   L6F01,Y
            STA   $5C01,X
            LDA   L6800,Y
            STA   $4000,X
            LDA   L6900,Y
            STA   $4400,X
            LDA   L6A00,Y
            STA   $4800,X
            LDA   L6B00,Y
            STA   $4C00,X
            LDA   L6C00,Y
            STA   $5000,X
            LDA   L6D00,Y
            STA   $5400,X
            LDA   L6E00,Y
            STA   $5800,X
            LDA   L6F00,Y
            STA   $5C00,X
            LDY   $4E
L8097       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $E8
            BEQ   L80A6
L80A3       STA   SPKR
L80A6       LDA   L6803,Y
            STA   $4101,X
            LDA   L6903,Y
            STA   $4501,X
            LDA   L6A03,Y
            STA   $4901,X
            LDA   L6B03,Y
            STA   $4D01,X
            LDA   L6C03,Y
            STA   $5101,X
            LDA   L6D03,Y
            STA   $5501,X
            LDA   L6E03,Y
            STA   $5901,X
            LDA   L6F03,Y
            STA   $5D01,X
            LDA   L6802,Y
            STA   $4100,X
            LDA   L6902,Y
            STA   $4500,X
            LDA   L6A02,Y
            STA   $4900,X
            LDA   L6B02,Y
            STA   $4D00,X
            LDA   L6C02,Y
            STA   $5100,X
            LDA   L6D02,Y
            STA   $5500,X
            LDA   L6E02,Y
            STA   $5900,X
            LDA   L6F02,Y
            STA   $5D00,X
            LDA   L6801,Y
            STA   $4081,X
            LDA   L6901,Y
            STA   $4481,X
            LDA   L6A01,Y
            STA   $4881,X
            LDA   L6B01,Y
            STA   $4C81,X
            LDA   L6C01,Y
            STA   $5081,X
            LDA   L6D01,Y
            STA   $5481,X
            LDA   L6E01,Y
            STA   $5881,X
            LDA   L6F01,Y
            STA   $5C81,X
            LDA   L6800,Y
            STA   $4080,X
            LDA   L6900,Y
            STA   $4480,X
            LDA   L6A00,Y
            STA   $4880,X
            LDA   L6B00,Y
            STA   $4C80,X
            LDA   L6C00,Y
            STA   $5080,X
            LDA   L6D00,Y
            STA   $5480,X
            LDA   L6E00,Y
            STA   $5880,X
            LDA   L6F00,Y
            STA   $5C80,X
            LDY   $4E
L8168       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $E9
            BEQ   L8177
L8174       STA   SPKR
L8177       LDA   L6803,Y
            STA   $4201,X
            LDA   L6903,Y
            STA   $4601,X
            LDA   L6A03,Y
            STA   $4A01,X
            LDA   L6B03,Y
            STA   $4E01,X
            LDA   L6C03,Y
            STA   $5201,X
            LDA   L6D03,Y
            STA   $5601,X
            LDA   L6E03,Y
            STA   $5A01,X
            LDA   L6F03,Y
            STA   $5E01,X
            LDA   L6802,Y
            STA   $4200,X
            LDA   L6902,Y
            STA   $4600,X
            LDA   L6A02,Y
            STA   $4A00,X
            LDA   L6B02,Y
            STA   $4E00,X
            LDA   L6C02,Y
            STA   $5200,X
            LDA   L6D02,Y
            STA   $5600,X
            LDA   L6E02,Y
            STA   $5A00,X
            LDA   L6F02,Y
            STA   $5E00,X
            LDA   L6801,Y
            STA   $4181,X
            LDA   L6901,Y
            STA   $4581,X
            LDA   L6A01,Y
            STA   $4981,X
            LDA   L6B01,Y
            STA   $4D81,X
            LDA   L6C01,Y
            STA   $5181,X
            LDA   L6D01,Y
            STA   $5581,X
            LDA   L6E01,Y
            STA   $5981,X
            LDA   L6F01,Y
            STA   $5D81,X
            LDA   L6800,Y
            STA   $4180,X
            LDA   L6900,Y
            STA   $4580,X
            LDA   L6A00,Y
            STA   $4980,X
            LDA   L6B00,Y
            STA   $4D80,X
            LDA   L6C00,Y
            STA   $5180,X
            LDA   L6D00,Y
            STA   $5580,X
            LDA   L6E00,Y
            STA   $5980,X
            LDA   L6F00,Y
            STA   $5D80,X
            LDY   $4E
L8239       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EA
            BEQ   L8248
L8245       STA   SPKR
L8248       LDA   L6803,Y
            STA   $4301,X
            LDA   L6903,Y
            STA   $4701,X
            LDA   L6A03,Y
            STA   $4B01,X
            LDA   L6B03,Y
            STA   $4F01,X
            LDA   L6C03,Y
            STA   $5301,X
            LDA   L6D03,Y
            STA   $5701,X
            LDA   L6E03,Y
            STA   $5B01,X
            LDA   L6F03,Y
            STA   $5F01,X
            LDA   L6802,Y
            STA   $4300,X
            LDA   L6902,Y
            STA   $4700,X
            LDA   L6A02,Y
            STA   $4B00,X
            LDA   L6B02,Y
            STA   $4F00,X
            LDA   L6C02,Y
            STA   $5300,X
            LDA   L6D02,Y
            STA   $5700,X
            LDA   L6E02,Y
            STA   $5B00,X
            LDA   L6F02,Y
            STA   $5F00,X
            LDA   L6801,Y
            STA   $4281,X
            LDA   L6901,Y
            STA   $4681,X
            LDA   L6A01,Y
            STA   $4A81,X
            LDA   L6B01,Y
            STA   $4E81,X
            LDA   L6C01,Y
            STA   $5281,X
            LDA   L6D01,Y
            STA   $5681,X
            LDA   L6E01,Y
            STA   $5A81,X
            LDA   L6F01,Y
            STA   $5E81,X
            LDA   L6800,Y
            STA   $4280,X
            LDA   L6900,Y
            STA   $4680,X
            LDA   L6A00,Y
            STA   $4A80,X
            LDA   L6B00,Y
            STA   $4E80,X
            LDA   L6C00,Y
            STA   $5280,X
            LDA   L6D00,Y
            STA   $5680,X
            LDA   L6E00,Y
            STA   $5A80,X
            LDA   L6F00,Y
            STA   $5E80,X
            LDY   $4E
L830A       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EB
            BEQ   L8319
L8316       STA   SPKR
L8319       LDA   L6803,Y
            STA   $4029,X
            LDA   L6903,Y
            STA   $4429,X
            LDA   L6A03,Y
            STA   $4829,X
            LDA   L6B03,Y
            STA   $4C29,X
            LDA   L6C03,Y
            STA   $5029,X
            LDA   L6D03,Y
            STA   $5429,X
            LDA   L6E03,Y
            STA   $5829,X
            LDA   L6F03,Y
            STA   $5C29,X
            LDA   L6802,Y
            STA   $4028,X
            LDA   L6902,Y
            STA   $4428,X
            LDA   L6A02,Y
            STA   $4828,X
            LDA   L6B02,Y
            STA   $4C28,X
            LDA   L6C02,Y
            STA   $5028,X
            LDA   L6D02,Y
            STA   $5428,X
            LDA   L6E02,Y
            STA   $5828,X
            LDA   L6F02,Y
            STA   $5C28,X
            LDA   L6801,Y
            STA   $4381,X
            LDA   L6901,Y
            STA   $4781,X
            LDA   L6A01,Y
            STA   $4B81,X
            LDA   L6B01,Y
            STA   $4F81,X
            LDA   L6C01,Y
            STA   $5381,X
            LDA   L6D01,Y
            STA   $5781,X
            LDA   L6E01,Y
            STA   $5B81,X
            LDA   L6F01,Y
            STA   $5F81,X
            LDA   L6800,Y
            STA   $4380,X
            LDA   L6900,Y
            STA   $4780,X
            LDA   L6A00,Y
            STA   $4B80,X
            LDA   L6B00,Y
            STA   $4F80,X
            LDA   L6C00,Y
            STA   $5380,X
            LDA   L6D00,Y
            STA   $5780,X
            LDA   L6E00,Y
            STA   $5B80,X
            LDA   L6F00,Y
            STA   $5F80,X
            LDY   $4E
L83DB       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EC
            BEQ   L83EA
L83E7       STA   SPKR
L83EA       LDA   L6803,Y
            STA   $4129,X
            LDA   L6903,Y
            STA   $4529,X
            LDA   L6A03,Y
            STA   $4929,X
            LDA   L6B03,Y
            STA   $4D29,X
            LDA   L6C03,Y
            STA   $5129,X
            LDA   L6D03,Y
            STA   $5529,X
            LDA   L6E03,Y
            STA   $5929,X
            LDA   L6F03,Y
            STA   $5D29,X
            LDA   L6802,Y
            STA   $4128,X
            LDA   L6902,Y
            STA   $4528,X
            LDA   L6A02,Y
            STA   $4928,X
            LDA   L6B02,Y
            STA   $4D28,X
            LDA   L6C02,Y
            STA   $5128,X
            LDA   L6D02,Y
            STA   $5528,X
            LDA   L6E02,Y
            STA   $5928,X
            LDA   L6F02,Y
            STA   $5D28,X
            LDA   L6801,Y
            STA   $40A9,X
            LDA   L6901,Y
            STA   $44A9,X
            LDA   L6A01,Y
            STA   $48A9,X
            LDA   L6B01,Y
            STA   $4CA9,X
            LDA   L6C01,Y
            STA   $50A9,X
            LDA   L6D01,Y
            STA   $54A9,X
            LDA   L6E01,Y
            STA   $58A9,X
            LDA   L6F01,Y
            STA   $5CA9,X
            LDA   L6800,Y
            STA   $40A8,X
            LDA   L6900,Y
            STA   $44A8,X
            LDA   L6A00,Y
            STA   $48A8,X
            LDA   L6B00,Y
            STA   $4CA8,X
            LDA   L6C00,Y
            STA   $50A8,X
            LDA   L6D00,Y
            STA   $54A8,X
            LDA   L6E00,Y
            STA   $58A8,X
            LDA   L6F00,Y
            STA   $5CA8,X
            LDY   $4E
L84AC       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $ED
            BEQ   L84BB
L84B8       STA   SPKR
L84BB       LDA   L6803,Y
            STA   $4229,X
            LDA   L6903,Y
            STA   $4629,X
            LDA   L6A03,Y
            STA   $4A29,X
            LDA   L6B03,Y
            STA   $4E29,X
            LDA   L6C03,Y
            STA   $5229,X
            LDA   L6D03,Y
            STA   $5629,X
            LDA   L6E03,Y
            STA   $5A29,X
            LDA   L6F03,Y
            STA   $5E29,X
            LDA   L6802,Y
            STA   $4228,X
            LDA   L6902,Y
            STA   $4628,X
            LDA   L6A02,Y
            STA   $4A28,X
            LDA   L6B02,Y
            STA   $4E28,X
            LDA   L6C02,Y
            STA   $5228,X
            LDA   L6D02,Y
            STA   $5628,X
            LDA   L6E02,Y
            STA   $5A28,X
            LDA   L6F02,Y
            STA   $5E28,X
            LDA   L6801,Y
            STA   $41A9,X
            LDA   L6901,Y
            STA   $45A9,X
            LDA   L6A01,Y
            STA   $49A9,X
            LDA   L6B01,Y
            STA   $4DA9,X
            LDA   L6C01,Y
            STA   $51A9,X
            LDA   L6D01,Y
            STA   $55A9,X
            LDA   L6E01,Y
            STA   $59A9,X
            LDA   L6F01,Y
            STA   $5DA9,X
            LDA   L6800,Y
            STA   $41A8,X
            LDA   L6900,Y
            STA   $45A8,X
            LDA   L6A00,Y
            STA   $49A8,X
            LDA   L6B00,Y
            STA   $4DA8,X
            LDA   L6C00,Y
            STA   $51A8,X
            LDA   L6D00,Y
            STA   $55A8,X
            LDA   L6E00,Y
            STA   $59A8,X
            LDA   L6F00,Y
            STA   $5DA8,X
            LDY   $4E
L857D       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EE
            BEQ   L858C
L8589       STA   SPKR
L858C       LDA   L6803,Y
            STA   $4329,X
            LDA   L6903,Y
            STA   $4729,X
            LDA   L6A03,Y
            STA   $4B29,X
            LDA   L6B03,Y
            STA   $4F29,X
            LDA   L6C03,Y
            STA   $5329,X
            LDA   L6D03,Y
            STA   $5729,X
            LDA   L6E03,Y
            STA   $5B29,X
            LDA   L6F03,Y
            STA   $5F29,X
            LDA   L6802,Y
            STA   $4328,X
            LDA   L6902,Y
            STA   $4728,X
            LDA   L6A02,Y
            STA   $4B28,X
            LDA   L6B02,Y
            STA   $4F28,X
            LDA   L6C02,Y
            STA   $5328,X
            LDA   L6D02,Y
            STA   $5728,X
            LDA   L6E02,Y
            STA   $5B28,X
            LDA   L6F02,Y
            STA   $5F28,X
            LDA   L6801,Y
            STA   $42A9,X
            LDA   L6901,Y
            STA   $46A9,X
            LDA   L6A01,Y
            STA   $4AA9,X
            LDA   L6B01,Y
            STA   $4EA9,X
            LDA   L6C01,Y
            STA   $52A9,X
            LDA   L6D01,Y
            STA   $56A9,X
            LDA   L6E01,Y
            STA   $5AA9,X
            LDA   L6F01,Y
            STA   $5EA9,X
            LDA   L6800,Y
            STA   $42A8,X
            LDA   L6900,Y
            STA   $46A8,X
            LDA   L6A00,Y
            STA   $4AA8,X
            LDA   L6B00,Y
            STA   $4EA8,X
            LDA   L6C00,Y
            STA   $52A8,X
            LDA   L6D00,Y
            STA   $56A8,X
            LDA   L6E00,Y
            STA   $5AA8,X
            LDA   L6F00,Y
            STA   $5EA8,X
            LDY   $4E
L864E       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $EF
            BEQ   L865D
L865A       STA   SPKR
L865D       LDA   L6803,Y
            STA   $4051,X
            LDA   L6903,Y
            STA   $4451,X
            LDA   L6A03,Y
            STA   $4851,X
            LDA   L6B03,Y
            STA   $4C51,X
            LDA   L6C03,Y
            STA   $5051,X
            LDA   L6D03,Y
            STA   $5451,X
            LDA   L6E03,Y
            STA   $5851,X
            LDA   L6F03,Y
            STA   $5C51,X
            LDA   L6802,Y
            STA   $4050,X
            LDA   L6902,Y
            STA   $4450,X
            LDA   L6A02,Y
            STA   $4850,X
            LDA   L6B02,Y
            STA   $4C50,X
            LDA   L6C02,Y
            STA   $5050,X
            LDA   L6D02,Y
            STA   $5450,X
            LDA   L6E02,Y
            STA   $5850,X
            LDA   L6F02,Y
            STA   $5C50,X
            LDA   L6801,Y
            STA   $43A9,X
            LDA   L6901,Y
            STA   $47A9,X
            LDA   L6A01,Y
            STA   $4BA9,X
            LDA   L6B01,Y
            STA   $4FA9,X
            LDA   L6C01,Y
            STA   $53A9,X
            LDA   L6D01,Y
            STA   $57A9,X
            LDA   L6E01,Y
            STA   $5BA9,X
            LDA   L6F01,Y
            STA   $5FA9,X
            LDA   L6800,Y
            STA   $43A8,X
            LDA   L6900,Y
            STA   $47A8,X
            LDA   L6A00,Y
            STA   $4BA8,X
            LDA   L6B00,Y
            STA   $4FA8,X
            LDA   L6C00,Y
            STA   $53A8,X
            LDA   L6D00,Y
            STA   $57A8,X
            LDA   L6E00,Y
            STA   $5BA8,X
            LDA   L6F00,Y
            STA   $5FA8,X
            LDY   $4E
L871F       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F0
            BEQ   L872E
L872B       STA   SPKR
L872E       LDA   L6803,Y
            STA   $4151,X
            LDA   L6903,Y
            STA   $4551,X
            LDA   L6A03,Y
            STA   $4951,X
            LDA   L6B03,Y
            STA   $4D51,X
            LDA   L6C03,Y
            STA   $5151,X
            LDA   L6D03,Y
            STA   $5551,X
            LDA   L6E03,Y
            STA   $5951,X
            LDA   L6F03,Y
            STA   $5D51,X
            LDA   L6802,Y
            STA   $4150,X
            LDA   L6902,Y
            STA   $4550,X
            LDA   L6A02,Y
            STA   $4950,X
            LDA   L6B02,Y
            STA   $4D50,X
            LDA   L6C02,Y
            STA   $5150,X
            LDA   L6D02,Y
            STA   $5550,X
            LDA   L6E02,Y
            STA   $5950,X
            LDA   L6F02,Y
            STA   $5D50,X
            LDA   L6801,Y
            STA   $40D1,X
            LDA   L6901,Y
            STA   $44D1,X
            LDA   L6A01,Y
            STA   $48D1,X
            LDA   L6B01,Y
            STA   $4CD1,X
            LDA   L6C01,Y
            STA   $50D1,X
            LDA   L6D01,Y
            STA   $54D1,X
            LDA   L6E01,Y
            STA   $58D1,X
            LDA   L6F01,Y
            STA   $5CD1,X
            LDA   L6800,Y
            STA   $40D0,X
            LDA   L6900,Y
            STA   $44D0,X
            LDA   L6A00,Y
            STA   $48D0,X
            LDA   L6B00,Y
            STA   $4CD0,X
            LDA   L6C00,Y
            STA   $50D0,X
            LDA   L6D00,Y
            STA   $54D0,X
            LDA   L6E00,Y
            STA   $58D0,X
            LDA   L6F00,Y
            STA   $5CD0,X
            LDY   $4E
L87F0       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F1
            BEQ   L87FF
L87FC       STA   SPKR
L87FF       LDA   L6803,Y
            STA   $4251,X
            LDA   L6903,Y
            STA   $4651,X
            LDA   L6A03,Y
            STA   $4A51,X
            LDA   L6B03,Y
            STA   $4E51,X
            LDA   L6C03,Y
            STA   $5251,X
            LDA   L6D03,Y
            STA   $5651,X
            LDA   L6E03,Y
            STA   $5A51,X
            LDA   L6F03,Y
            STA   $5E51,X
            LDA   L6802,Y
            STA   $4250,X
            LDA   L6902,Y
            STA   $4650,X
            LDA   L6A02,Y
            STA   $4A50,X
            LDA   L6B02,Y
            STA   $4E50,X
            LDA   L6C02,Y
            STA   $5250,X
            LDA   L6D02,Y
            STA   $5650,X
            LDA   L6E02,Y
            STA   $5A50,X
            LDA   L6F02,Y
            STA   $5E50,X
            LDA   L6801,Y
            STA   $41D1,X
            LDA   L6901,Y
            STA   $45D1,X
            LDA   L6A01,Y
            STA   $49D1,X
            LDA   L6B01,Y
            STA   $4DD1,X
            LDA   L6C01,Y
            STA   $51D1,X
            LDA   L6D01,Y
            STA   $55D1,X
            LDA   L6E01,Y
            STA   $59D1,X
            LDA   L6F01,Y
            STA   $5DD1,X
            LDA   L6800,Y
            STA   $41D0,X
            LDA   L6900,Y
            STA   $45D0,X
            LDA   L6A00,Y
            STA   $49D0,X
            LDA   L6B00,Y
            STA   $4DD0,X
            LDA   L6C00,Y
            STA   $51D0,X
            LDA   L6D00,Y
            STA   $55D0,X
            LDA   L6E00,Y
            STA   $59D0,X
            LDA   L6F00,Y
            STA   $5DD0,X
            LDY   $4E
L88C1       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F2
            BEQ   L88D0
L88CD       STA   SPKR
L88D0       LDA   L6803,Y
            STA   $4351,X
            LDA   L6903,Y
            STA   $4751,X
            LDA   L6A03,Y
            STA   $4B51,X
            LDA   L6B03,Y
            STA   $4F51,X
            LDA   L6C03,Y
            STA   $5351,X
            LDA   L6D03,Y
            STA   $5751,X
            LDA   L6E03,Y
            STA   $5B51,X
            LDA   L6F03,Y
            STA   $5F51,X
            LDA   L6802,Y
            STA   $4350,X
            LDA   L6902,Y
            STA   $4750,X
            LDA   L6A02,Y
            STA   $4B50,X
            LDA   L6B02,Y
            STA   $4F50,X
            LDA   L6C02,Y
            STA   $5350,X
            LDA   L6D02,Y
            STA   $5750,X
            LDA   L6E02,Y
            STA   $5B50,X
            LDA   L6F02,Y
            STA   $5F50,X
            LDA   L6801,Y
            STA   $42D1,X
            LDA   L6901,Y
            STA   $46D1,X
            LDA   L6A01,Y
            STA   $4AD1,X
            LDA   L6B01,Y
            STA   $4ED1,X
            LDA   L6C01,Y
            STA   $52D1,X
            LDA   L6D01,Y
            STA   $56D1,X
            LDA   L6E01,Y
            STA   $5AD1,X
            LDA   L6F01,Y
            STA   $5ED1,X
            LDA   L6800,Y
            STA   $42D0,X
            LDA   L6900,Y
            STA   $46D0,X
            LDA   L6A00,Y
            STA   $4AD0,X
            LDA   L6B00,Y
            STA   $4ED0,X
            LDA   L6C00,Y
            STA   $52D0,X
            LDA   L6D00,Y
            STA   $56D0,X
            LDA   L6E00,Y
            STA   $5AD0,X
            LDA   L6F00,Y
            STA   $5ED0,X
            LDY   $4E
L8992       LDA   L6400,Y
            AND   #$FC
            TAY
            LDX   $4F
            LDA   $F3
            BEQ   L89A1
L899E       STA   SPKR
L89A1       LDA   L6801,Y
            STA   $43D1,X
            LDA   L6901,Y
            STA   $47D1,X
            LDA   L6A01,Y
            STA   $4BD1,X
            LDA   L6B01,Y
            STA   $4FD1,X
            LDA   L6C01,Y
            STA   $53D1,X
            LDA   L6D01,Y
            STA   $57D1,X
            LDA   L6E01,Y
            STA   $5BD1,X
            LDA   L6F01,Y
            STA   $5FD1,X
            LDA   L6800,Y
            STA   $43D0,X
            LDA   L6900,Y
            STA   $47D0,X
            LDA   L6A00,Y
            STA   $4BD0,X
            LDA   L6B00,Y
            STA   $4FD0,X
            LDA   L6C00,Y
            STA   $53D0,X
            LDA   L6D00,Y
            STA   $57D0,X
            LDA   L6E00,Y
            STA   $5BD0,X
            LDA   L6F00,Y
            STA   $5FD0,X
            LDX   $4E
            DEX
            BPL   L8A0A
            LDA   TXTPAGE2
            RTS
L8A0A       JMP   L802B

*-----------------------------

L8A0D       HEX   4E4E4E
L8A10       DB    $00
L8A11       DB    $00
L8A12       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L8A17       HEX   4E4E4E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L8A21       HEX   4E4E4E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L8A2B       HEX   4E4E4E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L8A35       HEX   4E4E4E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

*-----------------------------

L8A3F       INC   $2E
            STY   $0B
            LDA   $0D
            STA   $0C
            JSR   L084F
            LDA   $52
            BMI   L8A54
            JMP   L8AE2
L8A51       JMP   L8ADF

L8A54       TXA
            BEQ   L8A51
            CMP   #$03
            BCS   L8AB3
            CMP   #$01
            BEQ   L8A62
            INY
            BNE   L8A63
L8A62       DEY
L8A63       LDA   ($58),Y
            CMP   #$6C
            BEQ   L8AAB
            CMP   #$8C
            BNE   L8A73
            JSR   L8E1B
            JMP   L8AAB

L8A73       CMP   #$88
            BNE   L8ADD
            LDA   $19
            AND   #$03
            BNE   L8ADD
            TXA
            CMP   #$01
            BEQ   L8A97
            INY
            LDA   ($58),Y
            CMP   #$70
            BNE   L8ADD
            LDA   #$88
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            STA   $DF
            BNE   L8ADF
L8A97       DEY
            LDA   ($58),Y
            CMP   #$70
            BNE   L8ADD
            LDA   #$88
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            STA   $DF
            BNE   L8ADD
L8AAB       LDA   #$70
            STA   ($58),Y
            STA   $E0
            BNE   L8ADD
L8AB3       BNE   L8ACA
            LDA   ($56),Y
            CMP   #$6C
            BEQ   L8AC2
            CMP   #$8C
            BNE   L8ADD
            JSR   L8E1B
L8AC2       LDA   #$70
            STA   ($56),Y
            STA   $E0
            BNE   L8ADD
L8ACA       LDA   ($5A),Y
            CMP   #$6C
            BEQ   L8AD7
            CMP   #$8C
            BNE   L8ADD
            JSR   L8E1B
L8AD7       LDA   #$70
            STA   ($5A),Y
            STA   $E0
L8ADD       LDY   $04
L8ADF       JMP   $0B32

L8AE2       TXA
            BEQ   L8ADF
            LDA   #$03
            STA   $0E
            TXA
            CMP   #$03
            BCC   L8AF1
            JMP   L8BAC

L8AF1       CMP   #$01
            BNE   L8B4D
            DEY
            LDA   ($58),Y
            CMP   #$70
            BEQ   L8B12
            CMP   #$98
            BEQ   L8B04
            CMP   #$9C
            BNE   L8B0C
L8B04       LDA   $4C
            BPL   L8ADD
            STA   $2F
            BNE   L8B12
L8B0C       CMP   #$6C
            BNE   L8B20
            STA   $E0
L8B12       LDA   #$F0
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            STA   $DF
L8B1D       JMP   $0B32

L8B20       CMP   #$8C
            BNE   L8B2A
            JSR   L8E1B
            JMP   L8B12

L8B2A       CMP   #$88
            BNE   L8ADD
            DEY
            LDA   ($58),Y
            CMP   #$70
            BNE   L8ADD
            LDA   $19
            AND   #$03
            BNE   L8ADD
            LDA   #$88
            STA   ($58),Y
            INY
            LDA   #$F0
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            STA   $DF
            BNE   L8ADF
L8B4D       INY
            LDA   ($58),Y
            CMP   #$70
            BEQ   L8B6A
            CMP   #$98
            BEQ   L8B5C
            CMP   #$9C
            BNE   L8B64
L8B5C       LDA   $4C
            BPL   L8BA7
            STA   $2F
            BNE   L8B6A
L8B64       CMP   #$6C
            BNE   L8B78
            STA   $E0
L8B6A       LDA   #$F0
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            STA   $DF
            BNE   L8B1D
L8B78       CMP   #$8C
            BNE   L8B82
            JSR   L8E1B
            JMP   L8B6A

L8B82       CMP   #$88
            BNE   L8BA7
            INY
            LDA   ($58),Y
            CMP   #$70
            BNE   L8BA7
            LDA   $19
            AND   #$03
            BNE   L8BA7
            LDA   #$88
            STA   ($58),Y
            DEY
            LDA   #$F0
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            INY
            STA   $DF
            BNE   L8BA9
L8BA7       LDY   $04
L8BA9       JMP   $0B32

L8BAC       BNE   L8BD2
            LDA   ($56),Y
            CMP   #$6C
            BEQ   L8C0B
            CMP   #$70
            BEQ   L8C0B
            CMP   #$98
            BEQ   L8BC0
            CMP   #$9C
            BNE   L8BC8
L8BC0       LDA   $4C
            BPL   L8BA9
            STA   $2F
            BNE   L8C0B
L8BC8       CMP   #$8C
            BNE   L8BA9
            JSR   L8E1B
            JMP   L8C0B

L8BD2       LDA   ($5A),Y
            CMP   #$6C
            BEQ   L8BF3
            CMP   #$70
            BEQ   L8BF3
            CMP   #$98
            BEQ   L8BE4
            CMP   #$9C
            BNE   L8BEC
L8BE4       LDA   $4C
            BPL   L8BA9
            STA   $2F
            BNE   L8BF3
L8BEC       CMP   #$8C
            BNE   L8BA9
            JSR   L8E1B
L8BF3       INC   $0C
            CMP   #$6C
            BNE   L8BFB
            STA   $E0
L8BFB       STA   $DF
            LDA   #$F0
            STA   ($5A),Y
            STA   |$0084,Y
            LDA   #$70
            STA   ($58),Y
            JMP   $0B32

L8C0B       DEC   $0C
            CMP   #$6C
            BNE   L8C13
            STA   $E0
L8C13       STA   $DF
            LDA   #$F0
            STA   ($56),Y
            LDA   #$70
            STA   ($58),Y
            JMP   $0B32

L8C20       LDA   $37
            STA   ($58),Y
            STA   $E3
            INC   $34
            LDA   $36
            BNE   L8C62
            LDA   ($56),Y
            CMP   #$70
            BEQ   L8C5C
            CMP   #$6C
            BEQ   L8C5C
            LDA   ($5A),Y
            CMP   #$70
            BEQ   L8C5C
            CMP   #$6C
            BEQ   L8C5C
            INY
            LDA   ($58),Y
            CMP   #$6C
            BEQ   L8C5C
            CMP   #$70
            BEQ   L8C5C
            DEY
            DEY
            LDA   ($58),Y
            CMP   #$6C
            BEQ   L8C5C
            CMP   #$70
            BEQ   L8C5C
L8C57       LDY   $04
            JMP   $0B32

L8C5C       LDA   #$01
            STA   $36
            LDY   $04
L8C62       JSR   L8D10
            AND   $35
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
            CMP   #$6C
            BCC   L8CC9
            CMP   #$74
            BCS   L8CC9
            LDA   #$90
            STA   ($56),Y
            JMP   L0B32

L8C95       INY
            LDA   ($58),Y
            CMP   #$6C
            BCC   L8C57
            CMP   #$74
            BCS   L8C57
            LDA   #$90
            STA   ($58),Y
            DEY
            JMP   L0B32

L8CA8       LDA   ($5A),Y
            CMP   #$6C
            BCC   L8CC9
            CMP   #$74
            BCS   L8CC9
            LDA   #$90
            STA   ($5A),Y
            JMP   L0B32

L8CB9       DEY
            LDA   ($58),Y
            CMP   #$6C
            BCC   L8C57
            CMP   #$74
            BCS   L8C57
            LDA   #$90
            STA   ($58),Y
            INY
L8CC9       JMP   L0B32

L8CCC       LDA   $19
            AND   #$07
            BEQ   L8CD9
L8CD2       LDA   #$9D
            STA   ($58),Y
            JMP   L0B32

L8CD9       DEC   $4D
            BNE   L8CD2
            LDA   #$A1
            STA   ($58),Y
            STA   $E1
            LDA   $1A
            STA   $1B
            LDA   #$04
            STA   $2E
            JMP   L0B32

L8CEE       LDA   #$99
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

L8D07       LDA   #$F0
            STA   ($58),Y
            STA   $E1
            JMP   L0B32

L8D10       LDA   $10
            CLC
            ADC   #$01
            STA   $10
            LDA   $11
            ADC   #$00
            CMP   #$D0
            BCS   L8D21
            LDA   #$D0
L8D21       STA   $11
            LDA   $12
            SEC
            SBC   #$01
            STA   $12
            LDA   $13
            SBC   #$00
            CMP   #$D0
            BCS   L8D34
            LDA   #$FF
L8D34       STA   $13
            STY   $04
            LDY   #$00
            LDA   ($10),Y
            ADC   ($12),Y
            LDY   $04
            ADC   $14
            STA   $14
            RTS

L8D45       STA   $02
            JSR   L8D10
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
            LDY   $04
            LDA   $01
            RTS

L8D6E       LDA   $16
            ROR
            ROR
            AND   #$80
            STA   $17
            LDA   $15
            ROR
            AND   #$7F
            STA   $18
            LDA   $15
            ROR
            ROR
            AND   #$80
            CLC
            ADC   $15
            ADC   #$13
            STA   $15
            LDA   $16
            ADC   $17
            ADC   $18
            STA   $16
            RTS

L8D93       LDA   #$1E
            STA   $D9
L8D97       LDA   #$46
            STA   $D8
L8D9B       JSR   L8D10
            AND   #$03
            TAX
            CLC
            ADC   #>L6400
            STA   $01
            JSR   L8D10
            TAY
            LDA   #$00
            STA   $00
            LDA   #$60
            STA   ($00),Y
            DEC   $D8
            BNE   L8D9B
            JSR   L0BDD
            LDY   #$60
L8DBB       LDA   L6800,Y
            STA   $02
            LDA   L6900,Y
            STA   L6800,Y
            LDA   L6A00,Y
            STA   L6900,Y
            LDA   L6B00,Y
            STA   L6A00,Y
            LDA   L6C00,Y
            STA   L6B00,Y
            LDA   L6D00,Y
            STA   L6C00,Y
            LDA   L6E00,Y
            STA   L6D00,Y
            LDA   L6F00,Y
            STA   L6E00,Y
            LDA   $02
            STA   L6F00,Y
            INY
            CPY   #$64
            BNE   L8DBB
            JSR   L7500
            DEC   $D9
            BEQ   L8DFE
            JMP   L8D97

L8DFE       LDA   #<L6400
            STA   $00
            LDA   #>L6400
            STA   $01
            LDA   #$60
            LDY   #$00
L8E0A       STA   ($00),Y
            INY
            BNE   L8E0A
            LDX   $01
            INX
            STX   $01
            CPX   #$68
            BNE   L8E0A
            JMP   L7500

L8E1B       SED
            STY   $D9
            STX   $D8
            LDY   $26
            LDX   $2C,Y
            LDY   #$00
            INC   $30
            LDA   $30
            STA   $E6
            CMP   L7409,X
            BCC   L8E48
            BNE   L8E43
            LDA   #$01
            STA   $32
            LDA   #$FF
            STA   $4C
            STA   $E2
            LDA   #$02
            STA   $31
            BNE   L8E4A
L8E43       LDA   #$FF
            STA   $4C
            INY
L8E48       STY   $31
L8E4A       CLC
            LDA   #$00
            LDX   $26
            BEQ   L8E53
            ADC   #$03
L8E53       TAX
            LDA   $20,X
            ADC   L7402,Y
            STA   $20,X
            LDA   $1F,X
            ADC   #$00
            STA   $1F,X
            BCC   L8E65
            INC   $1E,X
L8E65       LDA   $1F,X
            LDX   $26
            CMP   $24,X
            BNE   L8E82
            LDA   $24,X
            CLC
            ADC   #$05
            STA   $24,X
            LDA   #$F0
            STA   $32
            LDA   $28,X
            CMP   #$09
            BCS   L8E82
            ADC   #$01
            STA   $28,X
L8E82       LDX   $D8
            INC   $31
            LDY   $D9
            CLD
            RTS

L8E8A       LDA   #$00
            LDX   #$14
L8E8E       STA   $DF,X
            DEX
            BPL   L8E8E
            RTS

L8E94       LDA   #$08
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
            LDA   #$4F
            JSR   WAIT
            JSR   L18A1
            BCS   L8EBE
            LDA   KBD
            BPL   L8E9E
            STA   KBDSTROBE
L8EBE       RTS
L8EBF       JMP   L8EF6

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

L8F3B       DB    $00
            DB    $00
            DB    $F6
            DB    $F6
            DB    $E8
            DB    $E8
            DB    $DB
            DB    $DB
            DB    $CF
            DB    $CF
            DB    $C3
            DB    $C3
            DB    $B8
            DB    $B8
            DB    $AE
            DB    $AE
            DB    $A4
            DB    $A4
            DB    $9B
            DB    $9B
            DB    $92
            DB    $92
            DB    $8A
            DB    $8A
            DB    $82
            DB    $82
            DB    $7B
            DB    $7B
            DB    $74
            DB    $74
            DB    $6D
            DB    $6E
            DB    $67
            DB    $68
            DB    $61
            DB    $62
            DB    $5C
            DB    $5C
            DB    $57
            DB    $57
            DB    $52
            DB    $52
            DB    $4D
            DB    $4E
            DB    $49
            DB    $49
            DB    $45
            DB    $45
            DB    $41
            DB    $41
            DB    $3D
            DB    $3E
            DB    $3A
            DB    $3A
            DB    $36
            DB    $37
            DB    $33
            DB    $34
            DB    $30
            DB    $31
            DB    $2E
            DB    $2E
            DB    $2B
            DB    $2C
            DB    $29
            DB    $29
            DB    $26
            DB    $27
            DB    $24
            DB    $25
            DB    $22
            DB    $23
            DB    $20
            DB    $21
            DB    $1E
            DB    $1F
            DB    $1D
            DB    $1D
            DB    $1B
            DB    $1C
            DB    $1A
            DB    $1A
            DB    $18
            DB    $19
            DB    $17
            DB    $17
            DB    $15
            DB    $16
            DB    $14
            DB    $15
            DB    $13
            DB    $14
            DB    $12
            DB    $12
            DB    $11
            DB    $11
            DB    $10
            DB    $10
            DB    $0F
            DB    $10
            DB    $0E
            DB    $0F
L8FA1       DB    $22
            DB    $26
            DB    $29
            DB    $2E
            DB    $24
            DB    $27
            DB    $29
            DB    $30
            DB    $2A
            DB    $2C
            DB    $2E
            DB    $31
            DB    $2C
            DB    $37
            DB    $2D
            DB    $35
            DB    $22
            DB    $2E
            DB    $1D
            DB    $24
            DB    $20
            DB    $30
            DB    $24
            DB    $20
            DB    $22
            DB    $2E
            DB    $1D
            DB    $24
            DB    $2A
            DB    $3A
            DB    $2E
            DB    $2A
            DB    $20
            DB    $2C
            DB    $1B
            DB    $22
            DB    $28
            DB    $38
            DB    $2C
            DB    $28
            DB    $1D
            DB    $2D
            DB    $1F
            DB    $2E
            DB    $27
            DB    $27
            DB    $33
            DB    $27
            DB    $16
            DB    $16
            DB    $16
            DB    $16
            DB    $22
            DB    $22
            DB    $16
            DB    $16
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $20
            DB    $20
            DB    $14
            DB    $14
            DB    $16
            DB    $32
            DB    $16
            DB    $33
            DB    $22
            DB    $32
            DB    $16
            DB    $33
            DB    $14
            DB    $32
            DB    $14
            DB    $33
            DB    $20
            DB    $30
            DB    $14
            DB    $31
            DB    $2E
            DB    $3A
            DB    $2E
            DB    $38
            DB    $2E
            DB    $37
            DB    $2E
            DB    $35
            DB    $2C
            DB    $38
            DB    $2C
            DB    $38
            DB    $2C
            DB    $33
            DB    $2C
            DB    $38
            DB    $16
            DB    $32
            DB    $16
            DB    $33
            DB    $22
            DB    $32
            DB    $16
            DB    $33
            DB    $14
            DB    $32
            DB    $14
            DB    $33
            DB    $20
            DB    $30
            DB    $14
            DB    $31
            DB    $32
            DB    $2E
            DB    $29
            DB    $26
            DB    $30
            DB    $2C
            DB    $27
            DB    $20
            DB    $32
            DB    $2E
            DB    $29
            DB    $26
            DB    $30
            DB    $2C
            DB    $27
            DB    $20
            DB    $00

*-----------------------------

L9022       JSR   L09FE
            LDX   #$13
L9027       LDA   L91E3,X
            STA   L6398,X
            DEX
            BPL   L9027
            LDY   #$0A
            JSR   L1FC4
            LDX   #$13
L9037       LDA   L91F5,X
            STA   L6398,X
            DEX
            BPL   L9037
            LDY   #$14
            JSR   L1FC4
L9045       LDX   #$13
            LDA   #$74
L9049       STA   L6398,X
            DEX
            BPL   L9049
            LDX   #$02
L9051       LDA   L8A0D,X
            STA   L639D,X
            DEX
            BPL   L9051
            LDY   #$00
            JSR   L90FA
            LDY   #$32
            JSR   L1FC4
            LDX   #$02
L9066       LDA   L8A17,X
            STA   L639D,X
            DEX
            BPL   L9066
            LDY   #$0A
            JSR   L90FA
            LDY   #$46
            JSR   L1FC4
            LDX   #$02
L907B       LDA   L8A21,X
            STA   L639D,X
            DEX
            BPL   L907B
            LDY   #$14
            JSR   L90FA
            LDY   #$5A
            JSR   L1FC4
            LDX   #$02
L9090       LDA   L8A2B,X
            STA   L639D,X
            DEX
            BPL   L9090
            LDY   #$1E
            JSR   L90FA
            LDY   #$6E
            JSR   L1FC4
            LDX   #$02
L90A5       LDA   L8A35,X
            STA   L639D,X
            DEX
            BPL   L90A5
            LDY   #$28
            JSR   L90FA
            LDY   #$82
            JMP   $1FC4

L90B8       LDX   #$13
            LDA   #$74
L90BC       STA   L6398,X
            DEX
            BPL   L90BC
            LDX   #$06
L90C4       LDA   L0F4C,X
            STA   L639E,X
            DEX
            BPL   L90C4
            LDA   $26
            ASL
            ADC   #$02
            STA   L63A6
            LDY   #$A0
            JSR   L1FC4
            LDX   #$13
L90DC       LDA   L9209,X
            STA   L6398,X
            DEX
            BPL   L90DC
            LDY   #$AA
            JSR   L1FC4
            LDX   #$13
L90EC       LDA   L921D,X
            STA   L6398,X
            DEX
            BPL   L90EC
            LDY   #$B4
            JMP   L1FC4

L90FA       LDA   L8A10,Y
            LDX   #$09
            JSR   L0F38
            INX
            LDA   L8A11,Y
            JSR   L0F38
            INX
            LDA   L8A12,Y
            JMP   L0F38

L9110       LDA   #$FF
            STA   $26
L9114       INC   $26
            LDA   $26
            CMP   #$02
            BNE   L911D
            RTS

L911D       LDA   #$00
            STA   $59
            CLC
            LDA   #$1E
            LDX   $26
            BEQ   L912A
            ADC   #$03
L912A       STA   $58
            LDA   #<L8A10
            STA   $56
            LDA   #>L8A10
            STA   $57
            STA   $5B
            LDX   #$00
L9138       LDY   #$00
L913A       LDA   ($56),Y
            CMP   ($58),Y
            BCC   L9158
            BEQ   L9150
L9142       LDA   $56
            ADC   #$09
            STA   $56
            INX
            CPX   #$05
            BCC   L9138
            JMP   L9114

L9150       INY
            CPY   #$03
            BNE   L913A
            SEC
            BEQ   L9142
L9158       STX   $03
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
L917D       LDX   $03
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
            LDA   #$4E
L9197       STA   ($56),Y
            DEY
            BPL   L9197
            JSR   L9022
            JSR   L90B8
            LDY   #$00
L91A4       STY   $04
            JSR   L9045
L91A9       JSR   L084F
            LDA   $52
            BMI   L91E0
            LDA   KBD
            BPL   L91A9
            STA   KBDSTROBE
            CMP   #$8D	; RETURN
            BEQ   L91E0
            CMP   #$88	; LEFT ARROW
            BEQ   L91D6
            CMP   #$C1	; A
            BCC   L91A9
            CMP   #$DB	; Z+1
            BCS   L91A9
            SBC   #$C0	; 1..1B
            ASL	; 2..36
            ADC   #$14	; 16..4A
            CPY   #$03
            BEQ   L91A4
            STA   ($56),Y
            INY
            BPL   L91A4
L91D6       DEY
            BPL   L91DA
            INY
L91DA       LDA   #$4E
            STA   ($56),Y
            BNE   L91A4
L91E0       JMP   L9114

L91E3       DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $16
            DB    $30
            DB    $3C
            DB    $2A
            DB    $1A
            DB    $1C
            DB    $36
            DB    $74
            DB    $1A
            DB    $14
            DB    $38
            DB    $22
            DB    $74
            DB    $74
L91F5       DB    $74
            DB    $74
            DB    $16
            DB    $30
            DB    $3C
            DB    $2A
            DB    $1A
            DB    $1C
            DB    $36
            DB    $74
            DB    $74
            DB    $16
            DB    $14
            DB    $38
            DB    $22
            DB    $1C
            DB    $36
            DB    $38
            DB    $74
            DB    $74
L9209       DB    $1C
            DB    $2E
            DB    $3A
            DB    $1C
            DB    $36
            DB    $74
            DB    $44
            DB    $30
            DB    $3C
            DB    $36
            DB    $74
            DB    $24
            DB    $2E
            DB    $24
            DB    $3A
            DB    $24
            DB    $14
            DB    $2A
            DB    $38
            DB    $4A
L921D       DB    $74
            DB    $74
            DB    $30
            DB    $36
            DB    $74
            DB    $32
            DB    $36
            DB    $1C
            DB    $38
            DB    $38
            DB    $74
            DB    $16
            DB    $3C
            DB    $3A
            DB    $3A
            DB    $30
            DB    $2E
            DB    $48
            DB    $74
            DB    $74

*-----------------------------

L9231       DB    $01
            DB    $14
            DB    $0A
            DB    $0F
            DB    $0A
            DB    $0B
            DB    $0C
            DB    $0D
            DB    $0E
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $96
            DB    $6E
            DB    $46
            DB    $28
            DB    $1E
            DB    $08
            DB    $0B
            DB    $09
            DB    $D4
            DB    $20
            DB    $00
            DB    $10
            DB    $14
            DB    $00
            DB    $3C
            DB    $32
            DB    $09
            DB    $00
            DB    $42
            DB    $01
            DB    $09
            DB    $1E
            DB    $02
            DB    $42
            DB    $09
            DB    $10
            DB    $1E
            DB    $02
            DB    $25
            DB    $03
            DB    $04
            DB    $04
            DB    $26
            DB    $12
            DB    $FF
            DB    $02
            DB    $14
            DB    $14
            DB    $32
            DB    $03
            DB    $00
            DB    $01
            DB    $57
            DB    $58
            DB    $0A
            DB    $0C
            DB    $09
            DB    $0D
            DB    $0A
            DB    $96
            DB    $6E
            DB    $46
            DB    $46
            DB    $46
            DB    $0A
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $14
            DB    $08
            DB    $3C
            DB    $32
            DB    $09
            DB    $02
            DB    $42
            DB    $01
            DB    $08
            DB    $26
            DB    $02
            DB    $42
            DB    $01
            DB    $0F
            DB    $26
            DB    $02
            DB    $42
            DB    $08
            DB    $03
            DB    $14
            DB    $04
            DB    $42
            DB    $10
            DB    $03
            DB    $14
            DB    $04
            DB    $42
            DB    $18
            DB    $03
            DB    $14
            DB    $04
            DB    $42
            DB    $20
            DB    $03
            DB    $14
            DB    $04
            DB    $40
            DB    $01
            DB    $05
            DB    $26
            DB    $02
            DB    $40
            DB    $01
            DB    $0B
            DB    $26
            DB    $02
            DB    $40
            DB    $01
            DB    $12
            DB    $26
            DB    $02
            DB    $40
            DB    $14
            DB    $03
            DB    $14
            DB    $04
            DB    $25
            DB    $12
            DB    $15
            DB    $04
            DB    $12
            DB    $16
            DB    $FF
            DB    $03
            DB    $00
            DB    $0F
            DB    $00
            DB    $00
            DB    $32
            DB    $36
            DB    $34
            DB    $37
            DB    $18
            DB    $17
            DB    $18
            DB    $17
            DB    $15
            DB    $96
            DB    $64
            DB    $5A
            DB    $50
            DB    $46
            DB    $09
            DB    $08
            DB    $09
            DB    $04
            DB    $00
            DB    $02
            DB    $10
            DB    $14
            DB    $00
            DB    $64
            DB    $32
            DB    $09
            DB    $00
            DB    $25
            DB    $03
            DB    $04
            DB    $04
            DB    $27
            DB    $14
            DB    $FF
            DB    $04
            DB    $14
            DB    $05
            DB    $14
            DB    $00
            DB    $6E
            DB    $70
            DB    $73
            DB    $77
            DB    $24
            DB    $24
            DB    $24
            DB    $24
            DB    $24
            DB    $78
            DB    $64
            DB    $50
            DB    $3C
            DB    $32
            DB    $04
            DB    $08
            DB    $09
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $14
            DB    $00
            DB    $00
            DB    $00
            DB    $25
            DB    $01
            DB    $03
            DB    $04
            DB    $26
            DB    $16
            DB    $81
            DB    $08
            DB    $0A
            DB    $04
            DB    $04
            DB    $00
            DB    $30
            DB    $0A
            DB    $0B
            DB    $81
            DB    $10
            DB    $0A
            DB    $04
            DB    $04
            DB    $00
            DB    $30
            DB    $12
            DB    $0B
            DB    $81
            DB    $18
            DB    $0A
            DB    $04
            DB    $04
            DB    $00
            DB    $30
            DB    $1A
            DB    $0B
            DB    $81
            DB    $20
            DB    $0A
            DB    $04
            DB    $04
            DB    $00
            DB    $30
            DB    $22
            DB    $0B
            DB    $FF
            DB    $05
            DB    $14
            DB    $32
            DB    $5A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $04
            DB    $05
            DB    $06
            DB    $07
            DB    $08
            DB    $96
            DB    $78
            DB    $5A
            DB    $3C
            DB    $1E
            DB    $09
            DB    $0A
            DB    $09
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
            DB    $25
            DB    $01
            DB    $03
            DB    $04
            DB    $27
            DB    $16
            DB    $80
            DB    $08
            DB    $0A
            DB    $03
            DB    $03
            DB    $00
            DB    $80
            DB    $10
            DB    $0A
            DB    $03
            DB    $03
            DB    $00
            DB    $80
            DB    $18
            DB    $0A
            DB    $03
            DB    $03
            DB    $00
            DB    $80
            DB    $20
            DB    $0A
            DB    $03
            DB    $03
            DB    $00
            DB    $14
            DB    $09
            DB    $0C
            DB    $08
            DB    $0A
            DB    $0A
            DB    $14
            DB    $11
            DB    $0C
            DB    $08
            DB    $12
            DB    $0A
            DB    $14
            DB    $19
            DB    $0C
            DB    $08
            DB    $1A
            DB    $0A
            DB    $14
            DB    $21
            DB    $0C
            DB    $08
            DB    $22
            DB    $0A
            DB    $80
            DB    $08
            DB    $10
            DB    $03
            DB    $03
            DB    $00
            DB    $80
            DB    $10
            DB    $10
            DB    $03
            DB    $03
            DB    $00
            DB    $80
            DB    $18
            DB    $10
            DB    $03
            DB    $03
            DB    $00
            DB    $80
            DB    $20
            DB    $10
            DB    $03
            DB    $03
            DB    $00
            DB    $14
            DB    $09
            DB    $12
            DB    $08
            DB    $0A
            DB    $10
            DB    $14
            DB    $11
            DB    $12
            DB    $08
            DB    $12
            DB    $10
            DB    $14
            DB    $19
            DB    $12
            DB    $08
            DB    $1A
            DB    $10
            DB    $14
            DB    $21
            DB    $12
            DB    $08
            DB    $22
            DB    $10
            DB    $FF
            DB    $06
            DB    $14
            DB    $28
            DB    $3C
            DB    $00
            DB    $14
            DB    $15
            DB    $16
            DB    $17
            DB    $04
            DB    $06
            DB    $07
            DB    $08
            DB    $08
            DB    $96
            DB    $78
            DB    $64
            DB    $5A
            DB    $50
            DB    $0E
            DB    $0A
            DB    $09
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $32
            DB    $00
            DB    $00
            DB    $00
            DB    $82
            DB    $01
            DB    $03
            DB    $0A
            DB    $04
            DB    $00
            DB    $82
            DB    $01
            DB    $06
            DB    $0A
            DB    $04
            DB    $00
            DB    $82
            DB    $01
            DB    $09
            DB    $0A
            DB    $04
            DB    $00
            DB    $82
            DB    $01
            DB    $0C
            DB    $0A
            DB    $04
            DB    $00
            DB    $41
            DB    $0A
            DB    $03
            DB    $0D
            DB    $04
            DB    $14
            DB    $03
            DB    $05
            DB    $08
            DB    $04
            DB    $05
            DB    $14
            DB    $03
            DB    $08
            DB    $08
            DB    $04
            DB    $08
            DB    $14
            DB    $03
            DB    $0B
            DB    $08
            DB    $04
            DB    $0B
            DB    $14
            DB    $03
            DB    $0E
            DB    $08
            DB    $04
            DB    $0E
            DB    $82
            DB    $1D
            DB    $03
            DB    $0A
            DB    $04
            DB    $00
            DB    $82
            DB    $1D
            DB    $06
            DB    $0A
            DB    $04
            DB    $00
            DB    $82
            DB    $1D
            DB    $09
            DB    $0A
            DB    $04
            DB    $00
            DB    $82
            DB    $1D
            DB    $0C
            DB    $0A
            DB    $04
            DB    $00
            DB    $41
            DB    $1D
            DB    $03
            DB    $0D
            DB    $04
            DB    $14
            DB    $24
            DB    $05
            DB    $08
            DB    $23
            DB    $05
            DB    $14
            DB    $24
            DB    $08
            DB    $08
            DB    $23
            DB    $08
            DB    $14
            DB    $24
            DB    $0B
            DB    $08
            DB    $23
            DB    $0B
            DB    $14
            DB    $24
            DB    $0E
            DB    $08
            DB    $23
            DB    $0E
            DB    $25
            DB    $03
            DB    $14
            DB    $04
            DB    $26
            DB    $14
            DB    $FF
            DB    $07
            DB    $4B
            DB    $0A
            DB    $14
            DB    $02
            DB    $07
            DB    $08
            DB    $0A
            DB    $09
            DB    $0F
            DB    $14
            DB    $19
            DB    $19
            DB    $19
            DB    $78
            DB    $78
            DB    $78
            DB    $78
            DB    $78
            DB    $09
            DB    $0A
            DB    $0D
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $08
            DB    $00
            DB    $64
            DB    $28
            DB    $02
            DB    $00
            DB    $42
            DB    $01
            DB    $07
            DB    $0C
            DB    $02
            DB    $42
            DB    $1C
            DB    $05
            DB    $0B
            DB    $02
            DB    $7A
            DB    $13
            DB    $15
            DB    $02
            DB    $02
            DB    $14
            DB    $04
            DB    $06
            DB    $14
            DB    $04
            DB    $0E
            DB    $14
            DB    $04
            DB    $16
            DB    $14
            DB    $22
            DB    $04
            DB    $14
            DB    $22
            DB    $0C
            DB    $14
            DB    $22
            DB    $16
            DB    $25
            DB    $14
            DB    $03
            DB    $04
            DB    $27
            DB    $07
            DB    $FF
            DB    $08
            DB    $14
            DB    $0A
            DB    $14
            DB    $01
            DB    $03
            DB    $04
            DB    $05
            DB    $06
            DB    $0A
            DB    $0F
            DB    $14
            DB    $14
            DB    $14
            DB    $78
            DB    $6E
            DB    $64
            DB    $5A
            DB    $50
            DB    $02
            DB    $0E
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $08
            DB    $00
            DB    $5A
            DB    $32
            DB    $02
            DB    $00
            DB    $14
            DB    $04
            DB    $06
            DB    $14
            DB    $22
            DB    $04
            DB    $14
            DB    $22
            DB    $0C
            DB    $04
            DB    $00
            DB    $05
            DB    $25
            DB    $14
            DB    $03
            DB    $42
            DB    $01
            DB    $07
            DB    $0C
            DB    $02
            DB    $42
            DB    $01
            DB    $0F
            DB    $0C
            DB    $02
            DB    $42
            DB    $1C
            DB    $05
            DB    $0B
            DB    $02
            DB    $42
            DB    $1C
            DB    $0D
            DB    $0B
            DB    $02
            DB    $43
            DB    $0E
            DB    $11
            DB    $08
            DB    $02
            DB    $14
            DB    $0C
            DB    $10
            DB    $00
            DB    $0E
            DB    $12
            DB    $14
            DB    $13
            DB    $12
            DB    $41
            DB    $0E
            DB    $0F
            DB    $08
            DB    $02
            DB    $FF
            DB    $09
            DB    $14
            DB    $05
            DB    $0A
            DB    $64
            DB    $89
            DB    $8C
            DB    $FB
            DB    $33
            DB    $4B
            DB    $4B
            DB    $50
            DB    $55
            DB    $5A
            DB    $96
            DB    $96
            DB    $82
            DB    $82
            DB    $78
            DB    $08
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $10
            DB    $14
            DB    $00
            DB    $00
            DB    $F0
            DB    $78
            DB    $00
            DB    $00
            DB    $82
            DB    $05
            DB    $0A
            DB    $0D
            DB    $0D
            DB    $00
            DB    $01
            DB    $0C
            DB    $0A
            DB    $82
            DB    $19
            DB    $0A
            DB    $0D
            DB    $0D
            DB    $00
            DB    $01
            DB    $1F
            DB    $0A
            DB    $42
            DB    $11
            DB    $12
            DB    $09
            DB    $02
            DB    $40
            DB    $11
            DB    $13
            DB    $09
            DB    $02
            DB    $25
            DB    $07
            DB    $0C
            DB    $04
            DB    $08
            DB    $0C
            DB    $FF
            DB    $0A
            DB    $14
            DB    $19
            DB    $3C
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $96
            DB    $82
            DB    $78
            DB    $6E
            DB    $64
            DB    $06
            DB    $08
            DB    $09
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
            DB    $25
            DB    $0D
            DB    $03
            DB    $04
            DB    $27
            DB    $16
            DB    $54
            DB    $05
            DB    $04
            DB    $11
            DB    $03
            DB    $54
            DB    $15
            DB    $04
            DB    $11
            DB    $05
            DB    $80
            DB    $05
            DB    $0B
            DB    $11
            DB    $03
            DB    $08
            DB    $C2
            DB    $01
            DB    $04
            DB    $15
            DB    $11
            DB    $00
            DB    $0D
            DB    $04
            DB    $C2
            DB    $07
            DB    $06
            DB    $0D
            DB    $0D
            DB    $00
            DB    $0D
            DB    $06
            DB    $C2
            DB    $09
            DB    $08
            DB    $09
            DB    $09
            DB    $00
            DB    $0D
            DB    $08
            DB    $C2
            DB    $0B
            DB    $0A
            DB    $05
            DB    $05
            DB    $00
            DB    $0D
            DB    $0A
            DB    $82
            DB    $03
            DB    $06
            DB    $03
            DB    $0F
            DB    $08
            DB    $00
            DB    $04
            DB    $06
            DB    $54
            DB    $04
            DB    $10
            DB    $04
            DB    $04
            DB    $FF
            DB    $0B
            DB    $14
            DB    $32
            DB    $00
            DB    $00
            DB    $04
            DB    $66
            DB    $97
            DB    $64
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $78
            DB    $78
            DB    $96
            DB    $96
            DB    $F0
            DB    $0B
            DB    $08
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $08
            DB    $00
            DB    $64
            DB    $50
            DB    $02
            DB    $00
            DB    $42
            DB    $0A
            DB    $03
            DB    $09
            DB    $04
            DB    $42
            DB    $14
            DB    $03
            DB    $09
            DB    $04
            DB    $42
            DB    $1E
            DB    $03
            DB    $09
            DB    $04
            DB    $42
            DB    $09
            DB    $16
            DB    $09
            DB    $00
            DB    $42
            DB    $0C
            DB    $0F
            DB    $11
            DB    $02
            DB    $42
            DB    $05
            DB    $0B
            DB    $09
            DB    $02
            DB    $42
            DB    $0F
            DB    $0B
            DB    $09
            DB    $02
            DB    $42
            DB    $19
            DB    $0B
            DB    $09
            DB    $02
            DB    $42
            DB    $1C
            DB    $13
            DB    $0B
            DB    $01
            DB    $14
            DB    $04
            DB    $03
            DB    $14
            DB    $0E
            DB    $03
            DB    $14
            DB    $18
            DB    $03
            DB    $14
            DB    $22
            DB    $03
            DB    $14
            DB    $04
            DB    $16
            DB    $14
            DB    $23
            DB    $15
            DB    $25
            DB    $14
            DB    $14
            DB    $04
            DB    $26
            DB    $11
            DB    $FF
            DB    $0C
            DB    $14
            DB    $14
            DB    $00
            DB    $00
            DB    $3C
            DB    $02
            DB    $3B
            DB    $66
            DB    $13
            DB    $13
            DB    $0E
            DB    $10
            DB    $15
            DB    $B4
            DB    $AA
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $0C
            DB    $0A
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $14
            DB    $00
            DB    $3C
            DB    $32
            DB    $09
            DB    $00
            DB    $42
            DB    $0A
            DB    $05
            DB    $12
            DB    $04
            DB    $42
            DB    $0E
            DB    $05
            DB    $12
            DB    $04
            DB    $42
            DB    $12
            DB    $05
            DB    $12
            DB    $04
            DB    $42
            DB    $16
            DB    $05
            DB    $12
            DB    $04
            DB    $42
            DB    $02
            DB    $06
            DB    $0B
            DB    $02
            DB    $42
            DB    $02
            DB    $0A
            DB    $0B
            DB    $02
            DB    $42
            DB    $02
            DB    $0E
            DB    $0F
            DB    $02
            DB    $42
            DB    $02
            DB    $12
            DB    $0B
            DB    $02
            DB    $81
            DB    $1E
            DB    $04
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $20
            DB    $05
            DB    $81
            DB    $1E
            DB    $09
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $20
            DB    $0A
            DB    $81
            DB    $1E
            DB    $0E
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $20
            DB    $0F
            DB    $25
            DB    $03
            DB    $14
            DB    $04
            DB    $27
            DB    $16
            DB    $FF
            DB    $0D
            DB    $8C
            DB    $05
            DB    $08
            DB    $00
            DB    $01
            DB    $02
            DB    $03
            DB    $04
            DB    $32
            DB    $37
            DB    $3C
            DB    $46
            DB    $50
            DB    $A0
            DB    $9B
            DB    $96
            DB    $91
            DB    $8C
            DB    $06
            DB    $08
            DB    $0D
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $00
            DB    $00
            DB    $00
            DB    $25
            DB    $12
            DB    $03
            DB    $04
            DB    $0A
            DB    $03
            DB    $3A
            DB    $14
            DB    $03
            DB    $42
            DB    $05
            DB    $12
            DB    $1E
            DB    $02
            DB    $70
            DB    $05
            DB    $13
            DB    $1E
            DB    $02
            DB    $50
            DB    $05
            DB    $14
            DB    $1E
            DB    $02
            DB    $C1
            DB    $05
            DB    $15
            DB    $1E
            DB    $02
            DB    $FF
            DB    $0E
            DB    $14
            DB    $0A
            DB    $14
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $23
            DB    $28
            DB    $2A
            DB    $2D
            DB    $96
            DB    $91
            DB    $8C
            DB    $87
            DB    $82
            DB    $0C
            DB    $08
            DB    $09
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $81
            DB    $0A
            DB    $0A
            DB    $0D
            DB    $0D
            DB    $00
            DB    $70
            DB    $0B
            DB    $0B
            DB    $0C
            DB    $03
            DB    $C1
            DB    $0C
            DB    $0A
            DB    $03
            DB    $0D
            DB    $C1
            DB    $10
            DB    $0A
            DB    $03
            DB    $0D
            DB    $C1
            DB    $14
            DB    $0A
            DB    $03
            DB    $0D
            DB    $50
            DB    $16
            DB    $08
            DB    $0C
            DB    $02
            DB    $48
            DB    $16
            DB    $07
            DB    $0C
            DB    $02
            DB    $C1
            DB    $17
            DB    $06
            DB    $03
            DB    $04
            DB    $C1
            DB    $1B
            DB    $06
            DB    $03
            DB    $04
            DB    $C1
            DB    $1F
            DB    $06
            DB    $03
            DB    $04
            DB    $25
            DB    $03
            DB    $03
            DB    $04
            DB    $27
            DB    $14
            DB    $FF
            DB    $0F
            DB    $08
            DB    $0A
            DB    $14
            DB    $01
            DB    $1D
            DB    $1E
            DB    $1F
            DB    $20
            DB    $0F
            DB    $14
            DB    $14
            DB    $19
            DB    $1E
            DB    $78
            DB    $78
            DB    $78
            DB    $78
            DB    $8C
            DB    $08
            DB    $0E
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $08
            DB    $00
            DB    $64
            DB    $50
            DB    $02
            DB    $00
            DB    $42
            DB    $02
            DB    $04
            DB    $0A
            DB    $03
            DB    $42
            DB    $0F
            DB    $0D
            DB    $0A
            DB    $01
            DB    $41
            DB    $0C
            DB    $0E
            DB    $03
            DB    $02
            DB    $43
            DB    $0C
            DB    $0F
            DB    $03
            DB    $02
            DB    $04
            DB    $14
            DB    $16
            DB    $25
            DB    $14
            DB    $03
            DB    $FF
            DB    $10
            DB    $14
            DB    $0A
            DB    $14
            DB    $01
            DB    $78
            DB    $81
            DB    $7E
            DB    $7B
            DB    $0C
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0C
            DB    $96
            DB    $96
            DB    $96
            DB    $96
            DB    $96
            DB    $09
            DB    $0A
            DB    $09
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $32
            DB    $00
            DB    $00
            DB    $00
            DB    $25
            DB    $01
            DB    $03
            DB    $04
            DB    $27
            DB    $04
            DB    $81
            DB    $08
            DB    $13
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $0A
            DB    $14
            DB    $C2
            DB    $07
            DB    $0A
            DB    $06
            DB    $08
            DB    $43
            DB    $07
            DB    $0A
            DB    $06
            DB    $02
            DB    $81
            DB    $10
            DB    $13
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $12
            DB    $14
            DB    $C2
            DB    $0F
            DB    $0A
            DB    $06
            DB    $08
            DB    $43
            DB    $0F
            DB    $0A
            DB    $06
            DB    $02
            DB    $81
            DB    $18
            DB    $13
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $1A
            DB    $14
            DB    $81
            DB    $20
            DB    $13
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $22
            DB    $14
            DB    $FF
            DB    $11
            DB    $14
            DB    $1E
            DB    $00
            DB    $0A
            DB    $0B
            DB    $0C
            DB    $0D
            DB    $0E
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0E
            DB    $02
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $14
            DB    $00
            DB    $00
            DB    $FF
            DB    $09
            DB    $00
            DB    $00
            DB    $87
            DB    $00
            DB    $02
            DB    $28
            DB    $16
            DB    $07
            DB    $87
            DB    $00
            DB    $02
            DB    $14
            DB    $0C
            DB    $00
            DB    $32
            DB    $0A
            DB    $0C
            DB    $10
            DB    $0A
            DB    $04
            DB    $01
            DB    $0A
            DB    $05
            DB    $25
            DB    $03
            DB    $05
            DB    $04
            DB    $12
            DB    $0C
            DB    $FF
            DB    $12
            DB    $14
            DB    $0A
            DB    $00
            DB    $0A
            DB    $0B
            DB    $0C
            DB    $0D
            DB    $0E
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $06
            DB    $0F
            DB    $09
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
            DB    $87
            DB    $00
            DB    $02
            DB    $28
            DB    $16
            DB    $07
            DB    $87
            DB    $00
            DB    $02
            DB    $14
            DB    $0C
            DB    $01
            DB    $50
            DB    $01
            DB    $03
            DB    $09
            DB    $03
            DB    $48
            DB    $02
            DB    $03
            DB    $08
            DB    $03
            DB    $54
            DB    $01
            DB    $05
            DB    $08
            DB    $03
            DB    $50
            DB    $01
            DB    $06
            DB    $07
            DB    $03
            DB    $50
            DB    $12
            DB    $03
            DB    $09
            DB    $05
            DB    $54
            DB    $12
            DB    $05
            DB    $08
            DB    $05
            DB    $50
            DB    $12
            DB    $06
            DB    $07
            DB    $05
            DB    $25
            DB    $01
            DB    $04
            DB    $04
            DB    $12
            DB    $04
            DB    $FF
            DB    $13
            DB    $04
            DB    $0A
            DB    $00
            DB    $0A
            DB    $0B
            DB    $0C
            DB    $0D
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $06
            DB    $08
            DB    $09
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
            DB    $87
            DB    $00
            DB    $02
            DB    $28
            DB    $16
            DB    $07
            DB    $87
            DB    $00
            DB    $02
            DB    $14
            DB    $0C
            DB    $00
            DB    $54
            DB    $01
            DB    $0C
            DB    $12
            DB    $02
            DB    $88
            DB    $0F
            DB    $09
            DB    $04
            DB    $04
            DB    $08
            DB    $25
            DB    $08
            DB    $03
            DB    $04
            DB    $12
            DB    $07
            DB    $FF
            DB    $14
            DB    $03
            DB    $1E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $06
            DB    $08
            DB    $09
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
            DB    $87
            DB    $00
            DB    $02
            DB    $28
            DB    $16
            DB    $07
            DB    $87
            DB    $00
            DB    $02
            DB    $14
            DB    $0C
            DB    $01
            DB    $D0
            DB    $0B
            DB    $03
            DB    $03
            DB    $02
            DB    $80
            DB    $0B
            DB    $07
            DB    $03
            DB    $06
            DB    $00
            DB    $43
            DB    $0B
            DB    $06
            DB    $03
            DB    $02
            DB    $43
            DB    $0B
            DB    $0A
            DB    $03
            DB    $02
            DB    $50
            DB    $08
            DB    $07
            DB    $03
            DB    $03
            DB    $25
            DB    $03
            DB    $03
            DB    $04
            DB    $09
            DB    $0A
            DB    $FF
L98AB       DB    $31
L98AC       DB    $92
            DB    $62
            DB    $92
            DB    $BB
            DB    $92
            DB    $E2
            DB    $92
            DB    $8E
            DB    $97
            DB    $2D
            DB    $93
            DB    $B4
            DB    $93
            DB    $45
            DB    $94
            DB    $8D
            DB    $94
            DB    $CA
            DB    $97
            DB    $E4
            DB    $94
            DB    $27
            DB    $95
            DB    $8C
            DB    $95
            DB    $F2
            DB    $95
            DB    $20
            DB    $98
            DB    $5C
            DB    $96
            DB    $9A
            DB    $96
            DB    $F4
            DB    $96
            DB    $2F
            DB    $97
            DB    $5E
            DB    $98
L98D3       DB    $70
            DB    $6C
            DB    $68
            DB    $94
            DB    $98
            DB    $9C
            DB    $00
            DB    $64
            DB    $83
            DB    $80
            DB    $81
            DB    $82
            DB    $83
            DB    $80
            DB    $81
            DB    $82
            DB    $88
            DB    $88
            DB    $89
            DB    $89
            DB    $8C
            DB    $8C
            DB    $8D
            DB    $8D
            DB    $00
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $9D
            DB    $9D
            DB    $9D
            DB    $9D
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $86
            DB    $87
            DB    $84
            DB    $85
            DB    $86
            DB    $87
            DB    $84
            DB    $85
            DB    $F0
            DB    $F0
            DB    $90
            DB    $90
L990F       DB    $18
            DB    $14
            DB    $3E
            DB    $1C
            DB    $48
            DB    $74
            DB    $14
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $2A
            DB    $1C
            DB    $3E
            DB    $1C
            DB    $2A
            DB    $48
            DB    $74
            DB    $02
L9923       DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $30
            DB    $2E
            DB    $1C
            DB    $74
            DB    $32
            DB    $2A
            DB    $14
            DB    $44
            DB    $1C
            DB    $36
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
L9937       DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $3A
            DB    $40
            DB    $30
            DB    $74
            DB    $32
            DB    $2A
            DB    $14
            DB    $44
            DB    $1C
            DB    $36
            DB    $38
            DB    $74
            DB    $74
            DB    $74
            DB    $74

L994B       DB    <L9923,<L9937
L994D       DB    >L9923,>L9937

            DS    $B1
            DS    $100
            DS    $100
            DS    $100
            DS    $100
            DS    $100
            DS    $100

