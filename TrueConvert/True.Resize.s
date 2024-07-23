*----------------------------------------
* True Convert : Resize
*----------------------------------------

resOK = $1760
resCANCEL = $1750
resH = $1740
resW = $1730
resHT = $1721
resWT = $1720
resPOP = $1710
resBTN1 = $1701
resBTN2 = $1702

*--------------

meRESIZE pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTRESIZE
 PushLong #0
 PushWord #refIsResource
 PushLong #wRESIZE
 PushWord #$800e
 _NewWindow2
 PullLong wiRESIZE

 jsr resizeENTRY
 jsr resizeUPDATE

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
 cpy #resCANCEL
 beq meRESIZE9
 cpy #resOK
 beq meRESIZE8
 cpy #resBTN1
 beq meRESIZE7
 cpy #resBTN2
 bne ]lp

meRESIZE7 jsr resizeUPDATE
 bra ]lp

meRESIZE8 jsr doRESIZE
 jsr resizeESCAPE

meRESIZE9 _InitCursor
 PushLong wiRESIZE
 _CloseWindow
 rts

*--------------

PAINTRESIZE PushLong wiRESIZE
 _DrawControls
 rtl

*--------------

doRESIZE sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20
 rts

*--------------

resizeENTRY PushWord resVBTN1
 PushLong wiRESIZE
 PushLong #resBTN1
 _SetCtlValueByID

 PushWord resVBTN2
 PushLong wiRESIZE
 PushLong #resBTN2
 _SetCtlValueByID

 PushWord resVPOP
 PushLong wiRESIZE
 PushLong #resPOP
 _SetCtlValueByID

 PushLong wiRESIZE
 PushLong #resW
 PushLong #resWIDTH
 _SetLETextByID

 PushLong wiRESIZE
 PushLong #resH
 PushLong #resHEIGHT
 _SetLETextByID
 rts

*--------------

resizeESCAPE pha
 PushLong wiRESIZE
 PushLong #resBTN1
 _GetCtlValueByID
 pla
 sta resVBTN1

 pha
 PushLong wiRESIZE
 PushLong #resBTN2
 _GetCtlValueByID
 pla
 sta resVBTN2

 pha
 PushLong wiRESIZE
 PushLong #resPOP
 _GetCtlValueByID
 pla
 sta resVPOP

 PushLong wiRESIZE
 PushLong #resW
 PushLong #resWIDTH
 _GetLETextByID

 PushLong wiRESIZE
 PushLong #resH
 PushLong #resHEIGHT
 _GetLETextByID
 rts

*--------------

resizeUPDATE pha
 PushLong wiRESIZE
 PushLong #resBTN1
 _GetCtlValueByID
 pla
 sta resVBTN1
 beq resizeUPDATE1 ; Bouton 2 actif

 jsr resizeNOT2
 jsr resizeBUT1
 rts

resizeUPDATE1 jsr resizeNOT1
 jsr resizeBUT2
 rts

*--------------

resizeNOT1 PushWord #255
 PushLong wiRESIZE
 PushLong #resPOP
 _HiliteCtlByID
 rts

resizeBUT1 PushWord #0
 PushLong wiRESIZE
 PushLong #resPOP
 _HiliteCtlByID
 rts

*--------------

resizeNOT2 PushWord #255
 PushLong wiRESIZE
 PushLong #resWT
 _HiliteCtlByID

 PushWord #255
 PushLong wiRESIZE
 PushLong #resW
 _HiliteCtlByID

 PushWord #255
 PushLong wiRESIZE
 PushLong #resHT
 _HiliteCtlByID

 PushWord #255
 PushLong wiRESIZE
 PushLong #resH
 _HiliteCtlByID
 rts

resizeBUT2 PushWord #0
 PushLong wiRESIZE
 PushLong #resWT
 _HiliteCtlByID

 PushWord #0
 PushLong wiRESIZE
 PushLong #resW
 _HiliteCtlByID

 PushWord #0
 PushLong wiRESIZE
 PushLong #resHT
 _HiliteCtlByID

 PushWord #0
 PushLong wiRESIZE
 PushLong #resH
 _HiliteCtlByID
 rts

*--------------

resVBTN1 dw 1
resVBTN2 dw 0

resVPOP dw $1711
resWIDTH ds 5
resHEIGHT ds 5

*--------------

wiRESIZE ds 4
