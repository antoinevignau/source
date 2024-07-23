*----------------------------------------
* True Convert : Options
*----------------------------------------

optOK = $1B10
optCANCEL = $1B20
optERROR = $1B30
optVIEW = $1B40
optSIGHT = $1B50

*--------------

meOPTIONS pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTOPTIONS
 PushLong #0
 PushWord #refIsResource
 PushLong #wOPTIONS
 PushWord #$800e
 _NewWindow2
 PullLong wiOPTIONS

 jsr optionsENTRY

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
 cpy #optCANCEL
 beq meOPTIONS9
 cpy #optOK
 bne ]lp

 jsr optionsESCAPE

meOPTIONS9 _InitCursor

 PushLong wiOPTIONS
 _CloseWindow

 rts

*--------------

PAINTOPTIONS PushLong wiOPTIONS
 _DrawControls
 rtl

*--------------

wiOPTIONS ds 4

*--------------

optionsENTRY PushWord optVERROR
 PushLong wiOPTIONS
 PushLong #optERROR
 _SetCtlValueByID

 PushWord optVVIEW
 PushLong wiOPTIONS
 PushLong #optVIEW
 _SetCtlValueByID

 PushWord optVSIGHT
 PushLong wiOPTIONS
 PushLong #optSIGHT
 _SetCtlValueByID
 rts

optionsESCAPE pha
 PushLong wiOPTIONS
 PushLong #optERROR
 _GetCtlValueByID
 pla
 sta optVERROR

 pha
 PushLong wiOPTIONS
 PushLong #optVIEW
 _GetCtlValueByID
 pla
 sta optVVIEW

 pha
 PushLong wiOPTIONS
 PushLong #optSIGHT
 _GetCtlValueByID
 pla
 sta optVSIGHT
 rts

*--------------

optVERROR dw $0001
optVVIEW dw $0001
optVSIGHT dw $0000
