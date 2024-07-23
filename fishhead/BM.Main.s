*
* FishHead, the caped copier
*
* (c) 2011-12, Brutal Deluxe Software
*

 lst off
 rel
 dsk Fishhead.l

 mx %00

*----------------------------------- Macros

 use 4/Ctl.Macs
 use 4/Desk.Macs
 use 4/Event.Macs
 use 4/Int.Macs
 use 4/Locator.Macs
 use 4/Mem.Macs
 use 4/Menu.Macs
 use 4/Misc.Macs
 use 4/Print.Macs
 use 4/Qd.Macs
 use 4/QdAux.Macs
 use 4/Resource.Macs
 use 4/Scrap.Macs
 use 4/Std.Macs
 use 4/TextEdit.Macs
 use 4/Util.Macs
 use 4/Window.Macs

*----------------------------------- Constantes

wMAIN = $1000 ;
wLOG = $1100 ;
wABOUT = $1200 ;
wHELP = $1300 ;
wTHERMO = $1600 ;
wBATCH0 = $1700 ;
wBATCH1 = $1800 ;
wBATCH2 = $1900 ;
wDISK = $1A00 ;
wOPTIONS = $1B00 ;
wNIBBLE = $1C00 ;

refIsPointer = $0
refIsHandle = $1
refIsResource = $2

loadSTR = $0001
saveSTR = $0002
folderSTR = $0003

Debut = $00
Arrivee = $04
Second = $08

dpBUF = $10

proDOS = $e100a8

*--------------

icnFILE = $1001
icnDISK = $1002
icnNIBBLE = $1003
icnOPTIONS = $1004
icnHELP = $1005

alertSAME = $0001
alertDEVICE = $0002
alertPATH = $0003
alertREAD = $0004
alertEJECT = $0005

*----------------------------------- Entry point

 phk
 plb

 tdc
 sta myDP

 _TLStartUp
 pha
 _MMStartUp
 pla
 sta appID
 ora #$0100
 sta myID

*--- Version du systeme

 jsr GSOSversion
 bcs okVERS

 pha
 PushLong #verSTR1
 PushLong #verSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 brl meQUIT1

*--- Buffers memoire

okVERS jsr make64KB
 bcc okMEM

 pha
 PushLong #memSTR1
 PushLong #errSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 brl meQUIT1

*--- Chargement des outils

okMEM pha
 pha
 PushWord myID
 PushWord #refIsResource
 PushLong #1
 _StartUpTools
 PullLong SStopREC
 bcc okTOOL

 pha
 PushLong #tolSTR1
 PushLong #errSTR2
 PushLong #errSTR1
 PushLong #errSTR2
 _TLTextMountVolume
 pla
 brl meQUIT

*--- Affichage desktop

okTOOL _InitCursor

 lda #$0003
]lp pha
 pha
 pha

 pha
 pha
 pea $801D
 pea $0000
 pha
 _LoadResource

 phd ; handle to pointer
 tsc
 tcd
 ldy #2
 lda [$03],y
 tax
 lda [$03]
 sta $03
 stx $03+2
 pld
 _NewMenu

 pea $0000 ; insert at front
 _InsertMenu

 pla
 dec
 bne ]lp

 PushLong #0
 _SetMenuBar
 PushWord #1
 _FixAppleMenu
 PushWord #0
 _FixMenuBar
 pla

 _DrawMenuBar

 PushWord #0
 PushWord #%11111111_11111111
 PushWord #0
 _FlushEvents
 pla

*----------------------------------------
* INITIALISATIONS
*----------------------------------------

memOK stz pntHANDLE
 stz pntHANDLE+2

 jsr GSOSgetPFXopen
 jsr GSOSgetPFXsave

*--------------

 jsr loadPREFS

 pha
 pha
 PushLong #0
 PushLong #wMAIN
 PushLong #PAINTMAIN
 PushLong #0
 PushWord #refIsResource
 PushLong #wMAIN
 PushWord #$800e
 _NewWindow2
 PullLong wiMAIN

*----------------------------------------
* TASK MASTER
*----------------------------------------

taskLOOP PushWord #0
 PushWord #0
 PushWord #$c000
 PushWord #0
 _HandleDiskInsert
 pla
 pla

 jsr testWINDOW

 PushWord #0
 PushWord #%11111111_11111111
 PushLong #taskREC
 _TaskMaster
 pla
 beq taskLOOP

 asl
 tax
 jsr (taskTBL,x)

 bra taskLOOP

*----------------------------------- Gestion des menus

doMENU lda taskREC+16
 sec
 sbc #$00fa
 asl
 tax
 jsr (menuTBL,x)

meNOT PushWord #0
 PushWord taskREC+18
 _HiliteMenu

doNOT rts

*----------------------------------- Gestion des controles

doCONTROL ldx #0
]lp lda ctrlOFF,x
 cmp #$ffff
 beq doCONTROL1
 cmp taskREC+38
 bne doCONTROL2
 jsr (ctrlTBL,x)

 lda taskREC+38
 and #$ff00
 cmp #$1000
 bne doCONTROL1

 PushWord #0
 PushLong wiMAIN
 PushLong taskREC+38
 _SetCtlValueByID

doCONTROL1 rts
doCONTROL2 inx
 inx
 bra ]lp

*----------------------------------------
* MENUS
*----------------------------------------

meOPEN jsr stdOPEN2
 bcc meOPEN1
 rts

meOPEN1 lda fgLOAD
 beq meOPEN2

 PushLong haMEM
 _DisposeHandle

 stz fgLOAD

meOPEN2 jsr openSTART
 bcc meOPEN3
 rts

*meOPEN3 jsr trueOPEN
* bcs meOPEN4

meOPEN3 jsr GSOSclose

 lda #1
 sta fgLOAD

 clc
 rts

meOPEN4 _SysBeep

 PushLong haMEM
 _DisposeHandle
 sec
 rts

*-----------------------------------

openSTART = *
*openSTART jsr GSOSgetName
 jsr GSOSopen
 bcs openSTART1

 lda proEOF
 ora proEOF+2
 beq openSTART1

 ldx ptrBUFFER+2
 ldy ptrBUFFER
 jsr GSOSsetread

 ldx #0
 ldy #2048
 jsr GSOSread
 bcs openSTART1

 ldx #0
 txy
 jsr GSOSappend
 clc
 rts
openSTART1 sec
 rts

*----------------------------------- Save

meSAVE lda taskREC+16
 cmp #$105
 beq meSAVE1

 jsr stdSAVE2 ; Save as...
 bcc meSAVE1
 rts

meSAVE1 = *
*meSAVE1 jsr GSOSgetName
* jsr mainCLOSE
 rts

*----------------------------------- Close

meCLOSE pha
 pha
 _FrontWindow
 ply
 sty wiFRONT
 plx
 stx wiFRONT+2

 lda wiFRONT
 ora wiFRONT+2
 bne meCLOSE1
 rts

meCLOSE1 cpy wiABOUT
 bne meCLOSE2
 cpx wiABOUT+2
 bne meCLOSE2

 stz wiABOUT
 stz wiABOUT+2
 bra meCLOSE7

meCLOSE2 cpy wiHELP
 bne meCLOSE3
 cpx wiHELP+2
 bne meCLOSE3

 jsr helpESCAPE

 stz wiHELP
 stz wiHELP+2
 bra meCLOSE7

meCLOSE3 cpy wiLOG
 bne meCLOSE7
 cpx wiLOG+2
 bne meCLOSE7

 stz wiLOG
 stz wiLOG+2

*---

meCLOSE7 PushLong wiFRONT
 _CloseNDAbyWinPtr
 bcc meCLOSE8

 PushLong wiFRONT
 _CloseWindow

meCLOSE8 lda fgLOAD
 beq meCLOSE9

 PushLong haMEM
 _DisposeHandle

meCLOSE9 stz fgLOAD
 rts

*----------------------------------- Quit

meQUIT jsr disposeLOG
 jsr closeLOG

 PushWord #refIsHandle
 PushLong SStopREC
 _ShutDownTools

meQUIT1 PushWord myID
 _DisposeAll

 PushWord appID
 _MMShutDown

 _TLShutDown

 jsl proDOS
 dw $2029
 adrl proQUIT

 brk $f0

*----------------------------------- Clipboard

meCLIP pha
 pha
 PushWord #%10000000_00000000
 PushLong #0
 _ShowClipboard
 pla
 pla
 rts

*----------------------------------------
* TESTE LA FENETRE
*----------------------------------------

testWINDOW pha
 pha
 _FrontWindow
 ply
 sty wiFRONT
 plx
 stx wiFRONT+2

 cpx wiOLD+2
 bne testWINDOW1
 cpy wiOLD
 bne testWINDOW1
 rts

testWINDOW1 sty wiOLD
 stx wiOLD+2

 pha
 phx
 phy
 _GetWKind
 pla
 bmi menuON

 ldx wiFRONT+2
 cpx wiMAIN+2
 bne menuON
 ldy wiFRONT
 cpy wiMAIN
 bne menuON

 jsr menuOFF
 rts

*---

menuON PushWord #$00fa
 _EnableMItem
 PushWord #$00fb
 _EnableMItem
 PushWord #$00fc
 _EnableMItem
 PushWord #$00fd
 _EnableMItem
 PushWord #$00fe
 _EnableMItem
 PushWord #$00ff
 _EnableMItem
 rts

*---

menuOFF PushWord #$00fa
 _DisableMItem
 PushWord #$00fb
 _DisableMItem
 PushWord #$00fc
 _DisableMItem
 PushWord #$00fd
 _DisableMItem
 PushWord #$00fe
 _DisableMItem
 PushWord #$00ff
 _DisableMItem
 rts

*----------------------------------------
* PRINT MANAGER
*----------------------------------------

meSETUP lda pntHANDLE
 ora pntHANDLE+2
 bne meSETUP2

 ldx #0
 ldy #140
 lda myID
 jsr makeHANDLE
 bcc meSETUP1
 rts

meSETUP1 sty pntHANDLE
 stx pntHANDLE+2
 phx
 phy
 _PrDefault

meSETUP2 pha
 PushLong pntHANDLE
 _PrStlDialog
 pla
 rts

*----------------------------------------
* MEMOIRE
*----------------------------------------

makeHANDLE pha
 pha
 phx
 phy
 pha
 PushWord #%00000000_00001000
 PushLong #0
 _NewHandle
 phd
 tsc
 tcd
 lda [3]
 sta ptrADDRESS
 ldy #2
 lda [3],y
 sta ptrADDRESS+2
 pld
 ply
 sty haADDRESS
 plx
 stx haADDRESS+2
 rts

make64KB pha
 pha
 PushLong #$010000
 PushWord myID
 PushWord #%11000000_00011100
 PushLong #0
 _NewHandle
 phd
 tsc
 tcd
 lda [3]
 sta ptrBUFFER
 ldy #2
 lda [3],y
 sta ptrBUFFER+2
 pld
 ply
 sty haBUFFER
 plx
 stx haBUFFER+2
 rts

*----------------------------------------
* FENETRES
*----------------------------------------

PAINTMAIN PushLong wiMAIN
 _DrawControls
 rtl

*----------------------------------------
* DATA
*----------------------------------------

*----------------------- Fenetres

wiFRONT ds 4
wiOLD ds 4

wiMAIN ds 4

*----------------------- Print Manager

pntHANDLE ds 4

*----------------------- Memory manager

appID ds 2
myID ds 2
myDP ds 2
saveDP ds 2

SStopREC ds 4

ptrMEM ds 4
haMEM ds 4

ptrBUFFER ds 4
haBUFFER ds 4

ptrADDRESS ds 4
haADDRESS ds 4

fgLOAD ds 2
fgSAVE ds 2

temp ds 2

*----------------------- Tool locator

verSTR1 str 'System 6.01 Required!'
verSTR2 str 'Press a key to quit'
tolSTR1 str 'Error while loading tools'
memSTR1 str 'Cannot allocate memory'
errSTR1 str 'Quit'
errSTR2 str ''

*----------------------- Window manager

taskREC ds 2 ; wmWhat           +0
taskMESSAGE ds 4 ; wmMessage        +2
taskWHEN ds 4 ; wmWhen           +6
taskWHERE ds 4 ; wmWhere          +10
taskMODIFIERS ds 2 ; wmModifiers      +14
taskDATA ds 4 ; wmTaskData       +16
 adrl $001fffff ; wmTaskMask       +20
 ds 4 ; wmLastClickTick  +24
 ds 2 ; wmClickCount     +28
 ds 4 ; wmTaskData2      +30
 ds 4 ; wmTaskData3      +34
 ds 4 ; wmTaskData4      +38
 ds 4 ; wmLastClickPt    +42

taskTBL da doNOT ; Null
 da doNOT ; mouseDownEvt
 da doNOT ; mouseUpEvt
 da doNOT ; keyDownEvt
 da doNOT
 da doNOT ; autoKeyEvt
 da doNOT ; updateEvt
 da doNOT
 da doNOT ; activateEvt
 da doNOT ; switchEvt
 da doNOT ; deskAccEvt
 da doNOT ; driverEvt
 da doNOT ; app1Evt
 da doNOT ; app2Evt
 da doNOT ; app3Evt
 da doNOT ; app4Evt
 da doNOT ; wInDesk
 da doMENU ; wInMenuBar
 da doNOT ; wCLickCalled
 da doNOT ; wInContent
 da doNOT ; wInDrag
 da doNOT ; wInGrow
 da meCLOSE ; wInGoAway
 da doNOT ; wInZoom
 da doNOT ; wInInfo
 da doMENU ; wInSpecial
 da doNOT ; wInDeskItem
 da doNOT ; wInFrame
 da doNOT ; wInactMenu
 da doNOT ; wInClosedNDA
 da doNOT ; wInCalledSysEdit
 da doNOT ; wInTrackZoom
 da doNOT ; wInHitFrame
 da doCONTROL ; wInControl
 da doNOT ; wInControlMenu

menuTBL da meNOT ; ($0FA) Undo
 da meNOT ; ($0FB) Cut
 da meNOT ; ($0FC) Copy
 da meNOT ; ($0FD) Paste
 da meNOT ; ($0FE) Clear
 da meCLOSE ; ($0FF) Close
 da meABOUT ; ($100) About
 da meHELP ; ($101) Help
 da meSETUP ; ($102) Page Setup
 da meNOT ; ($103) Print
 da meQUIT ; ($104) Quit
 da meCLIP ; ($105) Show Clipboard

ctrlOFF dw $0000
 dw $1001,$1002,$1003
 dw $1004,$1005
 dw $1310,$1320
 dw $1100
 dw $ffff

ctrlTBL da doNOT
 da meBATCH,dcBATCH,doNOT
 da meOPTIONS,meHELP
 da doHELP,doNOT
 da doNOT

*----------------------------------------

 put BM.GSOS
 put BM.Popup

 put BM.Prefs

 put BM.About
 put BM.Batch
 put BM.Options
 put BM.Help
 put BM.Log

 put BM.FC ; File   Copy
* put BM.BC ; Block  Copy
   ; Nibble Copy

 put BM.Thermo

 put BM.File
