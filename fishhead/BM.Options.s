*----------------------------------------
* BatchMan : Options
*----------------------------------------

optOK = $1B10
optCANCEL = $1B20

optBATCH = $1B30 ; Batch mode
optDOLOG = $1B40 ; Generate log file
optSAVELOG = $1B50 ; Save log file
optDATES = $1B60 ; Force dates
optIP = $1B90 ; ADTPro server IP address

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

optionsENTRY PushWord optVBATCH
 PushLong wiOPTIONS
 PushLong #optBATCH
 _SetCtlValueByID

 PushWord optVDOLOG
 PushLong wiOPTIONS
 PushLong #optDOLOG
 _SetCtlValueByID

 PushWord optVSAVELOG
 PushLong wiOPTIONS
 PushLong #optSAVELOG
 _SetCtlValueByID

* v1.0b6
 PushWord optVDATES
 PushLong wiOPTIONS
 PushLong #optDATES
 _SetCtlValueByID

 rts

optionsESCAPE pha
 PushLong wiOPTIONS
 PushLong #optBATCH
 _GetCtlValueByID
 pla
 sta optVBATCH

 pha
 PushLong wiOPTIONS
 PushLong #optDOLOG
 _GetCtlValueByID
 pla
 sta optVDOLOG

 pha
 PushLong wiOPTIONS
 PushLong #optSAVELOG
 _GetCtlValueByID
 pla
 sta optVSAVELOG

* v1.0b6
 pha
 PushLong wiOPTIONS
 PushLong #optDATES
 _GetCtlValueByID
 pla
 sta optVDATES

 jsr savePREFS

 rts

*--------------
* Preferences file
* Length is 48

optSTRING asc 'BM BD AV&OZ 2012'
optLATERON asc '192.168.0.1     '
optVBATCH dw $0001
optVDOLOG dw $0001
optVSAVELOG dw $0001
optVDATES dw $0000
 dw $0000
 dw $0000
 dw $0000
 dw $0000
