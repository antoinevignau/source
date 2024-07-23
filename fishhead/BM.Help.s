*----------------------------------------
* BatchMan : Help
*----------------------------------------

helPOP = $1310

*--------------

meHELP lda wiHELP
 ora wiHELP+2
 beq meHELP1

 PushLong wiHELP
 _SelectWindow
 rts

meHELP1 pha
 pha
 PushLong #0
 PushLong #wHELP
 PushLong #PAINTHELP
 PushLong #0
 PushWord #refIsResource
 PushLong #wHELP
 PushWord #$800e
 _NewWindow2
 PullLong wiHELP

 jsr helpENTRY

 PushLong wiHELP
 _ShowWindow

*--------------

doHELP pea $0015 ; 00000000_00010101
 pea $0000 ; load from resource rText

 pha ; Get the current selected Item
 PushLong wiHELP
 PushLong #helPOP
 _GetCtlValueByID

 lda #0
 pha
 pha
 pha
 pha
 pha
 pha
 pha
 _TESetText
 rts

*--------------

helpENTRY PushWord helVPOP
 PushLong wiHELP
 PushLong #helPOP
 _SetCtlValueByID
 rts

helpESCAPE pha
 PushLong wiHELP
 PushLong #helPOP
 _GetCtlValueByID
 pla
 sta helVPOP
 rts

*--------------

PAINTHELP PushLong wiHELP
 _DrawControls
 rtl

*--------------

helVPOP dw $1311

wiHELP ds 4
