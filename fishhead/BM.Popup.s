*----------------------------------------
* BatchMan : Pop-up device menu
* A major rewrite for v1.0b8
*----------------------------------------

*----------------------------

welcomeITEM = $1741
firstITEM = $1780

popctlHA = $50
popctlPTR = popctlHA
menuPTR = popctlHA+4
menuHA = menuPTR+4

device525 = $0000
device35 = $0003
deviceALL = $ffff

*----------------------------
*
* A contains 5.25 flag (0:5.25, 3:3.5, -1:all)
*

buildPOPUP = *

 sta fgDEVICE

 _WaitCursor

*-----------

 jsr setMENUBAR

 jsr clearPOPUP
 jsr buildVOLmenu

*-----------

 PushWord #0 ; the end
 PushWord #0
 PushWord #batPOPUP
 _CalcMenuSize

 jsr restoreMENUBAR

*-----------

 _InitCursor
 rts

*----------------------------

setMENUBAR = *

 pha
 pha
 _GetMenuBar
 PullLong theMENUBAR

 PushLong #0
 PushLong wiBATCH0
 PushLong #batPOPUP
 _GetCtlHandleFromID
 _SetMenuBar
 rts

*-----------

restoreMENUBAR = *

 PushLong theMENUBAR
 _SetMenuBar
 rts

theMENUBAR ds 4

*----------------------------

clearPOPUP = *

 lda nbVOLUMES
 bne clPOPUP1
 rts

clPOPUP1 lda #0 ; on supprime
 ldx #firstITEM ; tous les menu items
]lp pha
 phx

 phx
 _DeleteMItem  ; do not handle

 plx  ; errors if menu item
 inx  ; does not exist
 pla
 inc
 cmp nbVOLUMES
 bne ]lp

* lda myID ; puis les handles
* ora #$0200
* pha
* _DisposeAll
 rts

*----------------------------

doPOPUP = *

 pha ; Get the current selected Item
 PushLong wiBATCH0
 PushLong #batPOPUP
 _GetCtlValueByID
 pla
 sta thePOPUP
 rts


*----------------------------

getPOPUP = *

 jsr setMENUBAR

 PushLong #0 ; get menu item handle
 PushWord thePOPUP
 _GetMItem
 PullLong popctlPTR

 jsr restoreMENUBAR
 rts

*----------------------------

buildVOLmenu = *

 lda #welcomeITEM
 sta thePOPUP

 lda #firstITEM ; set default values
 sta menuitemID

 lda #1 ; start with device 1
 sta proDIopen+2
 stz nbVOLUMES

*-----------

buildVOL1 jsl proDOS ; get device info
 dw $202C
 adrl proDIopen
 bcc buildVOL3
 cmp #$0011 ; no more devices
 beq buildVOL2
 jmp buildVOL9

buildVOL2 rts

*-----------

buildVOL3 lda proDIopen+8
 and #$0080 ; block device + read allowed
 bne buildVOL4
 jmp buildVOL9 ; no


buildVOL4 lda fgDEVICE ; which devices to check?
 bmi buildVOL44

 lda proDIopen+$14
 cmp fgDEVICE
 beq buildVOL44
 jmp buildVOL9

buildVOL44 lda proDIopen+2
 sta proDSopen+2

 stz volNAMEopen ; assume no disk in drive

 jsl proDOS
 dw $202d
 adrl proDSopen

 lda proDSLopen
 cmp #%00000000_00010000
 beq buildVOL5 ; no disk in drive

 jsl proDOS ; disk in drive
 dw $2008
 adrl proVOLopen

*-----------

buildVOL5 ldx #0 ; get a new handle
 phx
 phx
 phx

 lda devNAMEopen
 clc
 adc volNAMEopen
 adc #3
 sta menuNAME
 inc
 sta volumeLEN

* clc
* adc #16+2 ; add room for menuItemTemplate
 pha ; length

* The handle format
* +00 : the menuItemTemplate
* +16 : the menu name

*-----------

 sep #$20

 ldx #0 ; index for menuNAME
 ldy #0
]lp lda devNAMEopen2,y
 sta menuNAME2,x
 inx
 iny
 cpy devNAMEopen
 bne ]lp

 lda #' '
 sta menuNAME2,x
 inx
 lda #'('
 sta menuNAME2,x
 inx

 lda volNAMEopen
 beq buildVOL6

 ldy #0
]lp lda volNAMEopen2,y
 sta menuNAME2,x
 inx
 iny
 cpy volNAMEopen
 bne ]lp

buildVOL6 lda #')'
 sta menuNAME2,x

 rep #$20

*-----------

 lda myID
* ora #$0200
 pha
 pea $8018
 pea $0000
 pea $0000
 _NewHandle
 PullLong menuHA ; titleREF
* pla
* sta menuHA
* sta menutitleREF
* pla
* sta menuHA+2
* sta menutitleREF+2

*----------- Set the pointer to the menu name

 ldy #2 ; copy pascal string
 lda [menuHA],Y ; to the allocated block
 sta menutitleREF+2
 lda [menuHA]
 sta menutitleREF

* lda menuPTR
* clc
* adc #16 ; size of our menuItemTemplate
* sta menuitemPTR
* lda menuPTR+2
* adc #0
* sta menuitemPTR+2

*----------- Now, move the menuItemTemplate

* PushLong #menuITEM
* PushLong menuPTR
* PushLong #16
* _BlockMove

*----------- Now, move the menu name

 PushLong #menuNAME
 PushLong menutitleREF ; itemPTR
 PushLong volumeLEN
 _BlockMove

*----------- Now, add the menuItem

 PushWord #0 ; reference is by pointer
 PushLong #menuITEM ; HA
 PushWord #$ffff
 PushWord #batPOPUP
 _InsertMItem2

*-----------

ok2 inc nbVOLUMES ; new volume
 inc menuitemID ; next menu ID

buildVOL9 inc proDIopen+2 ; next volume
 jmp buildVOL1

*----------------------------

fgDEVICE dw -1 ; 0, 3 or -1, see above
thePOPUP ds 2 ; selected pop-up menu ID entry
nbVOLUMES ds 2 ; number of devices found
volumeLEN ds 4 ; string length

*---

menuNAME db $00 ; devNAMEopen (volNAMEopen)
menuNAME2 db $00
 ds 126

* menuTemplate is 14 bytes long

menuITEM dw $0000 ; 0
menuitemID dw firstITEM ; 2
 db $00 ; 4
 db $00 ; 5
 dw $0000 ; 6
 dw $0000 ; 8 reference is by pointer
menutitleREF ds 4 ; A..D
