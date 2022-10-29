*
* GR test program
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

KBD           =     $C000
KBDSTROBE     =     $C010

*---------- Driver equates

GROn          =     $1800           ; Turn DGR on
GROff         =     GROn+3          ; Turn DGR off
GRClear       =     GROff+3         ; Clear screen
GRPutPixel    =     GRClear+3       ; Draw a pixel on screen
GRPutPixel2   =     GRPutPixel+3    ; Alt draw a pixel on screen
GRGetPixel    =     GRPutPixel2+3   ; Get the color of a pixel on screen
GRGetPixel2   =     GRGetPixel+3    ; Alt get the color of a pixel on screen
GRSetColor    =     GRGetPixel2+3   ; Set the pen color
GRSetXY       =     GRSetColor+3    ; Set X1/Y1 coordinates
GRSetXY2      =     GRSetXY+3       ; Set X2/Y2 coordinates
GRSetPage     =     GRSetXY2+3      ; Set page1/page2 data
GRDrawHLine   =     GRSetPage+3     ; Draw an horizontal line
GRDrawHLine2  =     GRDrawHLine+3   ; Alt draw an horizontal line
GRDrawVLine   =     GRDrawHLine2+3  ; Draw a vertical line
GRDrawVLine2  =     GRDrawVLine+3   ; Alt draw a vertical line

*---------- The code

              jsr   GROn            ; Turn DGR on

              lda   #$00            ; Set color to black
              sta   theCOLOR

clearLOOP     lda   theCOLOR        ; Please erase the screen
              jsr   GRClear

]lp           lda   KBD             ; Wait for a keypress
              bpl   ]lp
              bit   KBDSTROBE

              inc   theCOLOR        ; Next color, please
              lda   theCOLOR        ; There are 16 of them
              cmp   #16
              bne   clearLOOP

*--- Test 2

              ldx   #0
              ldy   #0
              jsr   GRSetXY
              lda   #6
              ldx   #39
              ldy   #0
              jsr   GRDrawHLine

              ldx   #39
              ldy   #0
              jsr   GRSetXY
              lda   #6
              ldx   #39
              ldy   #47
              jsr   GRDrawVLine

              jsr   $fd0c

              jsr   GROff           ; Turn DGR off
              rts                   ; Exit

*--- My test data

theCOLOR      ds    1

