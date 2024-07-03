;...............................................................
;
; FILE : SHOWUTI.S                      ROUTINES UTILITAIRES
;        ---------
;...............................................................
;---------------------------------------------------------------
;
; hexout : display d'une valeur hexa
;
;---------------------------------------------------------------
HexOut         START

               PushLong #0
               pha
               _HexIt
               pla
               sta codes
               pla
               sta codes+2
               PushLong #Codes
               _WriteCString
               rts

Codes          ds 4
               dc i1'0'

               END
;---------------------------------------------------------------
;
; WaitForkey  :
;
;---------------------------------------------------------------
WaitForKey     START

               PushWord #0
               PushWord #0              | echo
               _ReadChar
               pla
               rts

               END
;---------------------------------------------------------------
;
; WaitforClick :
;
;---------------------------------------------------------------
WaitforClick   START
               Using GlobalData

               PushWord #0
               PushWord #$FFFF
               PushLong #EventRecord
               _GetNextEvent
               pla
               lda EventWhat
               cmp #1
               bne WaitForClick
               rts

               END
;---------------------------------------------------------------
;
; deref d'un handle : fixer le block et donne valeur master pointer
;
;---------------------------------------------------------------
Deref          START
               sta 0
               stx 2
               ldy #4
               lda [0],y
               ora #$8000
               sta [0],y
               dey
               dey
               lda [0],y
               tax
               lda [0]
               rts

;--------------------------------------
deref1         ENTRY

               sta 0
               stx 2

               ldy #2
               lda [0],y
               tax
               lda [0]

               rts

               END
;---------------------------------------------------------------
;
; unlock le handle : defixe le block il peut bouger !!!
;
;---------------------------------------------------------------
Unlock         START

               sta 0
               stx 2
               ldy #4
               lda [0],y
               and #$7FFF
               sta [0],y
               rts

               END
;...............................................................
;
;        Hdl_Deref : Deref d'un Handle (SBR)
;
;...............................................................
Hdl_Deref      START
               Using GlobalData
               Using Windowdata

D_Hdl_PPI_Opt  ENTRY
               lda Hdl_PPI_Option
               ldx Hdl_PPI_OPtion+2
               jsr deref
               sta PPI_Option
               stx PPI_Option+2
               rts

D_Hdl_Line     ENTRY
               lda Hdl_Line
               ldx Hdl_Line+2
               jsr deref
               sta Ptr_Line
               stx Ptr_Line+2
               rts

D_Hdl_Shape    ENTRY
               lda Hdl_Shape
               ldx Hdl_Shape+2
               jsr deref
               sta Ptr_Shape
               stx Ptr_Shape+2
               rts

D_Hdl_Pbuffer  ENTRY
               lda Hdl_Pbuffer
               ldx Hdl_Pbuffer+2
               jsr deref
               sta Ptr_Pbuffer
               stx Ptr_Pbuffer+2
               rts

D_Hdl_FIcon    ENTRY
               lda Hdl_FIcon
               ldx Hdl_FIcon+2
               jsr Deref
               sta Ptr_FIcon
               stx Ptr_FIcon+2
               rts

D_Hdl_BIcon    ENTRY
               lda Hdl_BIcon
               ldx Hdl_BIcon+2
               jsr Deref
               sta Ptr_BIcon
               stx Ptr_BIcon+2
               rts

D_Hdl_BitMap   ENTRY
               lda Hdl_BitMap
               ldx Hdl_BitMap+2
               jsr Deref
               sta Ptr_BitMap
               stx Ptr_BitMap+2
               rts

D_Hdl_Fond     ENTRY
               lda Hdl_Fond
               ldx Hdl_Fond+2
               jsr Deref
               sta Ptr_Fond
               stx Ptr_Fond+2
               rts

D_Hdl_Border   ENTRY
               lda Hdl_Border
               ldx Hdl_Border+2
               jsr Deref
               sta Ptr_Border
               stx Ptr_Border+2
               rts

D_Hdl_Graph    ENTRY
               lda Hdl_Graph
               ldx Hdl_Graph+2
               jsr Deref
               sta Ptr_Graph
               stx Ptr_Graph+2
               rts

D_Hdl_Template ENTRY
               lda Hdl_Template
               ldx Hdl_Template+2
               jsr Deref
               sta Ptr_Template
               stx Ptr_Template+2
               rts

D_Hdl_Undo     ENTRY
               lda Hdl_Undo
               ldx Hdl_Undo+2
               jsr Deref
               sta Ptr_Undo
               stx Ptr_Undo+2
               rts

D_Hdl_CCP      ENTRY
               lda Hdl_CCP
               ldx Hdl_CCP+2
               jsr Deref
               sta Ptr_CCP
               stx Ptr_CCP+2
               rts

D_Hdl_Sticker  ENTRY
               lda Hdl_Sticker
               ldx Hdl_Sticker+2
               jsr Deref
               sta Ptr_Sticker
               stx Ptr_Sticker+2
               rts

D_Hdl_IoStk    ENTRY
               lda Hdl_IoStk
               ldx Hdl_IoStk+2
               jsr Deref
               sta Ptr_IoStk
               stx Ptr_IoStk+2
               rts

D_Hdl_BufStick ENTRY
               lda Hdl_BufStick
               ldx Hdl_BufStick+2
               jsr Deref
               sta Ptr_BufStick
               stx Ptr_BufStick+2
               rts

D_Hdl_Upro3    ENTRY
               lda Hdl_Upro3
               ldx Hdl_Upro3+2
               jsr Deref
               sta Ptr_Upro3
               stx Ptr_Upro3+2
               rts

               END
;...............................................................
;
;       Hdl_Unlock : Unlock d'un Handle (SBR)
;
;...............................................................
Hdl_Unlock     START
               Using GlobalData

U_Hdl_PPI_Opt  ENTRY
               lda Hdl_PPI_Option
               ldx Hdl_PPI_OPtion+2
               jsr Unlock
               rts

U_Hdl_Line     ENTRY
               lda Hdl_Line
               ldx Hdl_Line+2
               jsr Unlock
               rts

U_Hdl_Shape    ENTRY
               lda Hdl_Shape
               ldx Hdl_Shape+2
               jsr Unlock
               rts

U_Hdl_Pbuffer  ENTRY
               lda Hdl_Pbuffer
               ldx Hdl_Pbuffer+2
               jsr Unlock
               rts

U_Hdl_FIcon    ENTRY
               lda Hdl_FIcon
               ldx Hdl_FIcon+2
               jsr Unlock
               rts

U_Hdl_BIcon    ENTRY
               lda Hdl_BIcon
               ldx Hdl_BIcon+2
               jsr Unlock
               rts

U_Hdl_BitMap   ENTRY
               lda Hdl_BitMap
               ldx Hdl_BitMap+2
               jsr Unlock
               rts

U_Hdl_Fond     ENTRY
               lda Hdl_Fond
               ldx Hdl_Fond+2
               jsr Unlock
               rts

U_Hdl_Border   ENTRY
               lda Hdl_Border
               ldx Hdl_Border+2
               jsr Unlock
               rts

U_Hdl_Graph    ENTRY
               lda Hdl_Graph
               ldx Hdl_Graph+2
               jsr Unlock
               rts

U_Hdl_Template ENTRY
               lda Hdl_Template
               ldx Hdl_Template+2
               jsr Unlock
               rts

U_Hdl_Undo     ENTRY
               lda Hdl_Undo
               ldx Hdl_Undo+2
               jsr Unlock
               rts

U_Hdl_CCP      ENTRY
               lda Hdl_CCP
               ldx Hdl_CCP+2
               jsr Unlock
               rts

U_Hdl_Sticker  ENTRY
               lda Hdl_Sticker
               ldx Hdl_Sticker+2
               jsr Unlock
               rts

U_Hdl_IoStk    ENTRY
               lda Hdl_IoStk
               ldx Hdl_IoStk+2
               jsr Unlock
               rts

U_Hdl_BufStick ENTRY
               lda Hdl_BufStick
               ldx Hdl_BufStick+2
               jsr Unlock
               rts

U_Hdl_Upro3    ENTRY
               lda Hdl_Upro3
               ldx Hdl_Upro3+2
               jsr Unlock
               rts

               END
;...............................................................
;
;        Alloc des Buffers
;
;...............................................................
Alloc_Buffer   START
               Using GlobalData
;--
Alloc_Pbuffer  ENTRY
               PushLong #0                     |Unpack Into it
               PushLong #512
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Pbuffer
               pla
               sta Hdl_Pbuffer+2

               rts
;--
Alloc_FIcon    ENTRY
               PushLong #0                     |load Bitmap Icon
               PushLong #$7D00
               PushWord MyID
               PushWord #$0010                 |not cross bank
               PushLong #0
               _NewHandle
;              ldx #18
;              jsl ErrorTools
               pla
               sta Hdl_FIcon
               pla
               sta Hdl_FIcon+2

               rts
;--
Alloc_BitMap   ENTRY
               PushLong #0                     |load Bitmap Icon
               PushLong #$7D00
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
;              ldx #18
;              jsl ErrorTools
               pla
               sta Hdl_BitMap
               pla
               sta Hdl_BitMap+2

               rts
;--
Alloc_Border   ENTRY
               PushLong #0                     |Border Frame
               PushLong #$268                  |28 lignes * 22 octets
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Border
               pla
               sta Hdl_Border+2

               rts
;--
Alloc_Template ENTRY
               PushLong #0                     |load Bitmap Icon
               PushLong #$7D00
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Template
               pla
               sta Hdl_Template+2

               rts
;--
Alloc_IoStk    ENTRY
               PushLong #0                     |load 1 sticker
               PushLong #1716
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_IoStk
               pla
               sta Hdl_IoStk+2

               rts

               END
;...............................................................
;
;        DeAlloc des Buffers
;
;...............................................................
DeAlloc_Buffer START
               Using GlobalData
;--
DeAlloc_Pbuffer  ENTRY
               jsr U_Hdl_Pbuffer
               PushLong Hdl_Pbuffer
               _DisposeHandle
               rts
;--
Dealloc_FIcon  ENTRY
               jsr U_Hdl_FIcon
               PushLong Hdl_FIcon
               _DisposeHandle
               rts
;--
Dealloc_BitMap ENTRY
               jsr U_Hdl_BitMap
               PushLong Hdl_BitMap
               _DisposeHandle
               rts
;--
Dealloc_Border ENTRY
               jsr U_Hdl_Border
               PushLong Hdl_Border
               _DisposeHandle
               rts
;--
Dealloc_Template ENTRY
               jsr U_Hdl_Template
               PushLong Hdl_Template
               _DisposeHandle
               rts
;--
Dealloc_IoStk  ENTRY
               jsr U_Hdl_IoStk
               PushLong Hdl_IoStk
               _DisposeHandle
               rts

               END
;---------------------------------------------------------------
;
; PaintPixel : move bitmap avec PPtoPort
;
;---------------------------------------------------------------
PaintPixel     START
               Using globalData
;-------
               sta temphdle             |Hdle du Buffer
               stx temphdle+2
               jsr deref
               sta aPicPtr
               stx aPicPtr+2

               PushLong #aLocInfo              |ptr param block dest
               PushLong #aSrcRect              |source rect
               PushWord destX                  |destX
               PushWord destY                  |destY
               PushWord #0                     |mode
               _PPToPort

               lda temphdle
               ldx temphdle+2
               jsr unlock

               rts
;-------
PaintPixelF    ENTRY
               sta temphdle             |Hdle du Buffer
               stx temphdle+2
               jsr deref
               sta aPicPtr
               stx aPicPtr+2

               PushLong #aLocInfo              |ptr param block dest
               PushLong #FullRect              |source rect
               PushWord destX                  |destX
               PushWord destY                  |destY
               PushWord #0                     |mode
               _PPToPort

               lda temphdle
               ldx temphdle+2
               jsr unlock

               rts
;-------
PaintPixelF1   ENTRY
               sta temphdle             |Hdle du Buffer
               stx temphdle+2
               jsr deref
               sta aPicPtr
               stx aPicPtr+2

               PushLong #aLocInfo              |ptr param block dest
               PushLong #FullRect              |source rect
               PushWord destX                  |destX
               PushWord destY                  |destY
               PushWord #0                     |mode
               _PPToPort

               rts
;-------
PaintPixel_2   ENTRY                    |idem mais pas de unlock

               jsr deref
               sta aPicPtr
               stx aPicPtr+2

               PushLong #aLocInfo              |ptr param block dest
               PushLong #aSrcRect              |source rect
               PushWord destX                  |destX
               PushWord destY                  |destY
               PushWord #0                     |mode
               _PPToPort

               rts

               END
;...............................................................
;
;        copybuf.s      : affichage d'une shape
;...............................................................
;
;        passage en pile
;                                     octets
;        Mode     :
;                 0 Page   -> Buffer    2
;                 1 Buffer -> Page
;
;        source   :
;                 ptr bitmap            4
;                 ptr rect              4
;
;        destination :
;                 ptr bitmap            4
;--------------------------------------
;        PROGRAMME GENERAL
;--------------------------------------

copybuf        START
               Using copybufData

;
;        data in stack
;
Cptr_bitmapD   gequ 6

Cptr_rectS     gequ Cptr_bitmapD+4
Cptr_bitmapS   gequ Cptr_rectS+4

CMode_Copy     gequ Cptr_bitmapS+4
;--------------------------------------
;-------- init routine ----------------
;--------------------------------------
               phd                      |sauve direct page

               tsc                      |direct page = stack
               tcd
;--------------------------------------
;-------- traitement ------------------
;--------------------------------------
               jsr trt_copy             |on transfert la bitmap
;--------------------------------------
;-------- sortons proprement ----------
;--------------------------------------
               ply                      |par ici le data bank

               lda 2,s                  |adr de retour propre
               sta 16,s
               lda 0,s
               sta 14,s

               tsc                      |ptr de pile sur adr de retour
               clc
               adc #14
               tcs

               tya                      |restaure data bank
               tcd

               rtl

               END
;...............................................................
;
;        trt_copy : affiche de la shape
;
;...............................................................
trt_copy       START
               Using copybufData

               jsr Ccal_var             |calcul des variables de calcul

               jsr Copybyte             |copybuf du clip dans buffer

               rts

               END
;...............................................................
;
;        cal_advar : calcul du debut rect et pointeurs ...
;
;...............................................................
Ccal_var       START
               Using copybufData
;--------------------------------------
;        adr du debut du clip dans l'image
;--------------------------------------
               PushLong #0              |position du ptr source sur
               lda [Cptr_rectS]          |la premiere ligne de la shape
               pha
               PushWord #160
               _Multiply
               pla                      |ret pf
               plx                      |ret pF
               clc
               adc Cptr_bitmapS
               sta Cptr_bitmapS
               lda Cptr_bitmapS+2
               adc #0
               sta Cptr_bitmapS+2

               ldy #Crecty1              |nombre de ligne de la shape
               lda [Cptr_rectS],y
               dec a                    |rect
               sec
               ldy #Crecty0
               sbc [Cptr_rectS],y
               sta Cnb_ligneS
               inc Cnb_ligneS

               ldy #Crectx0              |octet du 1er point
               lda [Cptr_rectS],y
               lsr a
               sta CdoctetS

               ldy #Crectx1              |octet du dernier point
               lda [Cptr_rectS],y
               dec a                    |!!! rect
               lsr a
               sta CfoctetS

               lda CfoctetS              |nombre d'octet par ligne
               sec
               sbc CDoctetS
               inc a
               sta Cnb_octetS

               rts

               END
;...............................................................
;
;        copybyte : copybuf du clip donne
;
;...............................................................
Copybyte       START
               Using copybufData

               stz Cligne

rcopybyte      jsr copy_ligne           |in the buffer

               jsr Cplus_ptr            |bouge les pointeurs

               inc Cligne               |encore une ligne

               lda Cligne               |on arrete ?
               cmp Cnb_ligneS
               bcc rcopybyte

               rts

               END
;...............................................................
;
;        copy_ligne : ligne source in buffer
;
;...............................................................
copy_ligne     START
               Using copybufData

               lda Cnb_octetS           |pour combien d'octets
               sta Cfois

               dec a
               tax                      |in buffer
               ldy CfoctetS             |in bitmap

               sep #$20
               longa off

rcopy_ligne    lda CMode_Copy
               bne Revert

Normal         lda [Cptr_bitmapS],y      |de bitmap
               phy
               txy
               sta [Cptr_bitmapD],y      |vers buffer
               ply
               bra SCopy_Ligne

Revert         phy
               txy
               lda [Cptr_bitmapD],y      |de Buffer
               ply
               sta [Cptr_bitmapS],y      |vers Bitmap

SCopy_Ligne    dey                      |encore
               dex
               dec Cfois
               bne rcopy_ligne

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        plus_ptr : passage a la ligne suivante
;
;...............................................................
Cplus_ptr      START
               Using copybufData

               lda Cptr_bitmapS          |ligne suivante
               clc
               adc #160
               sta Cptr_bitmapS
               lda Cptr_bitmapS+2
               adc #0
               sta Cptr_bitmapS+2

               lda Cptr_bitmapD
               clc
               adc Cnb_octetS
               sta Cptr_bitmapD
               lda Cptr_bitmapD+2
               adc #0
               sta Cptr_bitmapD+2

               rts

               END
;...............................................................
;
;        Shape Data
;
;...............................................................
copybufData    DATA

Crecty0        equ 0                   |struct rect
Crectx0        equ Crecty0+2
Crecty1        equ Crectx0+2
Crectx1        equ Crecty1+2

Cnb_ligneS     ds 2                     |nombre de ligne shape source
Cnb_octetS     ds 2                     |..........octet.............
CdoctetS       ds 2                     |octet du 1er point
CfoctetS       ds 2                     |octet du dernier point

Cfois          ds 2                     |un compteur
Cligne         ds 2

               END
;...............................................................
;
;        Pad_Coord : Calcul
;
;...............................................................
Pad_Coord      START

               Phx

               PushLong #0
               Pha                      |Numerateur
               phx                      |Denominateur
               _UDivide
               pla                      |Quotient
               plx                      |Reste

               plx
               PushLong #0
               pha
               phx
               _Multiply
               pla
               plx

               rts

               END
;...............................................................
;
;        Eff_BitMap : si bitmap alors L'EFFACER
;
;...............................................................
Eff_BitMap     START
               Using GlobalData

               phb
               phk
               plb

               lda Frame_Backg          |Test si BitMap
               bmi ok

               plb
               rtl

ok             jsr Dealloc_BitMap       |le libere

               plb
               rtl

               END
;...............................................................
;
;        Eff_Border : si border alors L'EFFACER
;
;...............................................................
Eff_Border     START
               Using GlobalData

               lda Frame_Border         |Test si BitMap
               bne ok
               rts

ok             jsr Dealloc_Border       |le libere

               rts

               END
;...............................................................
;
;        Make_BitMap : creation du handle Buffer BITMAP
;
;...............................................................
Make_BitMap    START
               Using GlobalData

               lda Frame_Backg
               bpl ok
               rts

ok             jsr Alloc_BitMap         |creation du Buffer
               bcc okok
               jsr Alert_CCP            |not enough memory

okok           rts

               END
;...............................................................
;
;        Make_Border : creation du handle Buffer BORDER
;
;...............................................................
Make_Border    START
               Using GlobalData

               lda Frame_Border
               beq ok
               rts

ok             lda #1
               sta Frame_Border
               jsr Alloc_Border         |creation du Buffer

               rts

               END
****************************************************************
*
*  rotation d'un mot  $abcd --> $dcba
*
*  Inputs:     accumulateur
*
*  Outputs:    accumulateur
*
****************************************************************
*
ROT_WORD       START

               pha

               asl a
               asl a
               asl a
               asl a
               xba
               and #$FFF0
               sta revd

               pla
               lsr a
               lsr a
               lsr a
               lsr a
               xba
               and #$0FFF
               ora revd

               rts

revd           ds 2

               END
****************************************************************
*
*  transparence d'un mot sur un fond avec couleur $E
*
*  Inputs:     pile : (octshape / octfond)
*
*  Outputs:    accumulateur
*
****************************************************************
*
TRANSPARENT    START

               stz mask

               pla
               sta adrret

               pla
               sta octfond
               pla
               sta octshape

               lda octshape
               and #mk1
               cmp #co1
               beq s2
               lda #mk1
               ora mask
               sta mask

s2             lda octshape
               and #mk2
               cmp #co2
               beq s3
               lda #mk2
               ora mask
               sta mask

s3             lda octshape
               and #mk3
               cmp #co3
               beq s4
               lda #mk3
               ora mask
               sta mask

s4             lda octshape
               and #mk4
               cmp #co4
               beq s5
               lda #mk4
               ora mask
               sta mask

s5             lda mask
               and octshape
               sta adr+1
               lda mask
               eor #$ffff
               and octfond
adr            ora #$0000
               sta octshape

               lda adrret
               pha

               lda octshape

               rts

;-------- variables ---------------------
mask           ds 2

octfond        ds 2
octshape       ds 2

mk1            equ $F000                ;les masques
mk2            equ $0F00
mk3            equ $00F0
mk4            equ $000F
               
co1            equ $E000                ;couleur transparente
co2            equ $0E00
co3            equ $00E0
co4            equ $000E

adrret         ds 2

               END
