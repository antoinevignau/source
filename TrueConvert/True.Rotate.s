*----------------------------------------
* True Convert : Rotate
*----------------------------------------

rotDIR = $1110
rotDEG = $1120
rotOK = $1130
rotCANCEL = $1140

rotNONE = $1111
rotLEFT = $1112
rotRIGHT = $1113

rot90 = $1121
rot180 = $1122
rot270 = $1123

*--------------

meROTATE pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTROTATE
 PushLong #0
 PushWord #refIsResource
 PushLong #wROTATE
 PushWord #$800e
 _NewWindow2
 PullLong wiROTATE

 jsr rotateENTRY
 jsr rotateUPDATE

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
 cpy #rotCANCEL
 beq meROTATE9
 cpy #rotOK
 beq meROTATE8
 cpy #rotDIR
 bne ]lp

 jsr rotateUPDATE
 bra ]lp

meROTATE8 jsr rotateESCAPE
 jsr doROTATE

meROTATE9 _InitCursor

 PushLong wiROTATE
 _CloseWindow

 rts

*--------------

PAINTROTATE PushLong wiROTATE
 _DrawControls
 rtl

*--------------

wiROTATE ds 4

*--------------

doROTATE sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20

 ldx rotVDIR
 ldy rotVDEG

 cpx #rotNONE
 bne doROTATE1
 clc
 rts

doROTATE1 tya ; LEFT/RIGHT - 180
 and #%00000000_00000010
 beq doROTATE2

 jsr meFLIP
 jsr meMIRROR
 rts

doROTATE2 cpx #rotLEFT ; LEFT
 bne doROTATE4
 cpy #rot270 ; LEFT - 270
 bne doROTATE3
 jsr doRIGHT90
 rts
doROTATE3 cpy #rot90 ; LEFT - 90
 bne doROTATE6
 jsr doLEFT90
 rts

doROTATE4 cpx #rotRIGHT ; RIGHT
 bne doROTATE6
 cpy #rot270 ; RIGHT - 270
 bne doROTATE5
 jsr doLEFT90
 rts
doROTATE5 cpy #rot90 ; RIGHT - 90
 bne doROTATE6
 jsr doRIGHT90
 rts

doROTATE6 sec  ; NONE
 rts

*--------------

rotateUPDATE pha
 PushLong wiROTATE
 PushLong #rotDIR
 _GetCtlValueByID
 pla
 cmp #rotNONE
 bne rotateUPDATE1

 PushWord #255
 PushLong wiROTATE
 PushLong #rotDEG
 _HiliteCtlByID
 rts

rotateUPDATE1 PushWord #0
 PushLong wiROTATE
 PushLong #rotDEG
 _HiliteCtlByID
 rts

*--------------

rotateENTRY PushWord rotVDIR
 PushLong wiROTATE
 PushLong #rotDIR
 _SetCtlValueByID

 PushWord rotVDEG
 PushLong wiROTATE
 PushLong #rotDEG
 _SetCtlValueByID
 rts

rotateESCAPE pha
 PushLong wiROTATE
 PushLong #rotDIR
 _GetCtlValueByID
 pla
 sta rotVDIR

 pha
 PushLong wiROTATE
 PushLong #rotDEG
 _GetCtlValueByID
 pla
 sta rotVDEG
 rts

*--------------

rotVDIR dw $1111
rotVDEG dw $1121

*----------------------------------------
* True Convert : Flip
*----------------------------------------

meFLIP lda picBPP
 cmp #24
 beq meFLIP24
 jsr doFLIP8
 rts
meFLIP24 jsr doFLIP24
 rts

*----------------------------------------
* True Convert : Mirror
*----------------------------------------

meMIRROR lda picBPP
 cmp #24
 beq meMIRROR24
 jsr doMIRROR8
 rts
meMIRROR24 jsr doMIRROR24
 rts

*----------------------------------------
* True Convert : Add Borders
*----------------------------------------

meBORDERS rts

*----------------------------------------
* True Convert : Add Canvas
*----------------------------------------

meCANVAS rts

*----------------------------------------
* True Convert : Arithmetic
*----------------------------------------

meARITHMETIC rts

*----------------------------------------
*
* ROUTINES GRAPHIQUES
*
*----------------------------------------

doFLIP8 clc
 rts
doFLIP24 clc
 rts
doMIRROR8 clc
 rts
doMIRROR24 clc
 rts
doLEFT90 clc
 rts
doRIGHT90 clc
 rts

*----------------------------------------
* BUFFER
*----------------------------------------

tempBUFFER ds 4096
