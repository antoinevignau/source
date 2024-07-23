*----------------------------------------
* BatchMan : Preferences
*----------------------------------------

loadPREFS = *
 jsr prefLOAD ; Try to load
 bcc loadPREFS1

 jsr prefCREATE ; Otherwise create
 jsr prefSAVE ; and save...

loadPREFS1 rts

*-----------

savePREFS jsr prefSAVE
 rts

*--------------

prefLOAD = *
 lda #1 ; request read access
 sta pprefOPEN+8

 jsl proDOS
 dw $2010
 adrl pprefOPEN
 bcc prefLOAD1
 rts

prefLOAD1 lda pprefOPEN+2
 sta pprefREAD+2
 sta pprefCLOSE+2

 jsl proDOS
 dw $2012
 adrl pprefREAD
 bcc prefLOAD2
 rts

prefLOAD2 jsl proDOS
 dw $2014
 adrl pprefCLOSE

*----------- Now compare the file is right

* Compare the string
 ldx #16-2
]lp lda prefDEFAULT,x
 cmp prefBUFFER,x
 bne prefLOAD9
 dex
 dex
 bpl ]lp

* ORA all next values (0 or 1)
 lda #0
 ldx #32
]lp ora prefBUFFER,x
 inx
 inx
 cpx #48
 bne ]lp

 cmp #2 ; final value must be <2
 bcs prefLOAD9

 jsr prefCOPYtoOPT ; OK!

 clc
 rts
prefLOAD9 sec
 rts

*--------------

prefSAVE = *
 lda #2 ; request write access
 sta pprefOPEN+8

 jsr prefCOPYfromOPT

 jsl proDOS
 dw $2010
 adrl pprefOPEN

 lda pprefOPEN+2
 sta pprefREAD+2
 sta pprefCLOSE+2

 jsl proDOS
 dw $2013 ; Write!
 adrl pprefREAD

 jsl proDOS
 dw $2014
 adrl pprefCLOSE
 rts

*--------------

prefCREATE jsl proDOS ; first, create the folder
 dw $2001
 adrl pprefCREATE1

 jsr prefCOPYfromDEF
 jsr prefCOPYtoOPT

 jsl proDOS ; now create the file
 dw $2001
 adrl pprefCREATE2
 rts

*--------------

prefCOPYfromOPT = *
 ldx #48-2
]lp lda optSTRING,x
 sta prefBUFFER,x
 dex
 dex
 bpl ]lp
 rts

prefCOPYtoOPT = *
 ldx #48-2
]lp lda prefBUFFER,x
 sta optSTRING,x
 dex
 dex
 bpl ]lp
 rts

prefCOPYfromDEF = *
 ldx #48-2
]lp lda prefDEFAULT,x
 sta prefBUFFER,x
 dex
 dex
 bpl ]lp
 rts

*--------------

pprefOPEN dw 3
 ds 2
 adrl pprefFILE
 dw 1

pprefREAD dw 4
 ds 2
 adrl prefBUFFER
 adrl 48
 ds 4

pprefCLOSE dw 1
 ds 2

pprefCREATE1 dw 4 ; pcount
 adrl pprefPFX ; pathname
 dw $c3 ; access_code
 dw $0f ; file_type
 ds 4 ; aux_type

pprefCREATE2 dw 6 ; pcount
 adrl pprefFILE ; pathname
 dw $c3 ; access_code
 dw $5a ; file_type
 adrl $80BD ; aux_type
 dw 1 ; storage_type
 adrl 48 ; eof

pprefFILE strl '*:System:Preferences:Fishhead'
pprefPFX strl '*:System:Preferences:'

*--------------
* Preferences file
* Length is 48

prefDEFAULT asc 'BM BD AV&OZ 2012'
 asc '192.168.0.1     '
 dw $0001
 dw $0001
 dw $0001
 dw $0000
 dw $0000
 dw $0000
 dw $0000
 dw $0000

prefBUFFER ds 48
