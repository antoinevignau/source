*
* True Convert
*
* (c) Brutal Deluxe, 1998
*

               lst       off
               rel
               dsk       TC.l

*----------------------------------- Macros

               use       4/Ctl.Macs
               use       4/Desk.Macs
               use       4/Event.Macs
               use       4/Int.Macs
               use       4/Locator.Macs
               use       4/Mem.Macs
               use       4/Menu.Macs
               use       4/Misc.Macs
               use       4/Print.Macs
               use       4/Qd.Macs
               use       4/Resource.Macs
               use       4/Scrap.Macs
               use       4/Std.Macs
               use       4/TextEdit.Macs
               use       4/Util.Macs
               use       4/Window.Macs

*----------------------------------- Constantes

_errSIZE       MAC
               ldx       #-1
               sec
               rts
               <<<

_errFORMAT     MAC
               ldx       #-2
               sec
               rts
               <<<

*----------------------------------- Constantes

wMAIN          =         $1000
wROTATE        =         $1100
wABOUT         =         $1200
wHELP          =         $1300
wPIC           =         $1400
wINFO          =         $1500
wTHERMO        =         $1600
wRESIZE        =         $1700
wBATCH1        =         $1800
wBATCH2        =         $1900
wCOLORIZE      =         $1A00
wOPTIONS       =         $1B00

refIsPointer   =         $0
refIsHandle    =         $1
refIsResource  =         $2

loadSTR        =         $0001
saveSTR        =         $0002

Debut          =         $00
Arrivee        =         $04
Second         =         $08

dpBUF          =         $10

proDOS         =         $e100a8

*--------------

icnRESIZE      =         $1002
icnCOLORIZE    =         $1003
icnCONVERT     =         $1004
icnSAVE        =         $1005

*--------------

*picWIDTH = $60 ; W - width
*picHEIGHT = $62 ; W - height
*picBPP = $64 ; W - bits per pixel
*picBWIDTH = $66 ; W - real width
*picCOL = $68 ; W - # colors
*picHA = $6A ; L - handle
*picPTR = $6E ; L - pointer
*picLENGTH = $72 ; L - size
*picPAL = $76 ; L - palette

*----------------------------------- Entry point

               phk
               plb

               tdc
               sta       myDP

               _TLStartUp
               pha
               _MMStartUp
               pla
               sta       myID

*--- Version du systeme

               jsr       GSOSversion
               bcs       okVERS

               pha
               PushLong  #verSTR1
               PushLong  #verSTR2
               PushLong  #errSTR1
               PushLong  #errSTR2
               _TLTextMountVolume
               pla
               brl       meQUIT1

*--- Buffers memoire

okVERS         jsr       make64KB
               bcc       okMEM

               pha
               PushLong  #memSTR1
               PushLong  #errSTR2
               PushLong  #errSTR1
               PushLong  #errSTR2
               _TLTextMountVolume
               pla
               brl       meQUIT1

*--- Chargement des outils

okMEM          pha
               pha
               PushWord  myID
               PushWord  #refIsResource
               PushLong  #1
               _StartUpTools
               PullLong  SStopREC
               bcc       okTOOL

               pha
               PushLong  #tolSTR1
               PushLong  #errSTR2
               PushLong  #errSTR1
               PushLong  #errSTR2
               _TLTextMountVolume
               pla
               brl       meQUIT

*--- Affichage desktop

okTOOL         _InitCursor

               lda       #$0005
]lp            pha
               pha
               pha

               pha
               pha
               pea       $801D
               pea       $0000
               pha
               _LoadResource

               phd                            ; handle to pointer
               tsc
               tcd
               ldy       #2
               lda       [$03],y
               tax
               lda       [$03]
               sta       $03
               stx       $05
               pld
               _NewMenu

               pea       $0000                ; insert at front
               _InsertMenu

               pla
               dec
               bne       ]lp

               PushLong  #0
               _SetMenuBar
               PushWord  #1
               _FixAppleMenu
               PushWord  #0
               _FixMenuBar
               pla

               PushWord  #$80                 ; Menu 5 is dimmed
               PushWord  #5
               _SetMenuFlag
               _DrawMenuBar

               PushWord  #0
               PushWord  #%11111111_11111111
               PushWord  #0
               _FlushEvents
               pla

*----------------------------------------

               lda       #proERR
               stal      $320
               lda       #^proERR
               stal      $322

               lda       #GSOSsetread
               stal      $320
               lda       #^GSOSsetread
               stal      $322

*----------------------------------------
* INITIALISATIONS
*----------------------------------------

memOK          stz       pntHANDLE
               stz       pntHANDLE+2

               jsr       GSOSgetOPEN
               jsr       GSOSgetSAVE

*--------------

               pha
               pha
               PushLong  #0
               PushLong  #wMAIN
               PushLong  #PAINTMAIN
               PushLong  #0
               PushWord  #refIsResource
               PushLong  #wMAIN
               PushWord  #$800e
               _NewWindow2
               PullLong  wiMAIN

*----------------------------------------
* TASK MASTER
*----------------------------------------

taskLOOP       PushWord  #0
               PushWord  #0
               PushWord  #$c000
               PushWord  #0
               _HandleDiskInsert
               pla
               pla

               jsr       testWINDOW

               PushWord  #0
               PushWord  #%11111111_11111111
               PushLong  #taskREC
               _TaskMaster
               pla
               beq       taskLOOP

               asl
               tax
               jsr       (taskTBL,x)

               bra       taskLOOP

*----------------------------------- Gestion des menus

doMENU         lda       taskREC+16
               sec
               sbc       #$00fa
               asl
               tax
               jsr       (menuTBL,x)

meNOT          PushWord  #0
               PushWord  taskREC+18
               _HiliteMenu

doNOT          rts

*----------------------------------- Gestion des controles

doCONTROL      ldx       #0
]lp            lda       ctrlOFF,x
               cmp       #$ffff
               beq       doCONTROL1
               cmp       taskREC+38
               bne       doCONTROL2
               jsr       (ctrlTBL,x)

               lda       taskREC+38
               and       #$ff00
               cmp       #$1000
               bne       doCONTROL1

               PushWord  #0
               PushLong  wiMAIN
               PushLong  taskREC+38
               _SetCtlValueByID

doCONTROL1     rts
doCONTROL2     inx
               inx
               bra       ]lp

*----------------------------------------
* MENUS
*----------------------------------------

mePIC          pha
               pha
               PushLong  #0
               PushLong  #wPIC
               PushLong  #0
               PushLong  #0
               PushWord  #refIsResource
               PushLong  #wPIC
               PushWord  #$800e
               _NewWindow2
               PullLong  wiPIC
               rts

*----------------------------------------
* MENUS
*----------------------------------------

meOPEN         jsr       stdOPEN2
               bcc       meOPEN1
               rts

meOPEN1        lda       fgLOAD
               beq       meOPEN2

               PushLong  haMEM
               _DisposeHandle

               stz       fgLOAD

meOPEN2        jsr       openSTART
               bcc       meOPEN3
               rts

meOPEN3        jsr       trueOPEN
               bcs       meOPEN4

               jsr       GSOSclose

               lda       #1
               sta       fgLOAD

               clc
               rts

meOPEN4        _SysBeep

               PushLong  haMEM
               _DisposeHandle
               sec
               rts

*-----------------------------------

openSTART      jsr       GSOSgetName
               jsr       GSOSopen
               bcs       openSTART1

               lda       proEOF
               ora       proEOF+2
               beq       openSTART1

               ldx       ptrBUFFER+2
               ldy       ptrBUFFER
               jsr       GSOSsetread

               ldx       #0
               ldy       #2048
               jsr       GSOSread
               bcs       openSTART1

               ldx       #0
               txy
               jsr       GSOSappend
               clc
               rts
openSTART1     sec
               rts

*----------------------------------- Save

meSAVE         lda       taskREC+16
               cmp       #$105
               beq       meSAVE1

               jsr       stdSAVE2             ; Save as...
               bcc       meSAVE1
               rts

meSAVE1        jsr       GSOSgetName
               jsr       mainCLOSE
               rts

*----------------------------------- Close

meCLOSE        pha
               pha
               _FrontWindow
               ply
               sty       wiFRONT
               plx
               stx       wiFRONT+2

               lda       wiFRONT
               ora       wiFRONT+2
               bne       meCLOSE1
               rts

meCLOSE1       cpy       wiABOUT
               bne       meCLOSE2
               cpx       wiABOUT+2
               bne       meCLOSE2

               stz       wiABOUT
               stz       wiABOUT+2
               bra       meCLOSE7

meCLOSE2       cpy       wiHELP
               bne       meCLOSE3
               cpx       wiHELP+2
               bne       meCLOSE3

               jsr       helpESCAPE

               stz       wiHELP
               stz       wiHELP+2
               bra       meCLOSE7

meCLOSE3       cpy       wiINFO
               bne       meCLOSE7
               cpx       wiINFO+2
               bne       meCLOSE7

               stz       wiINFO
               stz       wiINFO+2

*---

meCLOSE7       PushLong  wiFRONT
               _CloseNDAbyWinPtr
               bcc       meCLOSE8

               PushLong  wiFRONT
               _CloseWindow

meCLOSE8       lda       fgLOAD
               beq       meCLOSE9

               PushLong  haMEM
               _DisposeHandle

meCLOSE9       stz       fgLOAD
               rts

*----------------------------------- Quit

meQUIT         PushWord  #refIsHandle
               PushLong  SStopREC
               _ShutDownTools

meQUIT1        PushWord  myID
               _DisposeAll

               PushWord  myID
               _MMShutDown

               _TLShutDown

               jsl       proDOS
               dw        $2029
               adrl      proQUIT

*----------------------------------- Clipboard

meCLIP         pha
               pha
               PushWord  #%10000000_00000000
               PushLong  #0
               _ShowClipboard
               pla
               pla
               rts

*----------------------------------------
* MISE A JOUR DES ICONES
*----------------------------------------

mainOPEN       PushWord  #0
               PushLong  wiMAIN
               PushLong  #icnCONVERT
               _HiliteCtlByID

               PushLong  #0
               _SetMenuBar

               PushWord  #$010a
               _EnableMItem
               PushWord  #$010b
               _EnableMItem
               PushWord  #$010c
               _EnableMItem

               PushWord  #$ff7f
               PushWord  #5
               _SetMenuFlag
               _DrawMenuBar
               rts

*--------------

mainCLOSE      PushWord  #$ff
               PushLong  wiMAIN
               PushLong  #icnCONVERT
               _HiliteCtlByID

               PushLong  #0
               _SetMenuBar

               PushWord  #$010a
               _DisableMItem
               PushWord  #$010b
               _DisableMItem
               PushWord  #$010c
               _DisableMItem

               PushWord  #$80                 ; Menu 5 is dimmed
               PushWord  #5
               _SetMenuFlag
               _DrawMenuBar
               rts

*----------------------------------------
* TESTE LA FENETRE
*----------------------------------------

testWINDOW     pha
               pha
               _FrontWindow
               ply
               sty       wiFRONT
               plx
               stx       wiFRONT+2

               cpx       wiOLD+2
               bne       testWINDOW1
               cpy       wiOLD
               bne       testWINDOW1
               rts

testWINDOW1    sty       wiOLD
               stx       wiOLD+2

               pha
               phx
               phy
               _GetWKind
               pla
               bmi       menuON

               ldx       wiFRONT+2
               cpx       wiMAIN+2
               bne       menuON
               ldy       wiFRONT
               cpy       wiMAIN
               bne       menuON

               jsr       menuOFF
               rts

*---

menuON         PushWord  #$00fa
               _EnableMItem
               PushWord  #$00fb
               _EnableMItem
               PushWord  #$00fc
               _EnableMItem
               PushWord  #$00fd
               _EnableMItem
               PushWord  #$00fe
               _EnableMItem
               PushWord  #$00ff
               _EnableMItem
               rts

*---

menuOFF        PushWord  #$00fa
               _DisableMItem
               PushWord  #$00fb
               _DisableMItem
               PushWord  #$00fc
               _DisableMItem
               PushWord  #$00fd
               _DisableMItem
               PushWord  #$00fe
               _DisableMItem
               PushWord  #$00ff
               _DisableMItem
               rts

*----------------------------------------
* PRINT MANAGER
*----------------------------------------

meSETUP        lda       pntHANDLE
               ora       pntHANDLE+2
               bne       meSETUP2

               ldx       #0
               ldy       #140
               lda       myID
               jsr       makeHANDLE
               bcc       meSETUP1
               rts

meSETUP1       sty       pntHANDLE
               stx       pntHANDLE+2
               phx
               phy
               _PrDefault

meSETUP2       pha
               PushLong  pntHANDLE
               _PrStlDialog
               pla
               rts

*----------------------------------------
* MEMOIRE
*----------------------------------------

makeHANDLE     pha
               pha
               phx
               phy
               pha
               PushWord  #%00000000_00001000
               PushLong  #0
               _NewHandle
               phd
               tsc
               tcd
               lda       [3]
               sta       ptrADDRESS
               ldy       #2
               lda       [3],y
               sta       ptrADDRESS+2
               pld
               ply
               sty       haADDRESS
               plx
               stx       haADDRESS+2
               rts

make64KB       pha
               pha
               PushLong  #$010000
               PushWord  myID
               PushWord  #%11000000_00011100
               PushLong  #0
               _NewHandle
               phd
               tsc
               tcd
               lda       [3]
               sta       ptrBUFFER
               ldy       #2
               lda       [3],y
               sta       ptrBUFFER+2
               pld
               ply
               sty       haBUFFER
               plx
               stx       haBUFFER+2
               rts

*----------------------------------------
* FENETRES
*----------------------------------------

PAINTMAIN      PushLong  wiMAIN
               _DrawControls
               rtl

*----------------------------------------
* DATA
*----------------------------------------

*----------------------- Fenetres

wiFRONT        ds        4
wiOLD          ds        4

wiMAIN         ds        4
wiPIC          ds        4

*----------------------- Print Manager

pntHANDLE      ds        4

*----------------------- Memory manager

myID           ds        2
myDP           ds        2
saveDP         ds        2

SStopREC       ds        4

ptrMEM         ds        4
haMEM          ds        4

ptrBUFFER      ds        4
haBUFFER       ds        4

ptrADDRESS     ds        4
haADDRESS      ds        4

fgLOAD         ds        2
fgSAVE         ds        2

temp           ds        2

*----------------------- Tool locator

verSTR1        str       'System 6.01 Required!'
verSTR2        str       'Press a key to quit'
tolSTR1        str       'Error while loading tools'
memSTR1        str       'Cannot allocate memory'
errSTR1        str       'Quit'
errSTR2        str       ''

*----------------------- Window manager

taskREC        ds        2                    ; wmWhat           +0
taskMESSAGE    ds        4                    ; wmMessage        +2
taskWHEN       ds        4                    ; wmWhen           +6
taskWHERE      ds        4                    ; wmWhere          +10
taskMODIFIERS  ds        2                    ; wmModifiers      +14
taskDATA       ds        4                    ; wmTaskData       +16
               adrl      $001fffff            ; wmTaskMask       +20
               ds        4                    ; wmLastClickTick  +24
               ds        2                    ; wmClickCount     +28
               ds        4                    ; wmTaskData2      +30
               ds        4                    ; wmTaskData3      +34
               ds        4                    ; wmTaskData4      +38
               ds        4                    ; wmLastClickPt    +42

taskTBL        da        doNOT                ; Null
               da        doNOT                ; mouseDownEvt
               da        doNOT                ; mouseUpEvt
               da        doNOT                ; keyDownEvt
               da        doNOT
               da        doNOT                ; autoKeyEvt
               da        doNOT                ; updateEvt
               da        doNOT
               da        doNOT                ; activateEvt
               da        doNOT                ; switchEvt
               da        doNOT                ; deskAccEvt
               da        doNOT                ; driverEvt
               da        doNOT                ; app1Evt
               da        doNOT                ; app2Evt
               da        doNOT                ; app3Evt
               da        doNOT                ; app4Evt
               da        doNOT                ; wInDesk
               da        doMENU               ; wInMenuBar
               da        doNOT                ; wCLickCalled
               da        doNOT                ; wInContent
               da        doNOT                ; wInDrag
               da        doNOT                ; wInGrow
               da        meCLOSE              ; wInGoAway
               da        doNOT                ; wInZoom
               da        doNOT                ; wInInfo
               da        doMENU               ; wInSpecial
               da        doNOT                ; wInDeskItem
               da        doNOT                ; wInFrame
               da        doNOT                ; wInactMenu
               da        doNOT                ; wInClosedNDA
               da        doNOT                ; wInCalledSysEdit
               da        doNOT                ; wInTrackZoom
               da        doNOT                ; wInHitFrame
               da        doCONTROL            ; wInControl
               da        doNOT                ; wInControlMenu

menuTBL        da        meNOT                ; ($0FA) Annuler
               da        meNOT                ; ($0FB) Couper
               da        meNOT                ; ($0FC) Copier
               da        meNOT                ; ($0FD) Coller
               da        meNOT                ; ($0FE) Effacer
               da        meCLOSE              ; ($0FF) Fermer
               da        meABOUT              ; ($100) About
               da        meHELP               ; ($101) Help
               da        meOPEN               ; ($102) Open
               da        meSAVE               ; ($103) Save
               da        meSAVE               ; ($104) Save as
               da        meBATCH              ; ($105) Batch Process
               da        meSETUP              ; ($106) Page Setup
               da        meNOT                ; ($107) Print
               da        meQUIT               ; ($108) Quit
               da        meCLIP               ; ($109) Show Clipboard
               da        meFLIP               ; ($10A) Flip
               da        meMIRROR             ; ($10B) Mirror
               da        meROTATE             ; ($10C) Rotate
               da        meBORDERS            ; ($10D) Add Borders
               da        meCANVAS             ; ($10E) Canvas Size
               da        meRESIZE             ; ($10F) Resize
               da        meARITHMETIC         ; ($110) Arithmetic
               da        meGREYSCALES         ; ($111) Greyscales
               da        meNEGATIVE           ; ($112) Negative Image
               da        meSOLARIZE           ; ($113) Solarize
               da        mePALEDIT            ; ($114) Edit Palette
               da        mePALLOAD            ; ($115) Load Palette
               da        mePALSAVE            ; ($116) Save Palette
               da        meCOUNT              ; ($117) Count Colors

ctrlOFF        dw        $0000
               dw        $1001,$1002,$1003,$1004,$1005,$1006,$1007
               dw        $1310,$1320
               dw        $ffff

ctrlTBL        da        doNOT
               da        showTHERMO,meRESIZE,meCOLORIZE,meCONVERT
               da        meSAVE,meOPTIONS,meINFO
               da        doHELP,doNOT

*----------------------------------------

proERR         ds        2

picWIDTH       ds        2                    ; W - width
picHEIGHT      ds        2                    ; W - height
picBPP         ds        2                    ; W - bits per pixel
picBWIDTH      ds        2                    ; W - real width
picCOL         ds        2                    ; W - # colors
picHA          ds        4                    ; L - handle
picPTR         ds        4                    ; L - pointer
picLENGTH      ds        4                    ; L - size
picPAL         ds        4                    ; L - palette

*----------------------------------------

               put       True.About
               put       True.Batch
               put       True.Resize
               put       True.Colorize
               put       True.Convert
               put       True.Info
               put       True.Options
               put       True.Help

               put       True.Pack

               put       True.Rotate
               put       True.Palette
               put       True.Count

               put       True.Colors

               put       True.Thermo
               put       True.File
               put       True.GSOS

               put       unpGS
               put       unpBMP
               put       unpGIF
               put       unpIFF
               put       unpPCX
               put       unpTIF
               put       unpBIN
               put       unpST
               put       unpMAC

               put       packGS
               put       packBMP
               put       packPCX
               put       packTIF
               put       packBIN
               put       packRAW

