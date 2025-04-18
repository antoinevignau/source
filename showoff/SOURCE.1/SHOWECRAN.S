;...............................................................
;
;        SHOWECRAN.S
;
;        SBR de manipulation ecran PLEINE PAGE COULEUR BORDURE ETC ..
;
;...............................................................
;------------------------------------------------------------------
;
;        restaure_bord : bordure d'origine SVP
;
;------------------------------------------------------------------
set_bordure    START

               pea $0000                |sauve couleur de le bordure
               pea $001c
               _ReadBParam
               pla
               sta color_bordure

               sep #$20                 |acc = 8 bits
               longa off
               lda #$00                 |bord noir
               sta >$0000C034
               rep #$20                 |acc = 16 bits
               longa on

               PushWord #0              |control panel bordure noire
               PushWord #$1c
               _WriteBParam

               rts
;--------------------------------------
reset_bordure  ENTRY

               sep #$20                 |acc = 8 bits
               longa off

               lda color_bordure        |restaure bord
               sta >$0000C034

               rep #$30                 |acc = 16 bits
               longa on

;--
               PushWord color_bordure   |control panel d'origine
               PushWord #$1C
               _WriteBParam

               rts

color_bordure  ds 2                     |couleur de la bordure ecran

               END
;...............................................................
;
;    save_desktopF : sauve la region du desktop
;                    pour la PLEINE PAGE  et AVEC MENUBAR
;...............................................................
;--------------------------------------
;        SANS MENUBAR
;--------------------------------------
save_desktopF  START
               Using GlobalData

               PushLong #0              |DeskTop Full Page
               _NewRgn
               pla
               sta Rgn_DeskFull
               pla
               sta Rgn_DeskFull+2
;--
               PushLong #0              |Handle DeskTop Region
               PushWord #2              |GetDeskTop
               PushLong #0
               _Desktop
;--                                     |copie
               PushLong Rgn_DeskFull    |already in STACK
               _CopyRgn

               rts
;--------------------------------------
;        AVEC MENUBAR
;--------------------------------------

Save_DeskTopH  ENTRY

               PushLong #0              |DeskTop Full Page
               _NewRgn
               pla
               sta Rgn_DeskHalf
               pla
               sta Rgn_DeskHalf+2
;--
               PushLong #0              |Handle DeskTop Region
               PushWord #2              |GetDeskTop
               PushLong #0
               _Desktop
;--                                     |copie
               PushLong Rgn_DeskHalf    |already in STACK
               _CopyRgn

               rts

               END
;...............................................................
;
;        Pleine_page : Retabli un Plein Ecran
;
;...............................................................
Pleine_page    START
               Using GlobalData

               phb
               phk
               plb
;--
               lda Bloque_Flip
               beq ok
               brl Out_Fonction
;--
ok             PushLong #0              |deplace le port menu en dehors
               _GetPort                 |de l'ecran

               PushLong #0
               _GetMenuMgrPort

               _SetPort

               PushWord #0
               PushWord #200
               _MovePortTo

               _SetPort
;--
               PushLong #0              |GetDeskTop Half pour le retour
               PushWord #2
               PushLong #0
               _Desktop

               PushLong Rgn_DeskHalf    |Rgn In STACK
               _CopyRgn
;--
               PushLong Rgn_DeskFull    |set rgn desktop
               PushWord #3
               PushLong Rgn_DeskFull
               _Desktop
               pla
               pla

               jsr Swap_palette         |Palette MenuBAR

Out_Fonction   plb

               rtl

               END
;...............................................................
;
;        MenuBarOff
;
;...............................................................
MenuBarOff     START

               PushWord #$0080          |Disable les menus
               PushWord #2              |File
               _SetMenuFlag

               PushWord #$0080          |Disable les menus
               PushWord #3              |Edit
               _SetMenuFlag

               PushWord #$0080          |Disable les menus
               PushWord #4              |Goodies
               _SetMenuFlag

               PushWord #$0080          |Disable les menus
               PushWord #5              |Graphics
               _SetMenuFlag

               PushWord #$0080          |Disable les menus
               PushWord #6              |Font
               _SetMenuFlag

               PushWord #$0080          |Disable les menus
               PushWord #7              |Style
               _SetMenuFlag

               rts
;--------------------------------------
;        MenuBArOn
;--------------------------------------
MenuBarOn      ENTRY

               PushWord #$FF7F          |Enable les menus
               PushWord #2              |File
               _SetMenuFlag

               PushWord #$FF7F          |Enable les menus
               PushWord #3              |Edit
               _SetMenuFlag

               PushWord #$FF7F          |Enable les menus
               PushWord #4              |Goodies
               _SetMenuFlag

               PushWord #$FF7F          |Enable les menus
               PushWord #5              |graphics
               _SetMenuFlag

               PushWord #$FF7F          |Enable les menus
               PushWord #6              |Font
               _SetMenuFlag

               PushWord #$FF7F          |Enable les menus
               PushWord #7              |Style
               _SetMenuFlag

               rts

               END
;...............................................................
;
;        Demi_Page : Restaure Les Menus ETC
;
;...............................................................
Demi_Page      START
               Using GlobalData
               Using WindowData

               phb
               phk
               plb
;--
               lda Bloque_Flip
               beq ok
               brl Out_Fonction
;--
ok             PushLong Rgn_DeskHalf    |set rgn desktop
               PushWord #3
               PushLong Rgn_DeskHalf
               _Desktop
               pla
               pla
;--
               PushLong #0              |Replace le port menu en HAUT
               _GetPort

               PushLong #0
               _GetMenuMgrPort

               _SetPort

               PushWord #0
               PushWord #0
               _MovePortTo

               _SetPort

               jsr Swap_palette         |Palette MenuBAR

               _DrawMenuBar             |la Dessine

               PushLong #$FFFFFFFF      |FRAME EN 2EME PLAN
               PushLong Ptr_OptionW
               _SendBehind

Out_Fonction   plb

               rtl

               END
;---------------------------------------------------------------
;
; Swap_palette : Palette Menu UNIFORME
;
;---------------------------------------------------------------
Swap_palette   START
               Using GlobalData

               ldx #8                   |10 lignes de Palette
rSwap_palette  lda >$00E19D00,x
               tay
               lda MenuPalette,x
               sta >$00E19D00,x
               tya
               sta MenuPalette,x
               dex
               dex
               bpl rSwap_palette

               rts

               END
