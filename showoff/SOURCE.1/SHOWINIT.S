;---------------------------------------------------------------
;
; FILE : SHOWINIT.S                - Initialisations de depart -
;        ----------
;
;---------------------------------------------------------------
InitStuff      START
               using GlobalData
               using MenuData
               using Cursors
               using ProdosData
               using SeqEditData

               _TLStartup               |TOOL LOCATOR
;--
               PushWord #0              |MEMORY MANAGER
               _MMStartup
               ldx #1
               jsl ErrorTools
               pla
               sta MyID
;--
               _MTStartup               |MISC TOOLS
               ldx #2
               jsl ErrorTools
;--
LoadAgain1     PushLong #ToolTable1     |Charge les TOOLS
               _LoadTools
               bcc ToolsLoaded1
               cmp #VolNotFound         |probleme ?
               beq domount1
               sec
               ldx #6
               jsl ErrorTools

domount1       jsr MountBootDisk
               cmp #1
               beq LoadAgain1
               sec                      |Adieu Probleme chargement
               rts
;--
ToolsLoaded1   anop
;--
               PushLong #0              | Demande de page ZERO
               PushLong #$0B00          | 11  pages
               PushWord MyID
               PushWord #$C001          | locked, fixed, fixed bank
               PushLong #0
               _NewHandle
               ldx #3
               jsl ErrorTools

               pla                      |stocke ZERO PAGE
               sta 0
               sta ZPHandle
               pla
               sta 2
               sta ZPHandle+2

               lda [0]
               sta 4
;--
               lda 4                    |QUICKDRAW
               pha
               PushWord #ScreenMode
               PushWord #160
               PushWord MyID
               _QDStartup
               ldx #4
               jsl ErrorTools
;--
               _QDAuxStartup            |QUICKDRAW +
               ldx #7
               jsl ErrorTools
;--
               _InitCursor
               _HideCursor
               jsr set_bordure          |bordure ecran NOIRE
               jsr Show_Broder          |page titre 1
;--
LoadAgain      PushLong #ToolTable      |Charge les TOOLS
               _LoadTools
               bcc ToolsLoaded
               cmp #VolNotFound         |probleme ?
               beq domount
               sec
               ldx #6
               jsl ErrorTools

domount        jsr MountBootDisk
               cmp #1
               beq LoadAgain
               sec                      |Adieu Probleme chargement
               rts
;--
ToolsLoaded    anop
;--
               jsr Show_Showoff         |page titre 2
;--
               jsr WaitAMinute
;--
               lda 4                    |EVENT MANAGER
               clc
               adc #$300
               pha
               PushWord #20             |event queue
               PushWord #0
               PushWord #MaxX
               PushWord #0
               PushWord #200
               PushWord MyID
               _EMStartup
               ldx #5
               jsl ErrorTools
;--
;              _ShowCursor
;              _WaitCursor
;--
;              _WaitCursor

               PushWord MyID            |FONT MANAGER
               lda 4
               clc
               adc #$800
               pha
               _FMStartup
               ldx #14
               jsl ErrorTools
;--
;              jsr init_pfx             |localise la directory de  SHOWOFF
;--
               PushLong #ColorTable     |palette standard
               _InitColorTable

               PushWord #0
               PushLong #ColorTable
               _SetColorTable
;--
               PushWord MyID            |WINDOW MANAGER
               _WindStartup
               ldx #8
               jsl ErrorTools

               PushLong #0              |init DeskTop
               _RefreshDesktop

               jsr save_desktopF        |init PLEIN ECRAN

               PushWord MyID            |CONTROL MANAGER
               lda 4
               clc
               adc #$400
               pha
               _CtlStartup
               ldx #9
               jsl ErrorTools

               PushWord MyID            |MENU MANAGER
               lda 4
               clc
               adc #$600
               pha
               _MenuStartup
               ldx #11
               jsl ErrorTools

               PushWord MyID            |LINE EDIT
               lda 4
               clc
               adc #$500
               pha
               _LEStartup
               ldx #10
               jsl ErrorTools

               jsr Save_DeskTopH        |ECRAN - MENUBAR

               PushWord MyID            |DIALOG MANAGER
               _DialogStartup
               ldx #12
               jsl ErrorTools

               PushWord MyID            |STANDARD FILE
               lda 4
               clc
               adc #$700
               pha
               _SFStartup
               ldx #13
               jsl ErrorTools

               _DeskStartup             |DESK MANAGER
               ldx #15
               jsl ErrorTools

               _IMStartup               |INTEGER MATHS
               ldx #16
               jsl ErrorTools

               _TextStartup             |TEXT MANAGER
               ldx #17
               jsl ErrorTools
;--
               jsr Init_hdle            |init des Handles
;--
               jsr setupwindows         |init fenetres

               jsr setupMenus           |init menus

               jsr setupctrl            |init controles

               jsr setupline            |init line edit
;--
               jsr Init_caret           |init taille du >|<

               _InitCursor

               lda #0                   |init JCL
               sta SequenceOn
               sta SeAloueSmOn
               jsr InitWorkMod
               jsr InitBeenMod

               stz PrintOn
               stz PrintRecord
               stz PrintRecord+2
               stz SeScrapOn
;--
               lda #$FFFF
               sta Status_Ecran
               lda #0
               sta Top_Action
               sta Top_ActionG
;--
               clc
               rts

MomentStr      str 'One moment please ....'

               END
;---------------------------------------------------------------
;
; PRESENCE DU DISQUE SYSTEME
;
;---------------------------------------------------------------
MountBootDisk  START
               Using ProdosDATA

               _SetPrefix SetPrefixParams
               _GetPrefix GetPrefixParams

               PushWord #0              | space for result
               PushWord #195            | x pos
               PushWord #30             | y pos
               PushLong #PromptStr      | prompt string
               PushLong #VolStr         | vol string
               PushLong #OKStr
               PushLong #CancelStr
               _TLMountVolume

               pla

               rts
;--
Init_Pfx       ENTRY                    |Directory du load

               _GetPrefix initpfxParams

               rts
;--
Retour_Pfx     ENTRY                    |Retour sur cette directory

               _SetPrefix initpfxParams

               rts

               END

;---------------------------------------------------------------
;
; init_hdle : RESERVATION DE LA PLACE MEMOIRE
;
;---------------------------------------------------------------
init_hdle      START
               Using globaldata
;--
               PushLong #0                     |BITMAP FOND D'IMAGE
               PushLong #$517                  |32000 octets
               PushWord MyID
               PushWord #$C013                 |in bank 00
               PushLong #$7DE0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Upro3
               pla
               sta Hdl_Upro3+2

               jsr D_Hdl_Upro3                 |deref pas bouger
;--
               PushLong #0                     |BITMAP FOND D'IMAGE
               PushLong #$7D00                 |32000 octets
               PushWord MyID
               PushWord #$0010                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Fond
               pla
               sta Hdl_Fond+2

               jsr D_Hdl_Fond                  |le Coince
;--
               PushLong #0                     |Bitmap FENTRE OPTION
               PushLong #4056                  |48 pixels * 169 lignes
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_PPI_Option
               pla
               sta Hdl_PPI_Option+2
;--
               PushLong #0                     |Buffer des LIGNES DE TEXTE
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Line
               pla
               sta Hdl_Line+2
;--
               PushLong #0                     |Buffer des SHAPES GEOMETRIQUES
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Shape
               pla
               sta Hdl_Shape+2
;--
               PushLong #0                     |Buffer des Icons
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_BIcon
               pla
               sta Hdl_BIcon+2
;--
               PushLong #0                     |Buffer des GRAPHS
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Graph
               pla
               sta Hdl_Graph+2
;--
               PushLong #0                     |Buffer des Stickers
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Sticker
               pla
               sta Hdl_Sticker+2
;--
               PushLong #0                     |Buffer du Undo
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Undo
               pla
               sta Hdl_Undo+2
;--
               PushLong #0                     |Buffer du Cut Copy Paste
               PushLong #1                     |Resize de la taille dans le pgm
               PushWord MyID
               PushWord #$0000
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_CCP
               pla
               sta Hdl_CCP+2
;--
               PushLong #0                     |BITMAP FOND D'IMAGE
               PushLong #2294                  |
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_BufStick
               pla
               sta Hdl_BufStick+2
;--
               PushLong #0                     |BITMAP FOND D'IMAGE
               PushLong #802
               PushWord MyID
               PushWord #$0000                 |not cross bank
               PushLong #0
               _NewHandle
               ldx #18
               jsl ErrorTools
               pla
               sta Hdl_Orders
               pla
               sta Hdl_Orders+2

               jsr D_Hdl_BufStick              |le Coince

               rts

               END
;------------------------------------------------------------------
;
;        Init_Rgn : Init des Regions de TRAVAIL
;
;------------------------------------------------------------------
Init_Rgn       START
               Using GlobalData
;--
               PushLong #0
               _NewRgn
               pla
               sta Rgn0
               pla
               sta Rgn0+2
;--
               PushLong #0
               _NewRgn
               pla
               sta Rgn1
               pla
               sta Rgn1+2
;--
               PushLong #0
               _NewRgn
               pla
               sta Rgn2
               pla
               sta Rgn2+2
;--
               PushLong #0
               _NewRgn
               pla
               sta ZRgn
               pla
               sta ZRgn+2

               rts

               END
;...............................................................
;
;        Fini_Rgn : Dispose Les Regions
;
;...............................................................
Fini_Rgn       START
               Using GlobalData

               PushLong Rgn0
               _DisposeRgn

               PushLong Rgn1
               _DisposeRgn

               PushLong Rgn2
               _DisposeRgn

               PushLong ZRgn
               _DisposeRgn

               rts

               END
;---------------------------------------------------------------
;
; setupmenus : INIT DES MENUS
;
;---------------------------------------------------------------
SetupMenus     START
               Using GlobalData
               Using MenuData

;--------------------------------------        |pour le DEBUGGING
;        aif disque>0,.versionC
;--------------------------------------
.versionC
;              PushLong #0
;              PushLong #Menu7
;              _NewMenu
;              PushWord #0
;              _InsertMenu
                
               PushLong #0
               PushLong #Menu6
               _NewMenu
               PushWord #0
               _InsertMenu
                
               PushLong #0
               PushLong #Menu5
               _NewMenu
               PushWord #0
               _InsertMenu
                            
               PushLong #0
               PushLong #Menu4
               _NewMenu
               PushWord #0
               _InsertMenu
                         
               PushLong #0
               PushLong #Menu3
               _NewMenu
               PushWord #0
               _InsertMenu

               PushLong #0
               PushLong #Menu2
               _NewMenu
               PushWord #0
               _InsertMenu

               PushLong #0
               PushLong #Menu1
               _NewMenu
               PushWord #0
               _InsertMenu

               PushWord #1              |Desk Accessory
               _FixAppleMenu

               PushWord #0
               _FixMenuBar
               pla                      |hauteur bar de menu

               _DrawMenuBar

               rts

               END
;...............................................................
;
;        setupline : INIT LINE EDIT
;
;...............................................................
setupline      START
               Using GlobalData
               Using LEData

               rts

               END
;...............................................................
;
;        INIT DES CONTROLES
;
;...............................................................
setupctrl      START
               Using GlobalData
;--
               lda #10
               sta SegNumber
               jsr disk_present
;--
               jsl Hls_Deb              |positionne protection
               PushWord MyId
               pea 1
               pea 10
               _UnloadSegNum
;--
               rts

               END
;...............................................................
;
;        ErrorTools : erreur systeme
;
;...............................................................
ErrorTools     START

               bcs touvamal
               rtl                      |ok ca marche
;--
touvamal       phx                      |ko ca marche pas

               pea 0
               pea 0
               pha
               _Hexit
               pla
               sta >code
               pla
               sta >code+2

               pla
               ora #$FF00
               pha

               PushLong #ErrorMsg
               _SysDeathMgr

ErrorMsg       ANOP
               dc i1'EndMsg-DebMsg'
DebMsg         dc c'Error Systeme ='
code           ds 4
               dc c' '
EndMsg         anop

               END
;---------------------------------------------------------------
;
; SetUpWindow : INIT DES FENETRES
;
;---------------------------------------------------------------
SetupWindows   START
               Using GlobalData
               Using WindowDATA

               jsr Bload_Bitmap         |Charger les Bitmaps

               PushLong #new_color      |Frame Color
               PushLong #0
               _SetFrameColor

               PushLong #0              |Fenetre d'Option
               PushLong #OptionWindow
               _NewWindow
               pla
               sta Ptr_OptionW
               pla
               sta Ptr_OptionW+2
;--
               lda Ptr_Fond
               sta FondPtr
               lda Ptr_Fond+2
               sta FondPtr+2
;--
               PushLong #PortFond
               _OpenPort

               PushLong #PortFond
               _SetPort

               PushLong #FondLocInfo
               _SetPortLoc

               rts

               END
