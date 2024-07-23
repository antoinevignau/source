*
* Convert 3200 (GS/OS)
*
* Module: Main
*
* (c) 1996-1997, Brutal Deluxe
*

 lst off
 rel
 dsk Convert.32OO.l

 mx %00

*---------------------------------------
* MACROS
*---------------------------------------

 use 4/Ctl.Macs
 use 4/Event.Macs
 use 4/Int.Macs
 use 4/List.Macs
 use 4/Locator.Macs
 use 4/Mem.Macs
 use 4/Menu.Macs
 use 4/Misc.Macs
 use 4/Std.Macs
 use 4/Util.Macs
 use 4/VGA.Macs
 use 4/Window.Macs

_errCANCEL MAC
 lda #0
 sec
 rts
 <<<

_errFORMAT MAC
 lda #-1
 sec
 rts
 <<<

_errSIZE MAC
 lda #-2
 sec
 rts
 <<<

_errMEMORY MAC
 lda #-3
 sec
 rts
 <<<

_errIO MAC
 lda #-4
 sec
 rts
 <<<

_errCOLORS MAC
 lda #-5
 sec
 rts
 <<<

_errCOMPRESS MAC
 lda #-6
 sec
 rts
 <<<

_errOK MAC
 lda #0
 clc
 rts
 <<<

_errSAMEDIR MAC
 lda #1
 sec
 rts
 <<<

_errEOD MAC
 lda #2
 sec
 rts
 <<<

_errNOCONVERT MAC
 lda #3
 sec
 rts
 <<<

*--- Macros QuickDraw II

_HideCursor MAC
 ldx #$9004
 jsl $e10000
 <<<

_InitCursor MAC
 ldx #$ca04
 jsl $e10000
 <<<

_LocalToGlobal MAC
 ldx #$8404
 jsl $e10000
 <<<

*---------------------------------------
* CONSTANTS
*---------------------------------------

nil = $0
refIsPointer = $0
refIsHandle = $1
refIsResource = $2

ButtonItem = $0a
StatText = $0f
UserItem = $14
ItemDisable = $8000

loadSTR = $1000
saveSTR = $1001

nbBANCS = 11 ; 11 bancs de 64ko

Debut = $00
Arrivee = $04

nbPIC = 12

proDOS = $e100a8

*---------------------------------------
* ENTRY POINT
*---------------------------------------

 phk
 plb

 _TLStartUp
 pha
 _MMStartUp
 pla
 sta myID

*--- Appui sur 'Option'

 ldal $e0c025
 and #%0100_0000
 beq okINIT

* inc vgaSCREEN

*--- Initialisations standard

okINIT sep #$20

 ldal $e0c022
 sta save1
 ldal $e0c029
 sta save2
 ldal $e0c034
 sta save3
 ldal $e0c035
 sta save4

 lda #$f0
 stal $e0c022
 lda #$00
 stal $e0c034

 rep #$20

*--- Verification de la version du systeme

 jsl proDOS
 dw $202a
 adrl proVERSION

 lda proVERSION+2
 and #$0fff
 cmp #$0400
 bcs okINIT1

 PushWord #0
 PushLong #verSTR1
 PushLong #errSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 brl initOFF1

*--- Chargement des outils

okINIT1 PushLong #0
 PushWord myID
 PushWord #refIsResource
 PushLong #refIsHandle
 _StartUpTools
 PullLong SStopREF
 bcc okINIT2

 PushWord #0
 PushLong #tolSTR1
 PushLong #errSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 brl initOFF1

*--- Reservation memoire

okINIT2 tdc
 sta myDP

*--- Lecture du mode de la souris

 pha
 pha
 pha
 _ReadMouse
 pla
 plx
 plx
 and #$00ff
 sta mouseMODE

*---

 jsr initQD
 jsr getSPEED
 jsr TWILIGHToff

 PushLong #0
 PushLong #$8fffff
 PushWord myID
 PushWord #%11000000_00000000
 PushLong #0
 _NewHandle
 _DisposeHandle
 _CompactMem

 pha ; 704ko au total
 pha
 _FreeMem
 pla
 pla
 cmp #nbBANCS ; 11*64ko
 bcs okINIT4

okINIT3 PushWord #0
 PushLong #memSTR1
 PushLong #memSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 brl initOFF1

okINIT4 PushLong #0
 PushLong #$10000
 PushWord myID
 PushWord #%11000000_00011100
 PushLong #0
 _NewHandle
 ldx temp
 phd
 tsc
 tcd
 ldy #0
 lda [3],y
 sta ptrCODE,x
 ldy #2
 lda [3],y
 sta ptrCODE+2,x
 pld
 pla
 pla
 bcs okINIT3
 inx
 inx
 inx
 inx
 stx temp
 cpx #4*nbBANCS
 bne okINIT4

 ldx #0 ; clear screens
 txa
]lp stal $012000,x
 stal $e12000,x
 inx
 inx
 bpl ]lp

 PushWord #0
 PushWord #%11111111_11111111
 PushWord #0
 _FlushEvents
 pla

 brl doCODE

*--- Quitte le programme

initDOWN phk
 plb

initOFF jsr TWILIGHTon

initOFF1 sep #$20

 lda save4
 stal $e0c035
 lda save3
 stal $e0c034
 lda save2
 stal $e0c029
 lda save1
 stal $e0c022

 rep #$20

 ldx #0 ; clear screens
 txa
]lp stal $012000,x
 stal $e12000,x
 inx
 inx
 bpl ]lp

 PushWord #refIsHandle
 PushLong SStopREF
 _ShutDownTools

 PushWord myID
 _DisposeAll

 PushWord myID
 _MMShutDown

 _TLShutDown

 jsl proDOS
 dw $2029
 adrl proQUIT

*---------------------------------------
* CHARGEMENT DES IMAGES
*---------------------------------------

doCODE lda #8
 jsr GSOSgetOPEN ; Recupere les prefixes
 lda #8
 jsr GSOSgetSAVE

*---

 lda #pINTRO ; Image de presentation
 ldx ptrCODE+2
 ldy ptrCODE
 jsr loadFILE

 ldx ptrDOC+2
 ldy ptrDOC
 jsr unPACK

 lda #1
 ldx ptrDOC+2
 ldy ptrDOC
 jsr fadeIN

* lda isVGA
* beq doCODE1

* PushWord #4
* _SSSetShadow

*---

doCODE1 lda #pDOC
 ldx ptrDOC+2
 ldy ptrDOC
 jsr loadFILE

 lda #pDATA1
 ldx ptrDATA1+2
 ldy ptrDATA1
 jsr loadFILE

 lda #pDATA2
 ldx ptrDATA2+2
 ldy ptrDATA2
 jsr loadFILE

*---

 lda #pSPRITE1
 ldx ptrCODE+2
 ldy ptrCODE
 jsr loadFILE

 ldx ptrSPRITE+2
 ldy ptrSPRITE
 jsr unPACK

 lda #pSPRITE2
 ldx ptrCODE+2
 ldy ptrCODE
 jsr loadFILE

 ldx ptrSPRITE+2
 lda ptrSPRITE
 clc
 adc #$8000
 tay
 jsr unPACK

*----

 lda #pDATA3
 ldx ptrCODE+2
 ldy ptrCODE
 jsr loadFILE

 ldx ptrDATA3+2
 lda ptrDATA3
 clc
 adc #$8000
 tay
 jsr unPACK

 lda #pANNEXE
 ldx ptrDATA3+2
 ldy ptrDATA3
 jsr loadFILE

 lda #pCODE
 ldx ptrCODE+2
 ldy ptrCODE
 jsr loadFILE

*---

 lda ptrCODE ; Points to page 1
 clc  ; of your bank
 adc #$0100 ; for returning you infos
 sta Debut
 lda ptrCODE+2
 adc #0
 sta Debut+2

 ldx #0 ; All the bank addresses
 txy
]lp lda ptrCODE+2,x
 xba
 sta [Debut],y
 inx
 inx
 inx
 inx
 iny
 iny
 cpy #2*10
 bne ]lp

 ldy #$0020 ; Pointer to Quit routine
 lda #initDOWN
 sta [Debut],y
 iny
 iny
 lda #^initDOWN
 sta [Debut],y

 ldy #$0030 ; Beware of the EOR
 lda fgSPEED ; 1: accelerated GS
 eor #1 ; 0: non-accelerated GS
 sta [Debut],y

*---

 lda ptrCODE
 sta doCODE2+1
 lda ptrCODE+1
 clc
 adc #$0002 ; page 2
 sta doCODE2+2

 lda #^jumpTABLE
 xba
 tax
 ldy #jumpTABLE
doCODE2 jsl $012200 ; saut a ton code
 brl initOFF

*--- Routine d'entree Titi/Toinet

jumpTABLE phb
 phk
 plb
 jsr (jumpTABLE1,x)
 plb
 rtl

jumpTABLE1 da stdOPEN
 da stdSAVE
 da theSELCOLT
 da thePALETTE
 da theWINDOW
 da convertALL
 da convertALL10
 da convertALL20
 da theSCB

*---

theSELCOLT sty ptrLIGNES
 lda ptrCODE+2
 sta ptrLIGNES+2
 clc
 rts

thePALETTE sty ptrPALETTE
 lda ptrCODE+2
 sta ptrPALETTE+2
 clc
 rts

theSCB sta fgIMAGE256
 sty ptrSCB
 lda ptrCODE+2
 sta ptrSCB+2
 clc
 rts

theWINDOW lda ptrCODE+1
 sta showWINDOW+2
 sty showWINDOW+1
 clc
 rts

showWINDOW jsl $012000 ; Draw The Window Info
 rts

*---------------------------------------
* INITIALISATION QUICKDRAW
*---------------------------------------

initQD _HideMenuBar
 _HideCursor

 PushWord #0
 _SetMouse

 pha
 pha
 PushWord #5
 PushLong #$4000000f
 _Desktop
 pla
 pla
 rts

initQD1 PushWord mouseMODE
 _SetMouse
 _InitCursor

 ldx #0
 txa
]lp stal $e19d00,x
 stal $019d00,x
 inx
 inx
 cpx #256*3
 bne ]lp

 ldx #0
]lp lda stdPAL,x
 stal $e19e00,x
 stal $019e00,x
 inx
 inx
 cpx #16*2
 bne ]lp

 rts

*---------------------------------------
* STANDARD CALLS
*---------------------------------------

stdOPEN jsr initQD1
 lda #8
 jsr GSOSsetOPEN

 PushWord #30 ; whereX
 PushWord #35 ; whereY
 PushLong #nil ; itemDrawPtr
 PushWord #refIsResource ; promptRefDesc
 PushLong #loadSTR ; promptRef
 PushLong #nil ; filterProcPtr
 PushLong #fileLIST ; typeListPtr
 PushLong #openLIST ; dialogTempPtr
 PushLong #openHOOK ; dialogHookPtr
 PushLong #replyPTR ; replyPtr
 _SFPGetFile2

 jsr initQD
 lda #8
 jsr GSOSgetOPEN

 lda replyPTR
 bne stdOPEN1
 _errCANCEL

stdOPEN1 lda replyPTR+$12
 pha
 lda replyPTR+$10
 pha
 _DisposeHandle

 jsr GSOSgetname
 jsr GSOSopen
 bcs stdOPEN2

 lda proEOF
 ora proEOF+2
 beq stdOPEN2

 lda ptrBUFFER
 stal $300
 sta proREAD+4
 lda ptrBUFFER+2
 stal $302
 sta proREAD+6

 ldx #$0000
 ldy #$0800
 jsr GSOSread
 bcs stdOPEN2

 ldx #0
 txy
 jsr GSOSappend

 jsr doUNPACKERS
 php
 pha
 jsr GSOSclose
 pla
 plp
 rts

stdOPEN2 jsr GSOSclose
 _errIO

*--- Standard save

stdSAVE jsr initQD1
 lda #8
 jsr GSOSsetSAVE
 jsr GSOSsetname

 PushWord #20 ; whereX
 PushWord #30 ; whereY
 PushLong #nil ; itemDrawPtr
 PushWord #refIsResource ; promptRefDesc
 PushLong #saveSTR ; promptRef
 PushWord #refIsPointer ; filenameRefDesc
 PushLong #nameFILE2 ; filenameRef
 PushLong #saveLIST ; dialogTempPtr
 PushLong #saveHOOK ; dialogHookPtr
 PushLong #replyPTR ; replyPtr
 _SFPPutFile2

 jsr initQD
 lda #8
 jsr GSOSgetSAVE

 jsr getFST

 lda replyPTR
 bne stdSAVE1
 _errCANCEL

stdSAVE1 lda fgSAVE
 bne stdSAVE2
 _errNOCONVERT

stdSAVE2 lda replyPTR+$12
 pha
 lda replyPTR+$10
 pha
 _DisposeHandle

 lda #0
 jsr GSOSsetSAVE
 jsr GSOSgetname
 jsr GSOSsetname
 jsr doPACKERS
 php
 pha
 jsr GSOSclose
 pla
 plp
 rts

*---------------------------------------
* DIALOG HOOKS
*---------------------------------------

*--- Dialog Hook for OPEN

openHOOK phb ; DialogHook
 phk
 plb
 tdc
 sta saveDP
 lda myDP
 tcd
 pla
 sta openHOOK4+1
 pla
 sta openHOOK3+1
 pla
 sta Debut
 pla
 sta Debut+2

 lda [Debut]
 cmp #100
 beq openHOOK1
 bra openHOOK2

openHOOK1 lda #0
 sta [Debut]

 PushLong #mouseLOC
 _GetMouse
 PushLong #mouseLOC
 _LocalToGlobal
 PushWord #0
 PushLong mouseLOC
 PushLong #0
 PushLong haPOPUPOPEN
 _TrackControl
 pla
 beq openHOOK2
 ply
 plx
 pea $0000
 pea $0000
 pea $0000
 phx
 phy
 PushLong #100
 _GetCtlHandleFromID
 _GetCtlValue
 pla
 sta ctlPOPUPOPEN1
 sec
 sbc #100
 sta menuOPEN
 bra openHOOK3

openHOOK2 pla
 pla

openHOOK3 pea $0000
openHOOK4 pea $0000

 lda saveDP
 tcd
 plb
 rtl

*--- Draw PopUp OPEN

drawPOPUPOPEN phb ; DrawPopUp
 phk
 plb
 tdc
 sta saveDP
 lda myDP
 tcd
 pla
 sta drawPOPUPOPEN2+1
 pla
 sta drawPOPUPOPEN1+1
 pla
 plx
 pla
 pea $0000
 pea $0000
 pha
 phx
 pea $0000
 PushLong #ctlPOPUPOPEN
 _NewControl2
 PullLong haPOPUPOPEN
 PushLong haPOPUPOPEN
 _SetMenuBar
 PushLong haPOPUPOPEN
 _DrawOneCtl

drawPOPUPOPEN1 pea $0000
drawPOPUPOPEN2 pea $0000

 lda saveDP
 tcd
 plb
 rtl

*--- Dialog Hook for SAVE

saveHOOK phb ; DialogHook
 phk
 plb
 tdc
 sta saveDP
 lda myDP
 tcd
 pla
 sta saveHOOK6+1
 sta saveHOOK15+1
 pla
 sta saveHOOK5+1
 sta saveHOOK14+1
 pla
 sta Debut
 pla
 sta Debut+2

 lda [Debut]
 cmp #200
 beq saveHOOK1
 cmp #300
 beq saveHOOK0
 brl saveHOOK4
saveHOOK0 brl saveHOOK10

*--- PopUp Colors

saveHOOK1 lda #0 ; MODE
 sta [Debut]

 PushLong #mouseLOC
 _GetMouse
 PushLong #mouseLOC
 _LocalToGlobal
 PushWord #0
 PushLong mouseLOC
 PushLong #0
 PushLong haPOPUPSAVE1
 _TrackControl
 pla
 bne saveHOOK2
 brl saveHOOK4
saveHOOK2 ply
 plx
 pea $0000
 pea $0000
 pea $0000
 phx
 phy
 PushLong #200
 _GetCtlHandleFromID
 _GetCtlValue
 pla
 sta ctlPOPUPSAVE1
 sec
 sbc #200
 sta menuSAVE1
 cmp #5 ; PrintShop ?
 beq saveHOOK3

 PushLong haPOPUPSAVE10 ; non !
 _SetMenuBar
 PushWord #302
 _EnableMItem
 PushWord #303
 _EnableMItem
 PushWord #304
 _EnableMItem
 PushWord #305
 _EnableMItem
 PushLong haPOPUPSAVE10
 _DrawOneCtl
 bra saveHOOK5

saveHOOK3 PushLong haPOPUPSAVE10 ; oui !
 _SetMenuBar
 PushWord #302
 _DisableMItem
 PushWord #303
 _DisableMItem
 PushWord #304
 _DisableMItem
 PushWord #305
 _DisableMItem
 PushLong haPOPUPSAVE10
 _DrawOneCtl
 bra saveHOOK5

saveHOOK4 pla
 pla

saveHOOK5 pea $0000
saveHOOK6 pea $0000

 lda saveDP
 tcd
 plb
 rtl

*--- PopUp Format de sauvegarde

saveHOOK10 lda #0 ; FORMAT
 sta [Debut]

 PushLong #mouseLOC
 _GetMouse
 PushLong #mouseLOC
 _LocalToGlobal
 PushWord #0
 PushLong mouseLOC
 PushLong #0
 PushLong haPOPUPSAVE10
 _TrackControl
 pla
 bne saveHOOK11
 brl saveHOOK13
saveHOOK11 ply
 plx
 pea $0000
 pea $0000
 pea $0000
 phx
 phy
 PushLong #300
 _GetCtlHandleFromID
 _GetCtlValue
 pla
 sta ctlPOPUPSAVE11
 sec
 sbc #300
 sta menuSAVE10

 lda fgFORMATS+8 ; PrintShop available ?
 bne saveHOOK111
 brl saveHOOK14

saveHOOK111 lda menuSAVE10 ; Format GS ?
 cmp #1
 beq saveHOOK12

 PushLong haPOPUPSAVE1
 _SetMenuBar
 PushWord #205
 _DisableMItem
 PushLong haPOPUPSAVE1
 _DrawOneCtl
 bra saveHOOK14

saveHOOK12 PushLong haPOPUPSAVE1
 _SetMenuBar
 PushWord #205
 _EnableMItem
 PushLong haPOPUPSAVE1
 _DrawOneCtl
 bra saveHOOK14

saveHOOK13 pla
 pla

saveHOOK14 pea $0000
saveHOOK15 pea $0000

 lda saveDP
 tcd
 plb
 rtl

*--- Draw PopUp SAVE

drawPOPUPSAVE phb ; DrawPopUp
 phk
 plb
 tdc
 sta saveDP
 lda myDP
 tcd
 pla
 sta drawPOPUPSAVE2+1
 pla
 sta drawPOPUPSAVE1+1
 pla
 plx
 stx ctlTEMP
 pla
 sta ctlTEMP+2
 pea $0000
 pea $0000
 pha
 phx
 pea $0000
 PushLong #ctlPOPUPSAVE
 _NewControl2
 PullLong haPOPUPSAVE1

 jsr getFORMATS

 pea $0000
 pea $0000
 PushLong ctlTEMP
 pea $0000
 PushLong #ctlPOPUPSAVE10
 _NewControl2
 PullLong haPOPUPSAVE10
 PushLong haPOPUPSAVE10
 _SetMenuBar
 PushLong haPOPUPSAVE10
 _DrawOneCtl

drawPOPUPSAVE1 pea $0000
drawPOPUPSAVE2 pea $0000

 lda saveDP
 tcd
 plb
 rtl

*---

getFORMATS lda ptrCODE
 sta Debut
 lda ptrCODE+2
 sta Debut+2

 ldy #$130
 ldx #0
]lp lda [Debut],y
 sta fgFORMATS,x
 iny
 iny
 inx
 inx
 cpx #2*5
 bne ]lp

 ldy #$140 ; Last conversion made
 lda [Debut],y
 sta temp
 asl
 tax
 lda fgFORMATS,x
 bne getFORMATS1

 ldx #0
]lp lda fgFORMATS,x
 bne getFORMATS0
 inx
 inx
 cpx #2*5
 bne ]lp
 ldx #0
getFORMATS0 txa
 lsr
 sta temp

getFORMATS1 lda temp
 inc
 sta menuSAVE1
 clc
 adc #200
 sta ctlPOPUPSAVE1

 PushLong haPOPUPSAVE1
 _SetMenuBar

 PushWord #201 ; None selected
 _DisableMItem
 PushWord #202
 _DisableMItem
 PushWord #203
 _DisableMItem
 PushWord #204
 _DisableMItem
 PushWord #205
 _DisableMItem

 lda fgFORMATS
 beq getFORMATS2
 PushWord #201
 _EnableMItem
getFORMATS2 lda fgFORMATS+2
 beq getFORMATS3
 PushWord #202
 _EnableMItem
getFORMATS3 lda fgFORMATS+4
 beq getFORMATS4
 PushWord #203
 _EnableMItem
getFORMATS4 lda fgFORMATS+6
 beq getFORMATS5
 PushWord #204
 _EnableMItem
getFORMATS5 lda fgFORMATS+8
 beq getFORMATS6
 lda menuSAVE10
 cmp #1
 bne getFORMATS6
 PushWord #205
 _EnableMItem

getFORMATS6 PushLong haPOPUPSAVE1
 _DrawOneCtl

 lda fgFORMATS
 ora fgFORMATS+2
 ora fgFORMATS+4
 ora fgFORMATS+6
 ora fgFORMATS+8
 sta fgSAVE
 rts

*---------------------------------------
* CONVERT ALL
*---------------------------------------

convertALL cpy #0
 bne convertALL5

 jsr testPFXS ; Teste les prefixes
 bcc convertALL1
 rts

convertALL1 jsr initCONVERT
 bcc convertALL2
 rts

convertALL2 lda #pfxOPEN2
 sta proOPEN+4
 lda #^pfxOPEN2
 sta proOPEN+6

 jsr GSOSopen ; Open Current Prefix 8

 lda proOPEN+2
 sta proGETDIR+2

 lda #1
 sta fgALL
 _errOK

convertALL5 stz proCLOSE+2
 jsr GSOSclose

 stz nameFILE2

 stz fgSAVE
 stz fgMODE
 stz fgALL
 _errEOD

*--- Chargement d'une image

convertALL10 lda #0
 jsr GSOSsetOPEN

convertALL11 jsl proDOS ; Donnees du fichier X
 dw $201c ; Auto-incrementation de X
 adrl proGETDIR
 bcs convertALL5

 jsr GSOSgetname
 jsr GSOSopen
 bcs convertALL12

 lda proEOF
 ora proEOF+2
 beq convertALL12

 lda ptrBUFFER
 sta proREAD+4
 lda ptrBUFFER+2
 sta proREAD+6

 ldx #$0000
 ldy #$0800
 jsr GSOSread
 bcs convertALL12

 ldx #0
 txy
 jsr GSOSappend

 jsr doUNPACKERS
 bcs convertALL12
 jsr GSOSclose
 _errOK
convertALL12 jsr GSOSclose
 bra convertALL11

*--- Sauvegarde de la conversion

convertALL20 lda #0
 jsr GSOSsetSAVE

 jsr GSOSgetname
 jsr GSOSsetname
 jsr GSOSsuffix
 jsr GSOSsetname1
 jsr doPACKERS
 php
 pha
 jsr GSOSclose
 pla
 plp
 rts

*--- Teste une conversion NONE IIgs

testIIGS lda menuOPEN ; OPEN GS
 cmp #1
 bne testIIGS1
 lda menuSAVE10 ; SAVE GS
 cmp #1
 bne testIIGS1
 lda fgALL ; CONVERT ALL
 beq testIIGS1
 lda fgMODE ; MODE NONE
 cmp #4
 bne testIIGS1
 sec
 rts
testIIGS1 clc
 rts

*--- Teste les prefixes

testPFXS lda pfxOPEN2
 cmp pfxSAVE2
 beq testPFXS1
 clc
 rts
testPFXS1 dec
 tax
 sep #$20
]lp lda pfxOPEN2+2,x
 cmp pfxSAVE2+2,x
 bne testPFXS2
 dex
 bpl ]lp
 rep #$20
 _errSAMEDIR
testPFXS2 rep #$20
 clc
 rts

*--

initCONVERT lda ptrCODE
 sta Debut
 lda ptrCODE+2
 sta Debut+2

 ldy #$130
 lda [Debut],y
 sta fgMODE
 cmp #4
 beq initCONVERT1
 inc
 sta menuSAVE1

initCONVERT1 lda menuSAVE10 ; Mode NONE
 cmp #1 ; save GS ?
 bne initCONVERT2
 lda menuOPEN
 cmp #1 ; load GS ?
 beq initCONVERT2
 lda fgMODE ; load OTHERS, save GS
 cmp #4 ; but no NONE mode
 bne initCONVERT2
 _errNOCONVERT
initCONVERT2 clc
 rts

*--- Cherche le numero du FST save pour JudgeName

getFST stz proDINFO+2

getFST1 rep #$20
 inc proDINFO+2

 jsl proDOS
 dw $202c
 adrl proDINFO
 bcc getFST2
 cmp #$11
 bne getFST1
 rts
getFST2 jsl proDOS
 dw $2008
 adrl proVOLUME

 sep #$20

 ldx #0
]lp lda pfxVOLUME2+2,x
 cmp pfxSAVE2+2,x
 bne getFST1
 inx
 cpx pfxVOLUME2
 bne ]lp

 rep #$20

 lda proVOLUME+18
 sta proJUDGE+2

 rts

*---------------------------------------
* GS/OS
*---------------------------------------

loadFILE sta proOPEN+4
 sty proREAD+4
 stx proREAD+6

 lda #^pCODE
 sta proOPEN+6

loadFILE1 jsl proDOS
 dw $2010
 adrl proOPEN
 bcs loadERR

 lda proOPEN+2
 sta proREAD+2

 lda proOPEN+42
 sta proREAD+8
 lda proOPEN+44
 sta proREAD+10

 jsl proDOS
 dw $2012
 adrl proREAD
 bcs loadERR

loadFILE2 jsl proDOS
 dw $2014
 adrl proCLOSE
 clc
 rts

loadERR jsr loadFILE2

 PushWord #0
 PushLong #proSTR1
 PushLong #errSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 cmp #1
 bne loadERR1
 brl loadFILE1
loadERR1 jmp initOFF

*---

GSOSerror ldx proERR ; Keep A if no GSOS error
 bne GSOSerror1 ; occured. Useful for
 sec  ; unrecognized formats
 rts
GSOSerror1 lda proERR
 cmp #$48 ; disk full
 beq GSOSerror2
 cmp #$61 ; end of directory
 beq GSOSerror2
 lda #1
 sec
 rts
GSOSerror2 lda #2
 sec
 rts

*---

GSOSsetOPEN sta proSETPFXOPEN+2
 jsl proDOS
 dw $2009
 adrl proSETPFXOPEN
 sta proERR
 rts

GSOSsetSAVE sta proSETPFXSAVE+2
 jsl proDOS
 dw $2009
 adrl proSETPFXSAVE
 sta proERR
 rts

GSOSgetOPEN sta proGETPFXOPEN+2
 jsl proDOS
 dw $200a
 adrl proGETPFXOPEN
 sta proERR
 rts

GSOSgetSAVE sta proGETPFXSAVE+2
 jsl proDOS
 dw $200a
 adrl proGETPFXSAVE
 sta proERR
 rts

*---

GSOSgetname ldy #nameFILE2
 ldx #^nameFILE2

 sty proOPEN+4
 sty proINFO+2
 sty proCREATE+2
 sty proDESTROY+2

 stx proOPEN+6
 stx proINFO+4
 stx proCREATE+4
 stx proDESTROY+4 ; ...pointer

 jsl proDOS
 dw $2006
 adrl proINFO
 sta proERR
 rts

*---

GSOSsetname ldx nameFILE2 ; vire ;1
 cpx #3
 bcc GSOSsetname1
 lda nameFILE2,x
 cmp #';1'
 bne GSOSsetname1
 dex
 dex
 stx nameFILE2

GSOSsetname1 jsl proDOS
 dw $2007
 adrl proJUDGE
 sta proERR
 rts

*--- Add suffix to the name according to the selected format

GSOSsuffix lda menuSAVE10
 cmp #1
 bne GSOSsuffix1
 rts
GSOSsuffix1 ldx nameFILE2
 bne GSOSsuffix2
 rts
GSOSsuffix2 ldy menuSAVE10
 dey
 dey
 sep #$20
 cpx #5
 bcc GSOSsuffix3

 lda nameFILE2-2,x
 cmp #'.'
 bne GSOSsuffix3
 dex
 dex
 dex
 dex
GSOSsuffix3 lda #'.'
 sta nameFILE2+2,x
 lda listSUFFIX1,y
 sta nameFILE2+3,x
 lda listSUFFIX2,y
 sta nameFILE2+4,x
 lda listSUFFIX3,y
 sta nameFILE2+5,x
 rep #$20
 inx
 inx
 inx
 inx
 stx nameFILE2
 rts

*---

GSOSopen jsl proDOS
 dw $2010
 adrl proOPEN
 sta proERR

 lda proOPEN+2
 sta proGETMARK+2
 sta proSETMARK+2
 sta proREAD+2
 sta proCLOSE+2
 rts

*---

GSOSread sty proREAD+8 ; read $XXXXYYYY bytes
 stx proREAD+10

 jsl proDOS
 dw $2012
 adrl proREAD
 sta proERR
 rts

*---

GSOSwrite sty proWRITE+8 ; write $XXXXYYYY bytes
 stx proWRITE+10

 jsl proDOS
 dw $2013
 adrl proWRITE
 sta proERR
 rts

*---

GSOSclose jsl proDOS
 dw $2014
 adrl proCLOSE
 rts

*---

GSOSnewmark sty proSETMARK+6 ; knowing the length of a block
 stx proSETMARK+8 ; set new displacement

 jsl proDOS
 dw $2017
 adrl proGETMARK
 bcc GSOSnewmark1
 sta proERR
 rts

GSOSnewmark1 lda proGETMARK+4
 clc
 adc proSETMARK+6
 tay
 lda proGETMARK+6
 adc proSETMARK+8
 tax

*---

GSOSappend sty proSETMARK+6 ; append $XXXXYYYY bytes
 stx proSETMARK+8

 jsl proDOS
 dw $2016
 adrl proSETMARK
 sta proERR
 rts

*---

GSOSgeteof jsl proDOS
 dw $2019
 adrl proGETEOF
 sta proERR
 ldx proGETEOF+6
 ldy proGETEOF+4
 rts

*---

GSOScreate stx proCREATE+8 ; filetype $00XX
 stx proINFO+8 ; auxtype $YYYY
 sty proCREATE+10
 sty proINFO+10

 jsl proDOS
 dw $2005
 adrl proINFO
 sta proERR

 jsl proDOS
 dw $2002
 adrl proDESTROY
 sta proERR

 jsl proDOS
 dw $2001
 adrl proCREATE
 bcs GSOScreate1

 jsl proDOS
 dw $2010
 adrl proOPEN
 bcs GSOScreate1

 lda proOPEN+2
 sta proSETMARK+2
 sta proGETEOF+2
 sta proWRITE+2
 sta proCLOSE+2
 stz proERR
 rts
GSOScreate1 sta proERR
 rts

*---------------------------------------
* ROUTINES GRAPHIQUES
*---------------------------------------

unPACK sty Arrivee
 stx Arrivee+2

 dey
 sty $0C

 lda ptrCODE
 sta Debut
 lda ptrCODE+2
 sta Debut+2

 lda ptrCODE
 clc
 adc #$4000
 sta $1e
 clc
 adc #$2000
 sta $22
 lda ptrCODE+2
 sta $20
 sta $24

 ldy #$3fff
 lda #0
]lp sta [$1e],y
 dey
 dey
 bpl ]lp

 lda #$0009
 sta L0517+1
 lda #$01FF
 sta L051E+1
 stz $1C
 pea $FFFF

L042C jsr L04E8
 cmp #$0101
 bne L042D
 brl L04A4
L042D cmp #$0100
 beq L0491
 sta $12
 cmp $14
 bcc L0443
 lda $10
 pei $0E
L0443 cmp #$0100
 bcc L0455
 asl
L0449 tay
 lda [$22],Y
 pha
 lda [$1E],Y
 cmp #$0200
 bcs L0449
 lsr
L0455 and #$00FF
 sta $0E
 sta $1A
 ldy #$0000
L045F sta [Arrivee],Y
 iny
 pla
 bpl L045F
 pha
 tya
 clc
 adc Arrivee
 sta Arrivee

 lda $0C
 sec
 sbc Arrivee
 bpl L04A4

 jsr L04D8
 lda $12
 sta $10
 lda $14
 cmp $18
 bcc L048F
 lda L0517+1
 cmp #$000C
 beq L048F
 inc
 sta L0517+1
 asl
 tax
 lda packMASK-$12,X
 sta L051E+1
 asl $18
L048F bra L042C
L0491 jsr L04C1
 jsr L04E8
 sta $10
 sta $1A
 sta $0E
 sta [Arrivee]

 inc Arrivee
 jmp L042C

L04A4 pla
 rts

L04C1 lda #$0009
 sta L0517+1
 lda #$01FF
 sta L051E+1
 lda #$0200
 sta $18
 lda #$0102
 sta $14
 rts

L04D8 lda $14
 asl
 tay
 lda $1A
 sta [$22],Y
 lda $10
 asl
 sta [$1E],Y
 inc $14
 rts

L04E8 lda $1C
 and #$0007
 tax
 lda $1C
 lsr
 lsr
 lsr
 cmp #$03FD
 bcc L0502
 clc
 adc Debut
 sta Debut
 lda Debut+2
 adc #0
 sta Debut+2
 stx $1C
 lda #$0000
L0502 tay
 lda [Debut],Y
 sta $08
 iny
 iny
 lda [Debut],Y
 txy
 beq L0514
L050E lsr
L050F ror $08
 dex
 bne L050E
L0514 lda $1C
 clc
L0517 adc #$FFFF ; $0009 on beginning
 sta $1C
 lda $08
L051E and #$FFFF ; $01FF on beginning
 rts

*--- Fade In

fadeIN sty Debut
 stx Debut+2

 lda #$2000
 sta Arrivee
 lda #$00e1
 sta Arrivee+2

 ldy #$7dfe
]lp lda [Debut],y
 sta [Arrivee],y
 dey
 dey
 bpl ]lp

 lda Debut
 clc
 adc #$7e00
 sta Debut
 lda Debut+2
 adc #0
 sta Debut+2

 lda Arrivee
 clc
 adc #$7e00
 sta Arrivee
 lda Arrivee+2
 adc #0
 sta Arrivee+2

 ldx #$000f
fadeIN2 ldy #$01fe
fadeIN3 lda [Arrivee],y
 and #$000f
 sta temp
 lda [Debut],y
 and #$000f
 cmp temp
 beq fadeIN4
 lda [Arrivee],y
 clc
 adc #$0001
 sta [Arrivee],y
fadeIN4 lda [Arrivee],y
 and #$00f0
 sta temp
 lda [Debut],y
 and #$00f0
 cmp temp
 beq fadeIN5
 lda [Arrivee],y
 clc
 adc #$0010
 sta [Arrivee],y
fadeIN5 lda [Arrivee],y
 and #$0f00
 sta temp
 lda [Debut],y
 and #$0f00
 cmp temp
 beq fadeIN6
 lda [Arrivee],y
 clc
 adc #$0100
 sta [Arrivee],y

fadeIN6 dey
 dey
 bpl fadeIN3
 dex
 bpl fadeIN2
 rts

*---------------------------------------
* SPEED OF THE IIgs
*---------------------------------------

getSPEED sei ; Vitesse GS
 ldal $e0c035
 pha
 and #$ff00
 stal $e0c035

 ldx #0
getSPEED1 lda getSPEED,X
 inx
 inx
 cpx #$0110
 bcc getSPEED1

 ldy #12
 ldal $e0c02b
 and #$0010
 beq getSPEED2
 dey
 dey

getSPEED2 ldx #0
]lp ldal $e0c018
 bmi ]lp
]lp ldal $e0c018
 bpl ]lp
getSPEED3 nop
 nop
getSPEED4 inx
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 ldal $e0c018
 bmi getSPEED3
getSPEED5 inx
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 nop
 ldal $e0c018
 bpl getSPEED5
 dey
 bne getSPEED4

 txa
 lsr
 ldx #0
 txy
]lp cmp parmsSPEED,y
 bcc getSPEED6
 sbc parmsSPEED,y
 inc realSPEED,x
 bra ]lp
getSPEED6 iny
 iny
 inx
 cpy #10
 bne ]lp

 lda realSPEED
 and #$00ff
 bne getSPEED7 ; >=10 mhz

 lda realSPEED+1
 xba
 cmp #$0208 ; >=2.8
 bcs getSPEED7

 inc fgSPEED

getSPEED7 pla
 stal $e0c035
 cli
 rts

*---------------------------------------
* TURNING OFF TWILIGHT II
*---------------------------------------

TWILIGHToff ldal $e11600
 sta Debut
 ldal $e11602
 sta Debut+2

TWILIGHToff1 ldy #8
 lda [Debut],y
 cmp #$49bf
 bne TWILIGHToff2

 ldy #0
 lda [Debut],y
 sta Arrivee
 sta TWILIGHTad
 iny
 iny
 lda [Debut],y
 sta Arrivee+2
 sta TWILIGHTad+2

 ldy #$117a
 lda [Arrivee],y
 cmp #$0ef0
 bne TWILIGHToff2
 lda #$0e80
 sta [Arrivee],y
 inc TWILIGHTfg
 rts

TWILIGHToff2 ldy #16
 lda [Debut],y
 tax
 iny
 iny
 lda [Debut],y
 sta Debut+2
 txa
 sta Debut

 lda Debut
 ora Debut+2
 bne TWILIGHToff1
 rts

TWILIGHTon lda TWILIGHTfg
 bne TWILIGHTon1
 rts
TWILIGHTon1 lda TWILIGHTad
 sta Arrivee
 lda TWILIGHTad+2
 sta Arrivee+2
 ldy #$117a
 lda #$0ef0
 sta [Arrivee],y
 rts

*---------------------------------------
* DATA
*---------------------------------------

*--- Vitesse GS

fgSPEED ds 2
parmsSPEED dw 10000
 dw 1000
 dw 100
 dw 10
 dw 1
realSPEED ds 5

*--- Twilight II

TWILIGHTad ds 4
TWILIGHTfg ds 2

*--- Memoire

SStopREF ds 4

myID ds 2
myDP ds 2
saveDP ds 2

ptrCODE ds 4
ptrDOC ds 4
ptrDATA1 ds 4
ptrDATA2 ds 4
ptrSPRITE ds 4
ptrDATA3 ds 4
ptrPIC16 ds 4
ptrPIC256 ds 4
ptrPIC8BIT ds 4
ptrTRAVAIL ds 4
ptrBUFFER ds 4

ptrLIGNES ds 4
ptrPALETTE ds 4
ptrSCB ds 4

*--- Flags

save1 ds 1
save2 ds 1
save3 ds 1
save4 ds 1

fgLOAD ds 2 ; <>0 if picture loaded
fgSAVE ds 2 ; <>0 if loaded picture saved
fgALL ds 2 ; <>0 if convert all
fgIMAGE256 ds 2

mouseMODE ds 2

*--- Decompression

packMASK dw $01ff
 dw $03ff
 dw $07ff
 dw $0fff
 dw $0000

temp ds 4

*--- Tool locator

memSTR1 str 'Memory allocation error'
memSTR2 str 'Program requires 704kb free'
verSTR1 str 'System 6.x required'
proSTR1 str 'Error while loading file'
tolSTR1 str 'Error while loading tools'
errSTR1 str 'Quit'
errSTR2 str ''

*--- Fichiers de demarrage

pCODE strl '1/Convert.Data/Convert'
pINTRO strl '1/Convert.Data/Intro'
pANNEXE strl '1/Convert.Data/Texte'
pDOC strl '1/Convert.Data/Doc'
pDATA1 strl '1/Convert.Data/Data1'
pDATA2 strl '1/Convert.Data/Data2'
pDATA3 strl '1/Convert.Data/Data3'
pSPRITE1 strl '1/Convert.Data/Sprite1'
pSPRITE2 strl '1/Convert.Data/Sprite2'

*--- Palette standard 320 IIgs

stdPAL dw $0000,$0777,$0841,$072c
 dw $000f,$0080,$0f70,$000d
 dw $0fa9,$0ff0,$00e0,$04df
 dw $0daf,$078f,$0ccc,$0fff

*--- Standard File

strSAVE str 'Save'
strOPEN str 'Open'
strCLOSE str 'Close'
strNEXT str 'Disk'
strCANCEL str 'Cancel'
strACCEPT str 'Accept'
strFREE str '^0 free of ^1 k.'
strFOLDER str 'New Folder'

openLIST dw 0,0,130,260
 dw -1
 dw 0,0
 adrl openOPEN
 adrl openCLOSE
 adrl openNEXT
 adrl openCANCEL
 adrl openSCROLL
 adrl openPATH
 adrl openFILES
 adrl openPROMPT
 adrl openPOPUP
 adrl 0

openOPEN dw 1
 dw 53,160,65,255
 dw ButtonItem
 adrl strOPEN
 dw 0,0
 adrl 0

openCLOSE dw 2
 dw 71,160,83,255
 dw ButtonItem
 adrl strCLOSE
 dw 0,0
 adrl 0

openNEXT dw 3
 dw 27,160,39,255
 dw ButtonItem
 adrl strNEXT
 dw 0,0
 adrl 0

openCANCEL dw 4
 dw 97,160,109,255
 dw ButtonItem
 adrl strCANCEL
 dw 0,0
 adrl 0

openSCROLL dw 5
 dw 118,160,130,255
 dw ButtonItem
 adrl strACCEPT
 dw 0,0
 adrl 0

openPATH dw 6
 dw 14,6,26,256
 dw UserItem
 adrl 0
 dw 0,0
 adrl 0

openFILES dw 7
 dw 27,5,109,140
 dw UserItem+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

openPROMPT dw 8
 dw 3,5,12,255
 dw StatText+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

openPOPUP dw 100
 dw 112,10,128,270
 dw UserItem
 adrl drawPOPUPOPEN
 dw 0,0
 adrl 0

*--- Data pour le PopUp OPEN

mouseLOC ds 4
ctlTEMP ds 4

haPOPUPOPEN ds 4
menuOPEN dw 1 ; Par Defaut

ctlPOPUPOPEN dw 10
 adrl 100
 dw 112,10,0,0
 adrl $87000000
 dw $0040
 dw $1004
 dw $0000
 ds 4
 adrl ctlPOPUPOPEN2
ctlPOPUPOPEN1 dw 101
 ds 2
 ds 2

ctlPOPUPOPEN2 asc '$$Load: \N100'00
 asc '--IIgs Formats\N101'00
 asc '--Windows/OS2 BMP\N102'00
 asc '--Compuserve GIF\N103'00
 asc '--IFF/LBM\N104'00
 asc '--Paintbrush PCX\N105'00
 asc '--TIFF\N106'00
 asc '--Raw Binary PC\N107'00
 asc '--Atari ST Formats\N108'00
 asc '--Windows Icons\N109'00
 asc '--Windows Cursors\N110'00
 asc '--Mac Paint\N111'00
 asc '.'

*---

saveLIST dw 0,0,140,280
 dw -1
 dw 0,0
 adrl saveSAVE
 adrl saveOPEN
 adrl saveCLOSE
 adrl saveNEXT
 adrl saveCANCEL
 adrl L060949
 adrl L060961
 adrl L060979
 adrl L060991
 adrl L0609A9
 adrl saveFREE
 adrl saveFOLDER
 adrl savePOPUP1
 adrl savePOPUP10
 adrl $00000000

saveSAVE dw $0001
 dw $0057
 dw $00BC
 dw $0063
 dw $0111
 dw $000A
 adrl strSAVE
 dw $0000
 dw $0000
 dw $0000
 dw $0000

saveOPEN dw $0002
 dw $0031
 dw $00BC
 dw $003D
 dw $0111
 dw $000A
 adrl strOPEN
 dw $0000
 dw $0000
 dw $0000
 dw $0000

saveCLOSE dw $0003
 dw $0040
 dw $00BC
 dw $004C
 dw $0111
 dw $000A
 adrl strCLOSE
 dw $0000
 dw $0000
 dw $0000
 dw $0000

saveNEXT dw $0004
 dw $000F
 dw $00BC
 dw $001B
 dw $0111
 dw $000A
 adrl strNEXT
 dw $0000
 dw $0000
 dw $0000
 dw $0000

saveCANCEL dw $0005
 dw $0068
 dw $00BC
 dw $0074
 dw $0111
 dw $000A
 adrl strCANCEL
 dw $0000
 dw $0000
 dw $0000
 dw $0000

L060949 dw $0006
 dw $0000
 dw $0000
 dw $0000
 dw $0000
 dw $0014
 adrl $00000000
 dw $0000
 dw $0000
 dw $0000
 dw $0000

L060961 dw $0007
 dw $0000
 dw $000A
 dw $000C
 dw $0116
 dw $0014
 adrl $00000000
 dw $0000
 dw $0000
 dw $0000
 dw $0000

L060979 dw $0008
 dw $001A
 dw $000A
 dw $0058
 dw $009C
 dw $8014
 adrl $00000000
 dw $0000
 dw $0000
 dw $0000
 dw $0000

L060991 dw $0009
 dw $0058
 dw $000A
 dw $0064
 dw $00AC
 dw $800F
 adrl $00000000
 dw $0000
 dw $0000
 dw $0000
 dw $0000

L0609A9 dw $000A
 dw $0064
 dw $000A
 dw $0076
 dw $00AC
 dw $8011
 adrl $00000000
 dw $0000
 dw $0000
 dw $0000
 dw $0000

saveFREE dw $000B
 dw $000E
 dw $000A
 dw $0018
 dw $00B8
 dw $800F
 adrl strFREE
 dw $0000
 dw $0000
 dw $0000
 dw $0000

saveFOLDER dw $000C
 dw $001D
 dw $00BC
 dw $0029
 dw $0111
 dw $000A
 adrl strFOLDER
 dw $0000
 dw $0000
 dw $0000
 dw $0000

savePOPUP1 dw 200
 dw 122,10,138,168
 dw UserItem
 adrl drawPOPUPSAVE
 dw 0,0
 adrl 0

savePOPUP10 dw 300
 dw 122,170,138,248
 dw UserItem
 adrl drawPOPUPSAVE
 dw 0,0
 adrl 0

*--- Data pour le PopUp SAVE

haPOPUPSAVE1 ds 4
haPOPUPSAVE10 ds 4
menuSAVE1 dw 1 ; Par Defaut
menuSAVE10 dw 1 ; Par Defaut

ctlPOPUPSAVE dw 10
 adrl 200
 dw 122,10,0,0
 adrl $87000000
 dw $0040
 dw $1004
 dw $0000
 ds 4
 adrl ctlPOPUPSAVE2
ctlPOPUPSAVE1 dw 201
 ds 2
 ds 2

ctlPOPUPSAVE2 asc '$$ \N200'00
 asc '--3200 colors\N201'00
 asc '--256 colors\N202'00
 asc '--16 colors\N203'00
 asc '--16 greyscales\N204'00
 asc '--PrintShop\N205'00
 asc '.'

ctlPOPUPSAVE10 dw 10
 adrl 300
 dw 122,170,0,0
 adrl $87000000
 dw $0040
 dw $1004
 dw $0000
 ds 4
 adrl ctlPOPUPSAVE12
ctlPOPUPSAVE11 dw 301
 ds 2
 ds 2

ctlPOPUPSAVE12 asc '$$ \N300'00
 asc '--Apple\N301'00
 asc '--BMP\N302'00
 asc '--PCX\N303'00
 asc '--TIFF\N304'00
 asc '--BIN\N305'00
 asc '--RAW\N306'00
 asc '.'

*--- Formats de sauvegarde

fgFORMATS ds 2*5
fgMODE ds 2

*---

listSUFFIX1 asc 'BPTBR' ; Suffixes des noms de fichiers
listSUFFIX2 asc 'MCIIA'
listSUFFIX3 asc 'PXFNW'

fileLIST dw $0006
 dw $8000 ; UNK
 dw $0000
 adrl $0000
 dw $8000 ; TXT
 dw $0004
 adrl $0000
 dw $8000 ; BIN
 dw $0006
 adrl $0000
 dw $8000 ; PNT
 dw $00c0
 adrl $0000
 dw $8000 ; PIC
 dw $00c1
 adrl $0000
 dw $8000 ; USER 1
 dw $00f1
 adrl $0004

replyPTR ds 2 ; good
 ds 2 ; fileType
 ds 4 ; auxType
 dw $0000 ; nameRefDesc
 adrl nameFILE ; nameRef
 dw $0003 ; pathRefDesc
 ds 4 ; pathRef

nameFILE dw 128
nameFILE2 ds 126

*--- GS/Operating System

proERR ds 2

proCREATE dw 7
 ds 4 ; Pathname
 dw $e3 ; AccessCode
 ds 2 ; FileType
 ds 4 ; AuxType
 dw $02 ; Type d'enregistrement
 ds 4 ; Data segment
 ds 4 ; Resource segment

proDESTROY dw 1
 ds 4 ; Pathname

proINFO dw 9
 ds 4 ; Pathname
 dw $e3 ; AccessCode
 ds 2 ; FileType
 ds 4 ; AuxType
 dw $02 ; StorageType
 ds 8 ; CreateTD
 ds 8 ; ModifyTD
 ds 4 ; OptionList
 ds 4 ; EOF

proSETPFXOPEN dw 2
 dw 8 ; PrefixNum
 adrl pfxOPEN2 ; Prefix

proSETPFXSAVE dw 2
 dw 8 ; PrefixNum
 adrl pfxSAVE2 ; Prefix

proGETPFXOPEN dw 2
 dw 8 ; PrefixNum
 adrl pfxOPEN ; Prefix

proGETPFXSAVE dw 2
 dw 8 ; PrefixNum
 adrl pfxSAVE ; Prefix

proOPEN dw 12
 ds 2 ; Id
 adrl pCODE ; Pathname
 ds 2 ; RequestAccess
 ds 2 ; ResourceNum
 ds 2 ; AccessCode
 ds 2 ; FileType
 ds 4 ; AuxType
 ds 2 ; StorageType
 ds 8 ; CreateTD
 ds 8 ; ModifyTD
 ds 4 ; OptionList
proEOF ds 4 ; EOF

proREAD dw 5
 ds 2 ; Id
 ds 4 ; Where
 ds 4 ; Length
 ds 4 ; Read
 ds 2 ; CachePriority

proWRITE dw 5
 ds 2 ; Id
 ds 4 ; Where
 ds 4 ; Length
 ds 4 ; Written
 ds 2 ; CachePriority

proCLOSE dw 1
 ds 2 ; Id

proGETMARK dw 2
 ds 2 ; Id
 ds 4 ; Displacement

proSETMARK dw 3
 ds 2 ; Id
 ds 2 ; Base
 ds 4 ; Displacement

proGETEOF dw 2
 ds 2 ; Id
 ds 4 ; Eof

proGETDIR dw 13
 ds 2 ; ref_num
 ds 2 ; flags
 dw 1 ; base
 dw 1 ; displacement
 adrl nameFILE ; name_buffer
 dw 2 ; entry_num
 dw 2 ; file_type
 adrl 4 ; eof
 ds 4 ; block_count
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 2 ; access
 ds 4 ; aux_type

proVERSION dw 1
 ds 2 ; Version

proQUIT dw 2
 ds 4 ; PathName
 ds 2 ; Flags

proDINFO dw 10
 ds 2 ; DevNum
 adrl pfxINFO ; DevName
 ds 2 ; Characteristics
 ds 4 ; TotalBlocks
 ds 2 ; SlotNum
 ds 2 ; UnitNum
 ds 2 ; Version
 ds 2 ; DeviceIDNum
 ds 2 ; HeadLink
 ds 2 ; ForwardLink

proVOLUME dw 6
 adrl pfxINFO2 ; DevName
 adrl pfxVOLUME ; VolName
 ds 4 ; TotalBlocks
 ds 4 ; FreeBlocks
 ds 2 ; FileSysID
 ds 2 ; BlockSize

proJUDGE dw 6
 ds 2 ; FileSystem
 ds 2 ; NameType
 ds 4 ; NameSyntax
 ds 2 ; MaxLen
 adrl nameFILE ; NameBuffer
 ds 2 ; Flags

*---

 put Conv.Pack

 put Unpack.GS ; 1
 put Unpack.PNT ; .
 put Unpack.PACK ; .
 put Unpack.APF ; .
 put Unpack.DG ; .
 put Unpack.PIC ; .
 put Unpack.APP ; .
 put Unpack.DYA ; .
 put Unpack.BMP ; 2
 put Unpack.GIF ; 3
 put Unpack.IFF ; 4
 put Unpack.PCX ; 5
 put Unpack.TIFF ; 6
 put Unpack.BIN ; 7
 put Unpack.ST ; 8
 put Unpack.ICON ; 9-10 (Icons & Cursors)
 put Unpack.MAC ; 11

 put Pack.PACK
 put Pack.APF ; 1
 put Pack.BMP ; 2
 put Pack.PCX ; 3
 put Pack.TIFF ; 4
 put Pack.BIN ; 5
 put Pack.RAW ; 6

* put VGA.Lib

*----------------------------------------
* TABLES LONGUES EN FIN DE PROGRAMME
*----------------------------------------

*--- Les prefixes

pfxOPEN dw 512
pfxOPEN2 ds 510
pfxSAVE dw 512
pfxSAVE2 ds 510
pfxINFO dw 512
pfxINFO2 ds 510
pfxVOLUME dw 512
pfxVOLUME2 ds 510

*--- Palette

pcPALETTE ds 256*3 ; de l'image source
pcPALETTE1 ds 256*3 ; vers l'image destination

*--- Table temporaire GS & GIF

tempTABLE ds 2048
tempTABLE1 ds 2048

*--- Table de palettes 3200 & de GIF

countLENGTH ds 2

zoneTAMPON ds 4096*2
zoneTAMPON1 ds 4096*2

 hex 0d0d
 asc 'Convert 3200 2.0 (c) Brutal Deluxe'0d
 asc '----------------------------------'0d
 asc 'System & Formats :  Antoine Vignau'0d
 asc 'Conversion       : Olivier Zardini'0d
 hex 0d0d
