*----------------------------------------
* True Convert : Batch
*----------------------------------------

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

*--------------

meBATCH jsr batchPREFIX
 jsr batchWINDOW1
 cpy #batCANC1
 beq meBATCH1
 jsr batchWINDOW2
 cpy #batBACK2
 beq meBATCH
 cpy #batNEXT2
 beq meBATCH2

meBATCH1 rts

meBATCH2 sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20
 rts

*--------------

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
 plx
 cpy #batBACK1
 beq batchWINDOW17
 cpy #batNEXT1
 beq batchWINDOW18
 cpy #batCANC1
 beq batchWINDOW19
 cpy #batBROW1
 bne ]lp

 jsr stdOPEN
 jsr batchPREFIX
 bra batchWINDOW12

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

*--------------

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
 plx
 cpy #batNEXT2
 beq batchWINDOW28
 cpy #batCANC2
 beq batchWINDOW29
 cpy #batBACK2
 beq batchWINDOW29
 cpy #batBROW2
 bne ]lp

 jsr stdSAVE
 jsr batchPREFIX
 bra batchWINDOW22

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

PAINTBATCH1 PushLong wiBATCH1
 _DrawControls
 rtl

PAINTBATCH2 PushLong wiBATCH2
 _DrawControls
 rtl

*--------------

wiBATCH1 ds 4
wiBATCH2 ds 4

*--------------

doBATCH sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20
 rts

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

batchPREFIX lda pfxOPEN2 ; copy length
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

*--------------

batVPATH1 ds 262
batVPATH2 ds 262

*--------------

batEASTER str 'Antoine says : Great! You have found the hidden message'
