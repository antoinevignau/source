*
* I'm fEDD up ;-)
*
* (c) 2012, Brutal Deluxe Software
*

*----------

xHEADER      =     0
yHEADER      =     0

keyINV       =     'i'
keyNORM      =     'n'

antiMASK     =     $7F
charMASK     =     $80

*----------

showHEADER   =     *

             ldx   #xHEADER
             ldy   #yHEADER
             jsr   tabXY

             ldx   #>strHEADER
             ldy   #<strHEADER
             jsr   printCCSTR
             rts

* asc '0123456789012345678901234567890123456789'

strHEADER    =     *
             asc   'i'27'm fEDD up v2.3  Brutal Deluxe Software'
             asc   '           ^               & John Brooks'
             asc   '   ^      /~\         ^'0d
             asc   '  /~\   /~~~~~\      /~\ /~ ~~~~~\'0d
             asc   ' /~~~`/~~      ~\  /~~~~~      ~~~\'0d
             asc   '/~          ^   ~~~~~             ~\'0d
             asc   '     ^      ^    ~.~               ~~~~~'00

strMENU      =     *
             asc   ' ^   ^   ^     ^  ..'0d
             asc   ' ^      /^\    ^   ..'0d
             asc   '   ^    /i\        ..              ---'0d
             asc   '  /^\    l        ...'0d
             asc   '  /i\            ...'0d
             asc   '   l        ^    ..'0d
             asc   '           /^\  .......         ,'0d
             asc   '     /\    /l\  ............. ,;'0d
             asc   '    ,/\,    ~    ...........,;     ,'0d
             asc   '    //\\          ........,;     ,;.'0d
             asc   '   ,//\\,            ....;     ,;.....'0d
             asc   '   ///\\\               ;     ,.........'
             asc   '  ,//ii\\,             ;    ,;..........'
             asc   '     II    -----------     ;............'
             asc   '                          ; ............'
             asc   '           -----------       ...........'00

*----------

tabXY        stx   CH
             tya
             jsr   TABV
             rts

*----------

printCHAR    ora   #charMASK
             jsr   COUT
             rts

*----------

printSTR     sty   dpFROM
             stx   dpFROM+1

             ldy   #0
             lda   (dpFROM),y
             beq   printSTR2
             sta   nbCAR

]lp          inc   dpFROM
             bne   printSTR1
             inc   dpFROM+1

printSTR1    ldy   #0
             lda   (dpFROM),y
             cmp   #keyINV
             beq   printINV
             cmp   #keyNORM
             beq   printNORM

             ora   #charMASK
             jsr   COUT

             dec   nbCAR
             bne   ]lp

printSTR2    rts

printINV     jsr   SETINV
             jmp   ]lp
printNORM    jsr   SETNORM
             jmp   ]lp

nbCAR        ds    1

*----------

printCSTR    sty   dpFROM
             stx   dpFROM+1

]lp          ldy   #0
             lda   (dpFROM),y
             beq   printCSTR9

             cmp   #keyINV
             beq   printINV2
             cmp   #keyNORM
             beq   printNORM2

printCSTR1   ora   #charMASK
             jsr   COUT

printCSTR2   inc   dpFROM
             bne   ]lp
             inc   dpFROM+1
             bne   ]lp

printCSTR9   rts

printINV2    jsr   SETINV
             jmp   printCSTR2
printNORM2   jsr   SETNORM
             jmp   printCSTR2

*----------

printCCSTR   sty   dpFROM
             stx   dpFROM+1

]lp          ldy   #0
             lda   (dpFROM),y
             beq   printCCSTR9
             ora   #charMASK
             jsr   COUT

             inc   dpFROM
             bne   ]lp
             inc   dpFROM+1
             bne   ]lp

printCCSTR9  rts

*----------

printBIG     stx   dpX
             sty   dpY

             pha
             jsr   tabXY
             pla

printBIG0    asl
             tay
             lda   tblCHAR,y
             sta   dpFROM
             lda   tblCHAR+1,y
             sta   dpFROM+1

printBIG1    lda   #0
             sta   tempX

]lp          ldy   #0
             lda   (dpFROM),y
             beq   printBIG9
             ora   #charMASK
             jsr   COUT

             inc   dpFROM
             bne   printBIG2
             inc   dpFROM+1

printBIG2    inc   tempX        ; char width = 5
             lda   tempX
             cmp   #5
             bne   ]lp

             inc   dpY          ; next line
             ldx   dpX          ; tab XY
             ldy   dpY
             jsr   tabXY
             jmp   printBIG1    ; loop

printBIG9    rts

tempX        ds    1

*----------

tblCHAR      da    char0,char1,char2,char3
             da    char4,char5,char6,char7
             da    char8,char9,charA,charB
             da    charC,charD,charE,charF

char0        asc   ' $$$ '
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'
             asc   ' $$$ '00

char1        asc   '  $  '
             asc   ' $$  '
             asc   '  $  '
             asc   '  $  '
             asc   '  $  '
             asc   '  $  '
             asc   ' $$$ '00

char2        asc   ' $$$ '
             asc   '$   $'
             asc   '    $'
             asc   ' $$$ '
             asc   '$    '
             asc   '$    '
             asc   '$$$$$'00

char3        asc   '$$$$$'
             asc   '    $'
             asc   '    $'
             asc   '  $$ '
             asc   '    $'
             asc   '$   $'
             asc   ' $$$ '00

char4        asc   '$  $ '
             asc   '$  $ '
             asc   '$  $ '
             asc   '$$$$ '
             asc   '   $ '
             asc   '   $ '
             asc   '   $ '00

char5        asc   '$$$$$'
             asc   '$    '
             asc   '$    '
             asc   ' $$$ '
             asc   '    $'
             asc   '    $'
             asc   '$$$$ '00

char6        asc   ' $$$ '
             asc   '$    '
             asc   '$    '
             asc   '$$$$ '
             asc   '$   $'
             asc   '$   $'
             asc   ' $$$ '00

char7        asc   '$$$$ '
             asc   '   $ '
             asc   '   $ '
             asc   ' $$$ '
             asc   '   $ '
             asc   '   $ '
             asc   '   $ '00

char8        asc   ' $$$ '
             asc   '$   $'
             asc   '$   $'
             asc   ' $$$ '
             asc   '$   $'
             asc   '$   $'
             asc   ' $$$ '00

char9        asc   ' $$$ '
             asc   '$   $'
             asc   '$   $'
             asc   ' $$$$'
             asc   '    $'
             asc   '    $'
             asc   ' $$$ '00

charA        asc   ' $$$ '
             asc   '$   $'
             asc   '$   $'
             asc   '$$$$$'
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'00

charB        asc   '$$$$ '
             asc   '$   $'
             asc   '$   $'
             asc   '$$$$ '
             asc   '$   $'
             asc   '$   $'
             asc   '$$$$ '00

charC        asc   '$$$$$'
             asc   '$    '
             asc   '$    '
             asc   '$    '
             asc   '$    '
             asc   '$    '
             asc   '$$$$$'00

charD        asc   '$$$$ '
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'
             asc   '$   $'
             asc   '$$$$ '00

charE        asc   '$$$$$'
             asc   '$    '
             asc   '$    '
             asc   '$$$$ '
             asc   '$    '
             asc   '$    '
             asc   '$$$$$'00

charF        asc   '$$$$$'
             asc   '$    '
             asc   '$    '
             asc   '$$$$ '
             asc   '$    '
             asc   '$    '
             asc   '$    '00

* ds \

