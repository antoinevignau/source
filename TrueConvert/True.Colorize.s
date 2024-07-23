*----------------------------------------
* True Convert : Colorize
*----------------------------------------

colOK = $1A50
colCANCEL = $1A40
colPOP = $1A20

*--------------

meCOLORIZE pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTCOLORIZE
 PushLong #0
 PushWord #refIsResource
 PushLong #wCOLORIZE
 PushWord #$800e
 _NewWindow2
 PullLong wiCOLORIZE

 jsr colorizeENTRY

]lp pha
 pha
 PushLong #taskREC
 PushLong #0
 PushLong #0
 PushLong #-1
 PushWord #%11000000_00011000
 _DoModalWindow
 ply
 plx
 cpy #colCANCEL
 beq meCOLORIZE9
 cpy #colOK
 bne ]lp

 jsr doCOLORIZE
 jsr colorizeESCAPE

meCOLORIZE9 _InitCursor
 PushLong wiCOLORIZE
 _CloseWindow
 rts

*--------------

PAINTCOLORIZE PushLong wiCOLORIZE
 _DrawControls
 rtl

*--------------

doCOLORIZE sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20
 rts

*--------------

colorizeENTRY PushWord colVPOP
 PushLong wiCOLORIZE
 PushLong #colPOP
 _SetCtlValueByID
 rts

*--------------

colorizeESCAPE pha
 PushLong wiCOLORIZE
 PushLong #colPOP
 _GetCtlValueByID
 pla
 sta colVPOP
 rts

*--------------

colVPOP dw $1A21

*--------------

wiCOLORIZE ds 4
