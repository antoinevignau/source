*----------------------------------------
* BatchMan : Batch
*----------------------------------------

batNEXT0 = $1710
batBACK0 = $1720
batCANC0 = $1730
batPOPUP = $1740
batREFR0 = $1750

batNEXT1 = $1810
batBACK1 = $1820
batCANC1 = $1830
batPATH1 = $1840
batBROW1 = $1850

batNEXT2 = $1910
batBACK2 = $1920
batCANC2 = $1930
batPATH2 = $1940
batBROW2 = $1950

dcNEXT = $1A82
dcBACK = $1A81
dcCANC = $1A80
dcTEST = $1A44

*----------------------------------------
* Entry point for FILE COPY
*----------------------------------------

meBATCH jsr batchPFXIN ; first window
 jsr batchWINDOW0
 cpy #batCANC0
 beq meBATCH1

meBATCH0 jsr batchWINDOW2 ; second window
 cpy #batBACK2
 beq meBATCH
 cpy #batNEXT2
 beq meBATCH2

meBATCH1 rts  ; we cancel

meBATCH2 = * ; we continue
 jsr batchPFXOUT
 jsr checkPFXOUT
 bcs meBATCH0 ; destination prefix is wrong

* V1.0b4
 PushLong #0
 _RefreshDesktop
*

 jsr GSOSsetPFXsave
 jsr doFC ; do file copy!
 cmp #-1 ; destination path in source path?
 bne meBATCH3

 PushWord #0 ; Bad prefix
 PushWord #5 ; flags
 PushLong #0
 PushLong #alertSAME ; reference of alert
 _AlertWindow
 pla
 bra meBATCH0

meBATCH3 rts

*----------------------------------------
* Entry point for DISK COPY
*----------------------------------------

dcBATCH jsr batchPFXIN ; first window
 jsr batchWINDOW0
 cpy #batCANC0
 beq dcBATCH1

dcBATCHa jsr batchDISK ; second window
 cpy #dcBACK
 beq dcBATCH
 cpy #dcCANC
 beq dcBATCH1

dcBATCH0 jsr batchWINDOW2 ; third window
 cpy #batBACK2
 beq dcBATCHa
 cpy #batNEXT2
 beq dcBATCH2

dcBATCH1 rts  ; we cancel

dcBATCH2 = * ; we continue
 jsr batchPFXOUT
 jsr checkPFXOUT
 bcs dcBATCH0 ; destination prefix is wrong

* V1.0b4
 PushLong #0
 _RefreshDesktop
*
 rts

 jsr GSOSsetPFXsave
* jsr doBC ; do block copy!
 cmp #-1 ; destination path in source path?
 bne dcBATCH3

 PushWord #0 ; Bad prefix
 PushWord #5 ; flags
 PushLong #0
 PushLong #alertSAME ; reference of alert
 _AlertWindow
 pla
 bra dcBATCH0

dcBATCH3 rts


*----------------------------------------
* First modal window: device
*----------------------------------------

batchWINDOW0 = *
 pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTBATCH0
 PushLong #0
 PushWord #refIsResource
 PushLong #wBATCH0
 PushWord #$800e
 _NewWindow2
 PullLong wiBATCH0

* v1.0b8
baWINDOW2 lda #deviceALL ; all devices
 jsr buildPOPUP

]lp pha
 pha
 PushLong #taskREC
 PushLong #0
 PushLong #0
 PushLong #-1
 PushWord #%11000000_00011000
 _DoModalWindow
 ply
 sty batchBUTTON
 plx
 cpy #batBACK0 ; Easter egg
 beq batchWINDOW07
 cpy #batNEXT0 ; end
 beq batchWINDOW08
 cpy #batCANC0 ; cancel
 beq batchWINDOW09

 cpy #batREFR0 ; v1.0b8
 beq baWINDOW2
* bne baWINDOW4
*
* jsr popupUPDATE
* bra baWINDOW2

baWINDOW4 cpy #batPOPUP
 bne ]lp ; blahblah
 jsr doPOPUP
 bra ]lp

*blahblah cpy #batREFR0 ; refresh list
* beq baWINDOW2
* bne ]lp
* jsr popupUPDATE
* bra ]lp

batchWINDOW07 jsr batchEASTER
 bra ]lp

batchWINDOW08 = *
 jsr batchESCAPE0
 bcs ]lp

batchWINDOW09 = *
 _InitCursor
 PushLong wiBATCH0
 _CloseWindow

* PushWord #batPOPUP
* _DeleteMenu

 ldy batchBUTTON
 rts

batchBUTTON ds 2

*----------------------------------------
* First modal window:
*----------------------------------------

batchWINDOW1 pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTBATCH1
 PushLong #0
 PushWord #refIsResource
 PushLong #wBATCH1
 PushWord #$800e
 _NewWindow2
 PullLong wiBATCH1

batchWINDOW12 jsr batchENTRY1

]lp pha
 pha
 PushLong #taskREC
 PushLong #0
 PushLong #0
 PushLong #-1
 PushWord #%11000000_00011000
 _DoModalWindow
 ply
 sty batchBUTTON
 plx
 cpy #batBACK1
 beq batchWINDOW17
 cpy #batNEXT1
 beq batchWINDOW18
 cpy #batCANC1
 beq batchWINDOW19
 cpy #batBROW1
 bne ]lp

 jsr stdOPEN4
 bcs batchWINDOW16 ; v1.0b7
 jsr batchPFXIN
batchWINDOW16 bra batchWINDOW12

batchWINDOW17 jsr batchEASTER
 bra ]lp

batchWINDOW18 phy
 jsr batchESCAPE1
 ply

batchWINDOW19 phy
 _InitCursor
 PushLong wiBATCH1
 _CloseWindow
 ply
 rts

*----------------------------------------
* Disk copy: modal window
*----------------------------------------

batchDISK pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTDISK
 PushLong #0
 PushWord #refIsResource
 PushLong #wDISK
 PushWord #$800e
 _NewWindow2
 PullLong wiDISK

batchDISK12 = * ; jsr diskENTRY1

]lp pha
 pha
 PushLong #taskREC
 PushLong #0
 PushLong #0
 PushLong #-1
 PushWord #%11000000_00011000
 _DoModalWindow
 ply
 sty batchBUTTON
 plx
 cpy #dcBACK
 beq batchDISK19
 cpy #dcNEXT
 beq batchDISK19
 cpy #dcCANC
 beq batchDISK19
 cpy #dcTEST
 bne ]lp

 jsr doBATCH
 bra batchDISK12

batchDISK19 phy
 _InitCursor
 PushLong wiDISK
 _CloseWindow
 ply
 rts


*----------------------------------------
* Second modal window: destination folder
*----------------------------------------

batchWINDOW2 pha
 pha
 PushLong #0
 PushLong #1
 PushLong #PAINTBATCH2
 PushLong #0
 PushWord #refIsResource
 PushLong #wBATCH2
 PushWord #$800e
 _NewWindow2
 PullLong wiBATCH2

batchWINDOW22 jsr batchENTRY2

]lp pha
 pha
 PushLong #taskREC
 PushLong #0
 PushLong #0
 PushLong #-1
 PushWord #%11000000_00011000
 _DoModalWindow
 ply
 sty batchBUTTON
 plx
 cpy #batNEXT2
 beq batchWINDOW28
 cpy #batCANC2
 beq batchWINDOW29
 cpy #batBACK2
 beq batchWINDOW29
 cpy #batBROW2
 bne ]lp

 jsr stdSAVE2
* bcs batchWINDOW27 ; v1.0b7
 jsr batchPFXIN
batchWINDOW27 bra batchWINDOW22

batchWINDOW28 phy
 jsr batchESCAPE2
 ply

batchWINDOW29 phy
 _InitCursor
 PushLong wiBATCH2
 _CloseWindow
 ply
 rts

*--------------

PAINTBATCH0 PushLong wiBATCH0
 _DrawControls
 rtl

PAINTBATCH1 PushLong wiBATCH1
 _DrawControls
 rtl

PAINTBATCH2 PushLong wiBATCH2
 _DrawControls
 rtl

PAINTDISK PushLong wiDISK
 _DrawControls
 rtl

*--------------

wiBATCH0 ds 4
wiBATCH1 ds 4
wiBATCH2 ds 4
wiDISK ds 4

*--------------

doBATCH sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20
 rts

*--------------

batchESCAPE0 = *
 lda thePOPUP
 cmp #welcomeITEM
 bne batchESC01

 pha  ; no device selected
 PushWord #4 ; same player, shoot again
 PushLong #0
 PushLong #alertDEVICE
 _AlertWindow
 pla
 sec
 rts

batchESC01 jsr getPOPUP

* PushLong popctlHA
* _HLock

* copy the device name until a '(' is found

 sep #$20
 ldy #1
]lp lda [popctlPTR],y
 cmp #' '
 beq batchESC02
 sta menuNAME2,y
 iny
 cpy #126 ; maxLength
 bcc ]lp

 sec  ; for further error handling
 rts

batchESC02 dey ; length found
 sty menuNAME

 rep #$20

* now loop through the devices
* to find the right device

* stz theDEVICE

 lda #1 ; start with device 1
 sta proDIopen+2

]lp jsl proDOS ; get device info
 dw $202C
 adrl proDIopen
 bcc batchESC04
 cmp #$0011 ; no more devices
 beq batchESC09

batchESC03 inc proDIopen+2
 bra ]lp

batchESC04 ldy devNAMEopen ; compare length
 cpy menuNAME
 bne batchESC03

]lp lda devNAMEopen,y
 cmp menuNAME,y
 bne batchESC03
 dey
 bne ]lp

batchESC09 clc
 rts

* lda proDIopen+2
* sta theDEVICE

* this is the end, we have it or not

*batchESC09 PushLong popctlHA
* _HUnlock
* PushLong popctlHA
* _DisposeHandle
* rts

*--------------

batchENTRY1 PushLong wiBATCH1
 PushLong #batPATH1
 PushLong #batVPATH1
 _SetLETextByID
 rts

batchESCAPE1 PushLong wiBATCH1
 PushLong #batPATH1
 PushLong #batVPATH1
 _GetLETextByID
 rts

batchEASTER PushLong wiBATCH1
 PushLong #batPATH1
 PushLong #batEASTER
 _SetLETextByID
 rts

*--------------

batchENTRY2 PushLong wiBATCH2
 PushLong #batPATH2
 PushLong #batVPATH2
 _SetLETextByID
 rts

batchESCAPE2 PushLong wiBATCH2
 PushLong #batPATH2
 PushLong #batVPATH2
 _GetLETextByID
 rts

*--------------

batchPFXIN lda pfxOPEN2 ; copy length
 sta batVPATH1
 lda pfxSAVE2
 sta batVPATH2

 ldx #256-2 ; copy string
]lp lda pfxOPEN3,x
 sta batVPATH1+1,x
 lda pfxSAVE3,x
 sta batVPATH2+1,x
 dex
 dex
 bpl ]lp
 rts

batchPFXOUT lda batVPATH1 ; copy length
 and #$00ff
 sta pfxOPEN2
 lda batVPATH2
 and #$00ff
 sta pfxSAVE2

 ldx #256-2 ; copy string
]lp lda batVPATH1+1,x
 sta pfxOPEN3,x
 lda batVPATH2+1,x
 sta pfxSAVE3,x
 dex
 dex
 bpl ]lp

 rts

*--------------

checkPFXOUT = *
 lda pfxSAVE2 ; length is null
 beq checkPFXOUTerr
 cmp #1 ; length is only one char
 beq checkPFXOUTerr

 sep #$20 ; it does not begin with :
 lda pfxSAVE3
 cmp #':'
 bne checkPFXOUTerr

 rep #$20

 jsr GSOScheckPFXsave
 bcs checkPFXOUTerr

 clc
 rts

checkPFXOUTerr = *
 rep #$20

 PushWord #0 ; Bad prefix
 PushWord #5 ; flags
 PushLong #0
 PushLong #alertPATH ; reference of alert
 _AlertWindow
 pla
 sec
 rts

*--------------

batVPATH0 ds 262
batVPATH1 ds 262
batVPATH2 ds 262

*--------------

batEASTER str 'Antoine says : Great! You have found the hidden message'
