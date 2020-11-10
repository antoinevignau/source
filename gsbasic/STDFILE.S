
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         TYP   $AC

         ORG   $000000

         DW    $0178
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $E0
         DB    $00
         DB    $B3
         DB    $00
         DB    $00
         DB    $00
         DB    $C4
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $92
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $43
         DB    $00
         DB    $21
         DB    $01
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
         DB    $00
         DB    $00
         DB    $F3
         DB    $00
         DB    $00
         DB    $00
         DB    $47
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
         DB    $00
         DB    $23
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ASC   'L'

         DW    $8100	; L
         DW    $0100	; minimum version
         DW    $0017	; tool number
         ASC   'StdFile             '

         DB    $00
         DB    $00
         DB    $18	; length of entry
         DB    $00
         DB    $00
         DW    $0117	; tool call entry
         DB    $00	; number of words to push on stack
         DB    $0E	; entry description type (tool call)
         DB    $81	; procedure
         DB    $00	; number of parameters to pull from stack
         DB    $00	; number of parameters after tool call name
         DB    $18	; length of entry minus parameters
         STR   'SFBOOTINIT'

* P,23,2,0,B,N,02,I,I,SFStartUp

         DB    $00
         DB    $00
         DB    $19
         DB    $00
         DB    $00
         DW    $0217
         DB    $00	; no direct push no words on stack
         DB    $0E	; type
         DB    $81	; procedure
         DB    $00	; no drect pull of
         DB    $02	; nb of params to push
         DB    $17	; length minus nb of params
         STR   'SFSTARTUP'
         DB    $01        ; I word
         DB    $01        ; I word

* P,23,3,0,B,N,00,SFShutDown

         DB    $00
         DB    $00
         DB    $18
         DB    $00
         DB    $00
         DW    $0317
         DB    $00
         DB    $0E	; type of entry (tool call description)
         DB    $81        ; 81=Procedure, 82=Function?
         DB    $00
         DB    $00
         DB    $18
         STR   'SFSHUTDOWN'

* F,23,4,1,B,I,00,SFVersion
*
*  F: F/unction ($82) or P/rocedure ($81)
* 23: tool set number
*  4: function number
*  1: nb words to push
*  B: BASIC? for Basic Interface?
*  I/A/N: I/nteger (1 word), A/ddress (2 words), N/ull (0), L/ong (2 words)
* 00: nb de parms @ pousser (I/nteger=1 for word, A/ddress=2 for long)
* ..: tool call name
*  x: 1/2/1... the parameters to push and their type

         DB    $00        ; 0000_0000 (garbage?)
         DB    $00        ; 0000_0000 (garbage?)
         DB    $17        ; total length of entry
         DB    $00        ; 0000_0000 (garbage?)
         DB    $00        ; 0000_0000 (garbage?)
         DW    $0417      ; 23,4 (tool call number)
         DB    $01        ; 0000_0001 1 (direct number of words to push onto stack, eg. space for result)
         DB    $0E        ; 0000_1110 B (probably means B but what does B mean?)
         DB    $82        ; 1000_0010 F (function)
         DB    $01        ; 0000_0001 1 (number of words to pull from stack, eg. pull from result)
         DB    $00        ; 0000_0000 0 (number of items to push - will follow after name)
         DB    $17        ; length minus number of items to pull from stack (see below)
         STR   'SFVERSION'

         DB    $00
         DB    $00
         DB    $15
         DB    $00
         DB    $00
         DW    $0517
         DB    $00
         DB    $0E
         DB    $81
         DB    $00
         DB    $00
         DB    $15
         STR   'SFRESET'

         DB    $00
         DB    $00
         DB    $16	; length of the tool call description
         DB    $00	;
         DB    $00	;
         DW    $0617	; tool call number
         DB    $01
         DB    $0E
         DB    $82	; function
         DB    $01
         DB    $00
         DB    $16	; length bis?
         STR   'SFSTATUS'

         DB    $18
         DB    $00
         DB    $18
         DB    $00
         DB    $00
         DW    $0D17
         DB    $00
         DB    $0E
         DB    $81
         DB    $00
         DB    $01        ; nb_parms
         DB    $17
         STR   'SFALLCAPS'
         DB    $01        ; I word INTEGER

         DB    $00
         DB    $00
         DB    $1D
         DB    $00
         DB    $00
         DW    $0917
         DB    $00
         DB    $0E
         DB    $81
         DB    $00
         DB    $06        ; nb_parms
         DB    $17        ; 0001_1110
         STR   'SFGETFILE'
         DB    $01        ; I word INTEGER
         DB    $01        ; I word
         DB    $02        ; A long ADDRESS
         DB    $02        ; A long
         DB    $02        ; A long
         DB    $02        ; A long

         DB    $00
         DB    $00
         DB    $20
         DB    $00
         DB    $00
         DW    $0B17
         DB    $00
         DB    $0E
         DB    $81
         DB    $00
         DB    $08        ; nb_parms
         DB    $18
         STR   'SFPGETFILE'
         DB    $01        ; I
         DB    $01        ; I
         DB    $02        ; A
         DB    $02        ; A
         DB    $02        ; A
         DB    $02        ; A
         DB    $02        ; A
         DB    $02        ; A

         DB    $00
         DB    $00
         DB    $20
         DB    $00
         DB    $00
         DW    $0C17
         DB    $00
         DB    $0E
         DB    $81
         DB    $00
         DB    $08        ; nb_parms
         DB    $18
         STR   'SFPPUTFILE'
         DB    $01        ; I
         DB    $01        ; I
         DB    $02        ; A
         DB    $02        ; A
         DB    $01        ; I
         DB    $02        ; A
         DB    $02        ; A
         DB    $02        ; A

         DB    $00
         DB    $00
         DB    $1D	; should be $1B
         DB    $00
         DB    $00
         DW    $0A17
         DB    $00
         DB    $0E
         DB    $81
         DB    $00
         DB    $06        ; nb_parms
         DB    $17
         STR   'SFPUTFILE'
         DB    $01        ; I
         DB    $01        ; I
         DB    $02        ; A
         DB    $02        ; A
         DB    $01        ; I
         DB    $02        ; A
