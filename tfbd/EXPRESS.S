
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         REL

         DS    2          ; File ref num
         DS    2
         DW    $0003      ; # of segments -1
         DA    L01002E-*  ; Offset to seg header
         DW    $0000      ; Flags
         DS    4          ; Handle to segment
         DA    L010072-*
         DW    $0000
         DS    4
         DA    L0100B6-*
         DW    $0000
         DS    4
         DA    L0100FA-*
         DW    $0000
         DS    4
         DW    $0002      ; Segments numbers
         DW    $0003
         DW    $0004
         DW    $0005
L01002E  ADRL  $000001CC  ; Segments headers
         ADRL  $0000A8A3
         ADRL  $0000AA6F
         ADRL  $000027D4
         DS    1
         DB    $0A
         DB    $04
         DB    $02
         ADRL  $00010000
         DW    $1000
         ADRL  $00000000
         ADRL  $00000000
         DB    $00
         DS    3
         DW    $0002
         ADRL  $00000000
         DW    $002C
         DW    $0040
         ASC   'Disasm    '
         ASC   'Disasm    '
L010072  ADRL  $0000D288
         ADRL  $00000DF3
         ADRL  $0000E07B
         ADRL  $0000036E
         DS    1
         DB    $0A
         DB    $04
         DB    $02
         ADRL  $00010000
         DW    $1000
         ADRL  $00000000
         ADRL  $00000000
         DB    $00
         DS    3
         DW    $0003
         ADRL  $00000000
         DW    $002C
         DW    $0040
         ASC   'Disasm    '
         ASC   'Text      '
L0100B6  ADRL  $0000E42E
         ADRL  $00005A85
         ADRL  $00013EB3
         ADRL  $0000111A
         DS    1
         DB    $0A
         DB    $04
         DB    $02
         ADRL  $00010000
         DW    $1000
         ADRL  $00000000
         ADRL  $00000000
         DB    $00
         DS    3
         DW    $0004
         ADRL  $00000000
         DW    $002C
         DW    $0040
         ASC   'Disasm    '
         ASC   'Kernel    '
L0100FA  ADRL  $00015012
         ADRL  $000024AF
         ADRL  $000174C1
         ADRL  $0000074B
         DS    1
         DB    $0A
         DB    $04
         DB    $02
         ADRL  $00010000
         DW    $1000
         ADRL  $00000000
         ADRL  $00000000
         DB    $00
         DS    3
         DW    $0005
         ADRL  $00000000
         DW    $002C
         DW    $0040
         ASC   'Disasm    '
         ASC   'Scripts   '
