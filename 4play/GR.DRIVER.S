*
* A simple GR driver
* (c) 2016, Brutal Deluxe Software
* http://www.brutaldeluxe.fr/
*
* Use them at your own risk ;-)
*

              mx    %11
              org   $1800
              lst   off

*---------- Some info
*
* The GR page is similar to the 40-col screen
*
* There are two pixels per byte:
* - four high bits for the first pixel
* - four low bits for the second pixel
* - and so on...
* So, we have 40x48 pixels and 16 colors
*
* The routines are not optimized!
*
*---------- Entry point

              jmp   GROn          ; Turn GR on
              jmp   GROff         ; Turn GR off
              jmp   GRClear       ; Clear screen
              jmp   GRPutPixel    ; Draw a pixel on screen
              jmp   GRPutPixel2   ; Alt draw a pixel on screen
              jmp   GRGetPixel    ; Get the color of a pixel on screen
              jmp   GRGetPixel2   ; Alt get the color of a pixel on screen
              jmp   GRSetColor    ; Set the pen color
              jmp   GRSetXY       ; Set X1/Y1 coordinates
              jmp   GRSetXY2      ; Set X2/Y2 coordinates
              jmp   GRSetPage     ; Set page1/page2 data
              jmp   GRDrawHLine   ; Draw an horizontal line
              jmp   GRDrawHLine2  ; Alt draw an horizontal line
              jmp   GRDrawVLine   ; Draw a vertical line
              jmp   GRDrawVLine2  ; Alt draw a vertical line

*---------- Information

              asc   8d
              asc   "GR routines v1.0"8d
              asc   "(c) 2016, Brutal Deluxe"
              asc   8d

*---------- Equates

maskHIGH      =     %11110000     ; Get high bits
maskLOW       =     %00001111     ; Get low bits

page1         =     $04           ; High RAM ptr of GR page 1 ($400..$7FF)
page2         =     $08           ; same for page 2 ($800..$BFF)

dpSCREEN      =     $fe           ; My usage of the zero page ;-)

minX          =     0             ; 80px wide
maxX          =     40
minY          =     0             ; 48px height
maxY          =     48

*--- Values

theCOLOR      ds    1             ; color of
theCOLORHIGH  ds    1             ; color for high bits (2 pixels per byte)
theCOLORFULL  ds    1             ; 8-bit color (ORA of the two previous)
theX1         ds    1             ; where to draw a point
theY1         ds    1             ; again
theX2         ds    1             ; same for H and V lines
theY2         ds    1
thePAGE       ds    1             ; may contain $04 (page 1) or $08 (page 2)

*--- Softswitches

KBD           =     $c000         ; the first softswitch
CLR80COL      =     $c000
SET80COL      =     $c001
RDMAINRAM     =     $c002
RDCARDRAM     =     $c003
WRMAINRAM     =     $c004
WRCARDRAM     =     $c005
SETSLOTCXROM  =     $c006
SETINTCXROM   =     $c007
SETSTDZP      =     $c008
SETALTZP      =     $c009
SETINTC3ROM   =     $c00a
SETSLOTC3ROM  =     $c00b
CLR80VID      =     $c00c
SET80VID      =     $c00d
TXTCLR        =     $c050
TXTSET        =     $c051
MIXCLR        =     $c052
MIXSET        =     $c053
TXTPAGE1      =     $c054
TXTPAGE2      =     $c055
LORES         =     $c056
HIRES         =     $c057
SETAN3        =     $c05e
CLRAN3        =     $c05f

*---------- Tables

ptrSCRl       hex   0080008000800080
              hex   28a828a828a828a8
              hex   50d050d050d050d0
ptrSCRh       hex   0000010102020303
              hex   0000010102020303
              hex   0000010102020303

*---------------------------
* GROn
*  Turn the GR screen on
*  Current video conf is not saved
*

GROn          =     *
              sta   TXTCLR        ; switch in graphics (not text)
              sta   MIXCLR        ; clear mixed mode
              sta   TXTPAGE1      ; force page 1
              sta   LORES         ; low-resolution graphics

              lda   #page1        ; exit by forcing page 1
              jmp   GRSetPage

*---------------------------
* GROff
*  Turn the GR screen off
*  Previous video conf is not restored
*

GROff         =     *
              sta   TXTPAGE1      ; switch in text page 1
              sta   MIXSET        ; set mixed mode (4 lines text)
              sta   TXTSET        ; switch in text (not graphics)
              rts

*---------------------------
* GRClear
*  Clear the entire GR screen
*  with color A (ie. HOME)
*
*  We preserve the text holes
*  - $0x00..$0x77
*  - $0x80..$0xF7
*

GRClear       =     *
              jsr   GRSetColor    ; set the colors

              lda   #0            ; point to the first page
              sta   dpSCREEN      ; of the GR screen
              lda   thePAGE       ; on PAGE1 or PAGE2
              sta   dpSCREEN+1

              lda   theCOLORFULL  ; get the full 8-bit color

              ldx   #4-1          ; number of pages to clear

clear2        ldy   #127-8        ; we clear the RAM page
]lp           sta   (dpSCREEN),y
              dey
              bpl   ]lp

              ldy   #255-8        ; we clear the RAM page
]lp           sta   (dpSCREEN),y
              dey
              bmi   ]lp

              inc   dpSCREEN+1    ; next page
              dex                 ; until the
              bpl   clear2        ; four are done
              rts                 ; we're done

*---------------------------
* GRPutPixel / GRPutPixel2
*  Draw a pixel on screen
*  of color A and coords X,Y
*
GRPutPixel    =     *
              jsr   GRSetColor    ; Save color
              stx   theX1         ; and coordinates
              sty   theY1

GRPutPixel2   =     *
              lda   theY1         ; Set the RAM pointer
              lsr                 ; of the Y line
              php                 ; save the carry!
              tax
              lda   ptrSCRl,x
              sta   dpSCREEN
              lda   ptrSCRh,x
              clc
              adc   thePAGE       ; don't forget the page
              sta   dpSCREEN+1

*--- Put a pixel

              ldy   theX1         ; Now, determine where to put the pixel

              plp                 ; we restore the carry to
              bcs   putpixel2     ; determine where to put the pixel

*--- Put in low bits

              lda   (dpSCREEN),y  ; get the pixel
              and   #maskHIGH     ; keep high bits
              ora   theCOLOR      ; add the color
              sta   (dpSCREEN),y  ; put the pixel
              rts

*--- Put in high bits

putpixel2     lda   (dpSCREEN),y  ; get the pixel
              and   #maskLOW      ; keep low bits
              ora   theCOLORHIGH  ; add the color
              sta   (dpSCREEN),y  ; put the color
              rts

*---------------------------
* GRGetPixel / GRGetPixel2
*  Get the color of a pixel
*  at coords X,Y and return
*  it in the Accumulator
*

GRGetPixel    =     *
              stx   theX1
              sty   theY1

GRGetPixel2   =     *
              lda   theY1         ; Set the RAM pointer
              lsr                 ; of the Y line
              php                 ; save the carry!
              tax
              lda   ptrSCRl,x
              sta   dpSCREEN
              lda   ptrSCRh,x
              clc
              adc   thePAGE       ; don't forget the page
              sta   dpSCREEN+1

*--- Get a pixel

              ldy   theX1         ; Now, determine where to get the pixel

              plp                 ; we restore the carry to
              bcs   getpixel2     ; determine where to get the pixel

*--- Get in low bits

              lda   (dpSCREEN),y  ; get the pixel
              and   #maskLOW      ; keep high bits
              rts

*--- Get in high bits

getpixel2     lda   (dpSCREEN),y  ; get the pixel
              and   #maskHIGH     ; keep high bits
              lsr
              lsr
              lsr
              lsr                 ; and return
              rts

*---------------------------
* GRSetColor
*  Define the pen color
*  provided in the Accumulator
*

GRSetColor    =     *
              and   #maskLOW      ; keep low 4 bits
              sta   theCOLOR      ; save color
              asl                 ; calculate
              asl                 ; color for
              asl                 ; other pixel
              asl                 ; in the same byte
              sta   theCOLORHIGH  ; save it
              ora   theCOLOR      ; add lower color
              sta   theCOLORFULL  ; save the full one
              rts

*---------------------------
* GRSetXY
*  Set X/Y coords for all actions
*  through registers X and Y
*

GRSetXY       =     *
              stx   theX1
              sty   theY1
              rts

*---------------------------
* GRSetXY2
*  Set X2/Y2 coords for line drawing
*  through registers X and Y
*

GRSetXY2      =     *
              stx   theX2
              sty   theY2
              rts

*---------------------------
* GRSetPage
*  Set PAGE1 or PAGE2
*  as the default GR screen
*  The routine does not force
*  the page, it sets a value only
*

GRSetPage     =     *
              sta   thePAGE
              rts

*---------------------------
* GRDrawHLine / GRDrawHLine2
*  Draw a line of color A
*  from X1/Y1 to coords in registers X/Y
*
*  Incorrect coordinates are NOT checked
*

GRDrawHLine   =     *
              jsr   GRSetColor
              stx   theX2
              sty   theY2

GRDrawHLine2  =     *
              lda   theY1         ; are Y the same?
              cmp   theY2
              beq   drawh1
              sec                 ; error
              rts
drawh1        lda   theX2         ; X2>X1?
              cmp   theX1
              bcs   drawh2        ; OK
              ldx   theX1         ; exchange
              stx   theX2         ; the two
              sta   theX1         ; X coords

drawh2        jsr   GRPutPixel2   ; put a pixel

              inc   theX1         ; next X
              lda   theX1
              cmp   theX2         ; until the last
              bcc   drawh2
              beq   drawh2
              rts

*---------------------------
* GRDrawVLine / GRDrawVLine2
*  Draw a line of color A
*  from X1/Y1 to coords in registers X/Y
*
*  Incorrect coordinates are NOT checked
*

GRDrawVLine   =     *
              jsr   GRSetColor
              stx   theX2
              sty   theY2

GRDrawVLine2  =     *
              lda   theX1         ; are X the same?
              cmp   theX2
              beq   drawv1
              sec                 ; error
              rts
drawv1        lda   theY2         ; Y2>Y1?
              cmp   theY1
              bcs   drawv2        ; OK
              ldx   theY1         ; exchange
              stx   theY2         ; the two
              sta   theY1         ; Y coords

drawv2        jsr   GRPutPixel2   ; put a pixel

              inc   theY1         ; next Y
              lda   theY1
              cmp   theY2         ; until the last
              bcc   drawv2
              beq   drawv2
              rts

*--- End of code

              ds    \

