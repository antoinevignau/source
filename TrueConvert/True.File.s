*----------------------------------------
* TrueConvert : Standard File
*----------------------------------------

ButtonItem = $0a
StatText = $0f
EditLine = $11
UserItem = $14
ItemDisable = $8000

*--------------

stdOPEN jsr GSOSsetOPEN

 PushWord #120
 PushWord #43
 PushWord #refIsResource
 PushLong #loadSTR
 PushLong #0
 PushLong #fileLIST
 PushLong #replyPTR
 _SFGetFile2

 jsr GSOSgetOPEN

 lda replyPTR
 bne stdOPEN1
 sec
 rts
stdOPEN1 clc
 rts

*----------------------------------- Standard save

stdSAVE jsr GSOSsetSAVE

 PushWord #160
 PushWord #40
 PushWord #refIsResource
 PushLong #saveSTR
 PushWord #0
 PushLong #namePTR1
 PushLong #replyPTR
 _SFPutFile2

 jsr GSOSgetSAVE

 lda replyPTR
 bne stdSAVE1
 sec
 rts
stdSAVE1 clc
 rts

*--------------

stdOPEN2 jsr GSOSsetOPEN

 lda #replyPTR
 stal $340
 lda #^replyPTR
 stal $342

 PushWord #120 ; whereX
 PushWord #33 ; whereY
 PushLong #0 ; itemDrawPtr
 PushWord #refIsResource ; promptRefDesc
 PushLong #loadSTR ; promptRef
 PushLong #0 ; filterProcPtr
 PushLong #fileLIST ; typeListPtr
 PushLong #openLIST ; dialogTempPtr
 PushLong #openHOOK ; dialogHookPtr
 PushLong #replyPTR ; replyPtr
 _SFPGetFile2

 jsr GSOSgetOPEN

 lda replyPTR
 bne stdOPEN3
 sec
 rts
stdOPEN3 clc
 rts

*--------------

stdSAVE2 jsr GSOSsetSAVE

 PushWord #160 ; whereX
 PushWord #30 ; whereY
 PushLong #0 ; itemDrawPtr
 PushWord #refIsResource ; promptRefDesc
 PushLong #saveSTR ; promptRef
 PushWord #refIsPointer ; filenameRefDesc
 PushLong #namePTR1 ; filenameRef
 PushLong #saveLIST ; dialogTempPtr
 PushLong #saveHOOK ; dialogHookPtr
 PushLong #replyPTR ; replyPtr
 _SFPPutFile2

 jsr GSOSgetSAVE

 lda replyPTR
 bne stdSAVE3
 sec
 rts
stdSAVE3 clc
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

*getFORMATS lda ptrCODE
* sta Debut
* lda ptrCODE+2
* sta Debut+2
*
* ldy #$130
* ldx #0
*]lp lda [Debut],y
* sta fgFORMATS,x
* iny
* iny
* inx
* inx
* cpx #2*5
* bne ]lp
*
* ldy #$140 ; Last conversion made
* lda [Debut],y
* sta temp
* asl
* tax
* lda fgFORMATS,x
* bne getFORMATS1

getFORMATS ldx #0
]lp lda fgFORMATS,x
 bne getFORMATS0
 inx
 inx
 cpx #2*8
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
 PushWord #206
 _DisableMItem
 PushWord #207
 _DisableMItem
 PushWord #208
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
 PushWord #205
 _EnableMItem
getFORMATS6 lda fgFORMATS+10
 beq getFORMATS7
 PushWord #206
 _EnableMItem
getFORMATS7 lda fgFORMATS+12
 beq getFORMATS8
 PushWord #207
 _EnableMItem
getFORMATS8 lda fgFORMATS+14
 beq getFORMATS9
 PushWord #208
 _EnableMItem

getFORMATS9 PushLong haPOPUPSAVE1
 _DrawOneCtl

 lda fgFORMATS
 ora fgFORMATS+2
 ora fgFORMATS+4
 ora fgFORMATS+6
 ora fgFORMATS+8
 ora fgFORMATS+10
 ora fgFORMATS+12
 ora fgFORMATS+14
 sta fgSAVE
 rts

*--------------

strSAVE str 'Save'
strOPEN str 'Open'
strCLOSE str 'Close'
strNEXT str 'Disk'
strCANCEL str 'Cancel'
strACCEPT str 'Accept'
strFREE str '^0 free of ^1 k.'
strFOLDER str 'New Folder'

openLIST dw 0,0,134,400
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
 dw 61,265,73,375
 dw ButtonItem
 adrl strOPEN
 dw 0,0
 adrl 0

openCLOSE dw 2
 dw 79,265,91,375
 dw ButtonItem
 adrl strCLOSE
 dw 0,0
 adrl 0

openNEXT dw 3
 dw 25,265,37,375
 dw ButtonItem
 adrl strNEXT
 dw 0,0
 adrl 0

openCANCEL dw 4
 dw 97,265,109,375
 dw ButtonItem
 adrl strCANCEL
 dw 0,0
 adrl 0

openSCROLL dw 5
 dw 43,265,55,375
 dw ButtonItem
 adrl strACCEPT
 dw 0,0
 adrl 0

openPATH dw 6
 dw 12,15,24,395
 dw UserItem
 adrl 0
 dw 0,0
 adrl 0

openFILES dw 7
 dw 25,18,107,215
 dw UserItem+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

openPROMPT dw 8
 dw 3,15,12,395
 dw StatText+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

openPOPUP dw 100
 dw 112,18,128,273
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
 dw 112,18,0,0
 adrl $87000000
 dw $0030
 dw $1084
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

saveLIST dw 0,0,140,320
 dw -1
 dw 0,0
 adrl saveSAVE
 adrl saveOPEN
 adrl saveCLOSE
 adrl saveNEXT
 adrl saveCANCEL
 adrl saveSCROLL
 adrl savePATH
 adrl saveFILES
 adrl savePROMPT
 adrl saveFILENAME
 adrl saveFREE
 adrl saveFOLDER
 adrl savePOPUP1
 adrl savePOPUP10
 adrl $00000000

saveSAVE dw 1
 dw 87,204,99,310
 dw ButtonItem
 adrl strSAVE
 dw 0,0
 adrl 0

saveOPEN dw 2
 dw 49,204,61,310
 dw ButtonItem
 adrl strOPEN
 dw 0,0
 adrl 0

saveCLOSE dw 3
 dw 64,204,76,310
 dw ButtonItem
 adrl strCLOSE
 dw 0,0
 adrl 0

saveNEXT dw 4
 dw 15,204,27,310
 dw ButtonItem
 adrl strNEXT
 dw 0,0
 adrl 0

saveCANCEL dw 5
 dw 104,204,116,310
 dw ButtonItem
 adrl strCANCEL
 dw 0,0
 adrl 0

saveSCROLL dw 6
 dw 0,0,0,0
 dw UserItem
 adrl 0
 dw 0,0
 adrl 0

savePATH dw 7
 dw 0,10,12,315
 dw UserItem
 adrl 0
 dw 0,0
 adrl 0

saveFILES dw 8
 dw 26,10,88,170
 dw UserItem+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

savePROMPT dw 9
 dw 88,10,100,200
 dw StatText+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

saveFILENAME dw 10
 dw 100,10,118,194
 dw EditLine+ItemDisable
 adrl 0
 dw 0,0
 adrl 0

saveFREE dw 11
 dw 12,10,22,200
 dw StatText+ItemDisable
 adrl strFREE
 dw 0,0
 adrl 0

saveFOLDER dw 12
 dw 29,204,41,310
 dw ButtonItem
 adrl strFOLDER
 dw 0,0
 adrl 0

savePOPUP1 dw 200
 dw 122,10,138,171
 dw UserItem
 adrl drawPOPUPSAVE
 dw 0,0
 adrl 0

savePOPUP10 dw 300
 dw 122,174,138,251
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
 dw $0030
 dw $1084
 dw $0000
 ds 4
 adrl ctlPOPUPSAVE2
ctlPOPUPSAVE1 dw 201
 ds 2
 ds 2

ctlPOPUPSAVE2 asc '$$Depth: \N200'00
 asc '--    2 colors\N201'00
 asc '--    4 colors\N202'00
 asc '--   16 colors\N203'00
 asc '--  256 colors\N204'00
 asc '-- 3200 colors\N205'00
 asc '--32768 colors\N206'00
 asc '-- High colors\N207'00
 asc '-- True colors\N208'00
 asc '.'

ctlPOPUPSAVE10 dw 10
 adrl 300
 dw 122,174,0,0
 adrl $87000000
 dw $0030
 dw $1084
 dw $0000
 ds 4
 adrl ctlPOPUPSAVE12
ctlPOPUPSAVE11 dw 301
 ds 2
 ds 2

ctlPOPUPSAVE12 asc '$$Format: \N300'00
 asc '-- APF\N301'00
 asc '-- BMP\N302'00
 asc '-- PCX\N303'00
 asc '--TIFF\N304'00
 asc '-- BIN\N305'00
 asc '-- RAW\N306'00
 asc '.'

*--- Formats de sauvegarde

fgFORMATS dw 1,1,1,1,1,1,1,1
fgMODE ds 2

*---

listSUFFIX1 asc 'ABPTBR' ; Suffixes des noms de fichiers
listSUFFIX2 asc 'PMCIIA'
listSUFFIX3 asc 'FPXFNW'

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
 ds 2 ; nameRefDesc
 adrl namePTR ; nameRef
 ds 2 ; pathRefDesc
 adrl pathPTR ; pathRef

namePTR dw 512
namePTR1 ds 510

pathPTR dw 512
pathPTR1 ds 510
