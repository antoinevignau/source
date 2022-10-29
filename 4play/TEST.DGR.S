*
* DGR test program
*
* (c) 2016, Brutal Deluxe Software
* http://www.brutaldeluxe.fr/
*
* Use them at your own risk ;-)
*

               mx    %11
               org   $300
               lst   off

*---------- Entry point

KBD            =     $C000
KBDSTROBE      =     $C010

*---------- Driver equates

DGROn          =     $1800            ; Turn DGR on
DGROff         =     DGROn+3          ; Turn DGR off
DGRClear       =     DGROff+3         ; Clear screen
DGRPutPixel    =     DGRClear+3       ; Draw a pixel on screen
DGRPutPixel2   =     DGRPutPixel+3    ; Alt draw a pixel on screen
DGRGetPixel    =     DGRPutPixel2+3   ; Get the color of a pixel on screen
DGRGetPixel2   =     DGRGetPixel+3    ; Alt get the color of a pixel on screen
DGRSetColor    =     DGRGetPixel2+3   ; Set the pen color
DGRSetXY       =     DGRSetColor+3    ; Set X1/Y1 coordinates
DGRSetXY2      =     DGRSetXY+3       ; Set X2/Y2 coordinates
DGRSetPage     =     DGRSetXY2+3      ; Set page1/page2 data
DGRDrawHLine   =     DGRSetPage+3     ; Draw an horizontal line
DGRDrawHLine2  =     DGRDrawHLine+3   ; Alt draw an horizontal line
DGRDrawVLine   =     DGRDrawHLine2+3  ; Draw a vertical line
DGRDrawVLine2  =     DGRDrawVLine+3   ; Alt draw a vertical line

*---------- The code

               jsr   DGROn            ; Turn DGR on

               lda   #$00             ; Set color to black
               sta   theCOLOR

clearLOOP      lda   theCOLOR         ; Please erase the screen
               jsr   DGRClear

]lp            lda   KBD              ; Wait for a keypress
               bpl   ]lp
               bit   KBDSTROBE

               inc   theCOLOR         ; Next color, please
               lda   theCOLOR         ; There are 16 of them
               cmp   #16
               bne   clearLOOP

*--- Test 2

               ldx   #0
               ldy   #0
               jsr   DGRSetXY
               lda   #6
               ldx   #79
               ldy   #0
               jsr   DGRDrawHLine

               ldx   #79
               ldy   #0
               jsr   DGRSetXY
               lda   #6
               ldx   #79
               ldy   #47
               jsr   DGRDrawVLine

               jsr   $fd0c

               jsr   DGROff           ; Turn DGR off
               rts                    ; Exit

*--- My test data

theCOLOR       ds    1

