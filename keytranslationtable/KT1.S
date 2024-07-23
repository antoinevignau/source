*
* Resource $8021
* 0FF06FF for the default translation table (en français)
*
* (c) 202x, Antoine Vignau
*

* transTable (256 bytes)

            HEX   000102030405060708090A0B0C0D0E0F
            HEX   101112131415161718191A1B1C1D1E1F
            HEX   202122232425262728292A2B2C2D2E2F
            HEX   303132333435363738393A3B3C3D3E3F
            HEX   884142434445464748494A4B4C4D4E4F
            HEX   505152535455565758595A5B8D5D5E5F
            HEX   606162636465666768696A6B6C6D6E6F
            HEX   707172737475767778797A8E9D8F7E7F
            HEX   808182838485868788898A8B8C8D8E8F
            HEX   909192939495969798999A9B9C9D9E9F
            HEX   A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
            HEX   B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF
            HEX   C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
            HEX   D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
            HEX   E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
            HEX   F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

* deadKeyTable (deadKey, offset)

            DDB   $DB04	; offset/2 to replacementTable1 - for ^
            DDB   $F50F	; offset/2 to replacementTable2 - for ¨
            DDB   $EE1A	; offset/2 to replacementTable3 - for tilde
            DDB   $0000

* replacementTable1 (scanKey, replaceValue) - offset is at 4x2

            DDB   $6189	; A
            DDB   $6590	; E
            DDB   $6994	; I
            DDB   $6F99	; O
            DDB   $759E ; U
            DDB   $41E5 ; a
            DDB   $45E6 ; e
            DDB   $49EB ; i
            DDB   $4FEF ; o
            DDB   $55F3 ; u
            DDB   $0000

* replacementTable2 (scanKey, replaceValue) - offset is at Fx2

            DDB   $618A	; A
            DDB   $6591	; E
            DDB   $6995	; I
            DDB   $6F9A	; O
            DDB   $759F	; U
            DDB   $4180	; a
            DDB   $45E8	; e
            DDB   $49EC	; i
            DDB   $4F85	; o
            DDB   $5586	; u
            DDB   $0000
	
* replacementTable3 (scanKey, replaceValue) - offset is at 1Ax2
* used for tilde

            DDB   $618B	; A
            DDB   $6E96	; N
            DDB   $6F9B	; O
            DDB   $41CC	; a
            DDB   $4E84	; n
            DDB   $4FCD	; o
            DDB   $0000
