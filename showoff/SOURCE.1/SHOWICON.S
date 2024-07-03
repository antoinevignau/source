***************************************************************
*
*                      Show Icon
*              Programme de creation d'icones
*
*              ShowIcon.s               -- Relogeable --
*
***************************************************************

               list     off
               gen      off
               symbol   off

               keep     IconEditor

               MCopy    ShowIcon.mac

               65816    on
               longa    on
               longi    on

               copy     IconData.s
               copy     IconSub.s

***************************************************
*
*              Necessaire a la compile
*
***************************************************
IconEditor     START

               brl      DoIconEdit1

               END

***************************************************
*
*              Le programme editeur d'icones
*
***************************************************
DoIconEdit1    START
               USING    IconVar
               USING    GlobalData
               USING    ProdosData

               phb

               phk
               plb

               lda #1                   |ACCES DE ICON SELECT
               sta >Top_IconEdit
               sta Flag_Loupe

               bra Suite
;--------------------------------------
;--------------------------------------
;--------------------------------------
DoIconEdit     ENTRY                    |ACCES DE EDIT ICON

               phb

               phk
               plb

*
*              Initialise
*
               lda #0
               sta >Top_IconEdit
               sta Flag_Loupe

Suite          lda      #PauseInvert
               sta      InvertPPause
               lda      #PauseCurret
               sta      CurretPPause
               lda      #False
               sta      QuitIcon
               stz Err_Debug_250288
               stz      CmdsMode
               stz      ColorNum
               stz      CoordX
               stz      KMouseX
               stz      ODiagX
               stz      EDiagX
               stz      CoordY
               stz      KMouseY
               stz      SelecPat
               stz      CutEnab
               stz      ODiagY
               stz      EDiagY
               stz      NbrCar
               stz      TopCurret

               lda      #0
               sta      >IcModified

               PushLong #LastCmds
               pea      $0
               pea      $0
               pea      $0
               pea      $0
               _SetRect

               PushLong #LastColor
               pea      $0
               pea      $0
               pea      $0
               pea      $0
               _SetRect

               PushLong #SelectionRect
               pea      $0
               pea      $0
               pea      $0
               pea      $0
               _SetRect

               PushLong #SelecDessRect
               pea      $0
               pea      $0
               pea      $0
               pea      $0
               _SetRect

               PushWord #0
               _GetTextMode
               pla
               sta      OldTextMode
;--
               lda >Top_IconEdit
               bne Suite00
;--
               jsl      Pleine_Page
;--
Suite00        ANOP
*
*              Get memory for icons             
*
               PushLong #0              ; space for handle
               PushLong #748            ; 748 octets
               lda      >MyID
               pha
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta DessBitMap
               pla
               sta DessBitMap+2
;--------------------------------------
               lda >Top_IconEdit
               bne Suite0
;--
               PushLong #0              ; space for handle
               PushLong #748            ; 748 octets
               lda      >MyID
               pha
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta >UndoBufHdl
               pla
               sta >UndoBufHdl+2
;--
Suite0         PushLong #0              ; space for handle
               PushLong #816            ; 816 octets : 48 x 34
               lda      >MyID
               pha
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta ScrapBufHdl
               pla
               sta ScrapBufHdl+2

               PushLong #0              ; space for handle
               PushLong #748            ; 748 octets
               lda      >MyID
               pha
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta RevertBufHdl
               pla
               sta RevertBufHdl+2

               PushLong #0              ; space for handle
               PushLong #748            ; 748 octets
               lda      >MyID
               pha
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta MvSelectHdl
               pla
               sta MvSelectHdl+2

               PushLong #0              ; space for handle
               PushLong #$0E50          ; 3360 octets
               lda      >MyID
               pha
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta CmdsIconHdl
               plx
               stx CmdsIconHdl+2

               jsr IcDeref
               
               sta CmdsIcon
               stx CmdsIcon+2
*
*              Load picture into buffers
*
               lda #BMCmdsName
               sta >nameptr
               lda #^BMCmdsName
               sta >nameptr+2

               lda #$E50
               sta >readlg
               lda #0
               sta >readlg+2

               lda CmdsIcon
               ldx CmdsIcon+2
               sta >ReadDest
               txa
               sta >ReadDest+2

               jsl Simple_Load2         |LOAD AVEC VERIF
               bcc sLoadSansVerif
;--
               lda #1
               sta Err_Debug_250288
               jmp sortie_erreur        |en cas de refus d'inserer le disque
;--
sLoadSansVerif ANOP
;--
               lda CmdsIconHdl
               ldx CmdsIconHdl+2
               jsr IcUnLock
*
*              Get new Dialog
*
               PushLong #0              ; dialogPtr
               PushLong #DialFull       ; content rectangle
               PushLong #0              ; no title
               PushLong #$FFFFFFFF      ; bring to front
               PushWord #$0020          ; frame
               PushLong #RefConIcon
               PushLong #DialFull       ; full size
               _NewModelessDialog

               pla
               sta      DlgIconPtr
               pla
               sta      DlgIconPtr+2
;--
               Pushlong #0
               _GetPort
               pla
               sta      LePort
               pla
               sta      LePort+2

               PushLong DlgIconPtr
               _SetPort
;--
               PushLong DlgIconPtr
               PushLong #IQuit
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #IRevert
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #IClear
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ISave
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ILoad
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ICut
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ICopy
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #IPaste
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ILeDessin
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ILesCmds
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #IUndo
               _GetNewDItem

               PushLong DlgIconPtr
               PushLong #ISelIcon
               _GetNewDItem
;--
               lda >Mode_ShowOff
               cmp #Mode_Rien
               bne OhSelect
;--
               PushWord #255
               PushLong #0
               PushLong DlgIconPtr
               PushWord ISelIcon
               _GetControlDItem
               _HiliteControl
;--
OhSelect       jsr      DrawIcTitre

;--------------------------------------
               lda >Top_IconEdit
               beq Suite1
;--
               jsr CopyUndoToSc
               jsr RedrawLoupe
               lda #0
               sta Flag_Loupe
               bra Suite2
;--
Suite1         lda      #BlancCol       ; couleur 15 = blanc
               sta      CouleurDuPt
               jsr      FillIcon
;--
Suite2         ANOP

*
*              Init le Buffer du Undo et du scrap
*
               jsr      CopyScToUndo
               jsr      CopyScToScrap
               jsr      CopyScToRevert  ; sauvegarde le dessin original

*
*              Handle Events
*
NextEvent      PushWord #0
               PushWord #$1FFF
               PushLong #EventRecord
               _GetNextEvent

               pla
               bne      HdlEvent
               jsr      WithNoEvent
               bra      NextEvent

HdlEvent       jsr      IsItACar

               PushWord #0
               PushLong #EventRecord
               PushLong #DlgIconPtr
               PushLong #ItemHit
               _DialogSelect

               pla
               beq      NextEvent
               jsr      SetNewClip

               lda      ItemHit
               asl      a
               tax

               jsr      (LesCmds,x)
               jsr      ReSetOldClip

               lda      QuitIcon
               beq      NextEvent
;--
               lda >Top_IconEdit        |copier l'ecran dans le buffer
               beq Suite3

               jsr CopyScToUndo
;--
Suite3         PushLong DlgIconPtr
               _CloseDialog
*
*              Exit
*
               Pushlong Leport
               _SetPort
;--------------------------------------
Sortie_erreur  ANOP
;--------------------------------------
               Pushlong MvSelectHdl
               _DisposeHandle

               Pushlong ScrapBufHdl
               _DisposeHandle

               Pushlong DessBitMap
               _DisposeHandle

               Pushlong CmdsIconHdl
               _DisposeHandle

               PushLong RevertBufHdl
               _DisposeHandle

               PushWord OldTextMode
               _SetTextMode
;--
               lda >Top_IconEdit        |copier l'ecran dans le buffer
               bne Suite4

               Pushlong >UndoBufHdl
               _DisposeHandle

               jsl      Demi_Page

Suite4         ANOP
;--
               lda #DoIconEdit1
               sta <Ptr_PZero
               lda #^DoIconEdit1
               sta <Ptr_PZero+2
               plb
               rtl
;--
*
*              Tables
*
LesCmds        anop

               dc i'IcIgnore'
               dc i'IcIgnore'
               dc i'CQuit'
               dc i'CRevert'
               dc i'CClear'
               dc i'CSave'
               dc i'CLoad'
               dc i'CCut'
               dc i'CCopy'
               dc i'CPaste'
               dc i'CLeDessin'
               dc i'CLesCmds'
               dc i'CUndo'
               dc i'CSelect'
*
*              Ignore l'evenement
*
IcIgnore       ENTRY

               rts
*
*              Quitte
*
CQuit          anop
               jsr      EndSelect

               lda      >IcModified
               beq      ActifQuit

               PushWord #0
               PushLong #LoseAlert
               PushLong #0
               _CautionAlert
               pla
               cmp      LoseIDOk
               bne      CQuitExit

ActifQuit      lda      #True
               sta      QuitIcon
               stz      IcSelect

               lda      >Top_IconEdit
               beq      CQuitExit

               jsr      CopyRevertToSc
               jsr      CopyScToUndo

CQuitExit      anop
               lda #1                   ; redessine toute la loupe
               sta Flag_Loupe
               jsr      RedrawLoupe
               lda #0
               sta Flag_Loupe

               rts

*
*              Quitte et selectionne
*
CSelect        anop
               jsr      EndSelect

               lda      >IcModified
               beq      ActifSelect

               PushWord #0
               PushLong #LoseAlert
               PushLong #0
               _CautionAlert
               pla
               cmp      LoseIDOk
               bne      CSelectExit

ActifSelect    lda      #True
               sta      QuitIcon
               sta      IcSelect

               jsr      CopyScToUndo
               lda      >Top_IconEdit
               bne      CSelectExit

               jsl      AddEditIcon

CSelectExit    anop
               lda #1                   ; redessine toute la loupe
               sta Flag_Loupe
               jsr      RedrawLoupe
               lda #0
               sta Flag_Loupe

               rts

*
*              Revient a la version enregistree de l'icone
*
CRevert        anop

               jsr      EndSelect

               lda      >IcModified
               beq      ActifRevert

               PushWord #0
               PushLong #LoseAlert
               PushLong #0
               _CautionAlert
               pla
               cmp      LoseIDOk
               bne      CRevertExit

ActifRevert    jsr      CopyScToUndo
               jsr      CopyRevertToSc
               lda      #0
               sta      >IcModified

CRevertExit    anop
               lda #1                   ; redessine toute la loupe
               sta Flag_Loupe
               jsr      RedrawLoupe
               lda #0
               sta Flag_Loupe

               rts

*
*              Efface l'icone ou la selection
*
CClear         anop
               lda      #$FFFF
               sta      >IcModified

               PushWord #0
               PushLong #SelectionRect
               _EmptyRect
               pla
               beq      AllCClear
               jsr      EndSelect
               jsr      CopyScToUndo
               jsr      CopyMvSelToSc
               jsr      ReDrawLoupe
               bra      CClearExit

AllCClear      jsr      EndSelect
               jsr      CopyScToUndo    ; copie le buffer ecran dans undo

               lda      #BlancCol             ; couleur 15 = blanc
               sta      CouleurDuPt
               jsr      FillIcon

CClearExit     rts
*
*              Sauvegarde de l'icone
*
CSave          anop

               jsr      EndSelect

               jsr      CopyScToUndo
               jsl      SaveIcon
               jsr      DrawIcTitre
               jsr      CopyUndoToSc

               lda #1                   ; redessine toute la loupe
               sta Flag_Loupe
               jsr      RedrawLoupe
               lda #0
               sta Flag_Loupe

               rts

*
*              Charge un icone a partir du disk
*
CLoad          anop

               jsr      EndSelect

               lda      >IcModified
               beq      ActifLoad

               PushWord #0
               PushLong #LoseAlert
               PushLong #0
               _CautionAlert
               pla
               cmp      LoseIDOk
               bne      CLoadExit

ActifLoad      jsr      CopyScToUndo
               jsl      LoadIcon
               jsr      DrawIcTitre
               jsr      CopyUndoToSc
               jsr      CopyScToRevert

CLoadExit      lda #1                   ; redessine toute la loupe
               sta Flag_Loupe
               jsr      RedrawLoupe
               lda #0
               sta Flag_Loupe
               rts
*
*              Enregistre et supprime une partie de l'icone
*
CCut           anop

               lda      #$FFFF
               sta      >IcModified

               jsr      SetPaste
               jsr      InvertPatNR
               jsr      CopyScToUndo
               jsr      CopyScToScrap
               jsr      SetScrapRect


               PushWord #BlancCol
               _SetSolidPenPat

               PushLong #SelectionRect
               _PaintRect

               jsr      InvertPatNR
               jsr      EndSelect
               jsr      RedrawLoupe

               rts
*
*              Enregistre une partie de l'icone
*
CCopy          anop

               jsr      SetPaste

LikeCopy       Entry
               jsr      InvertPatNR
               jsr      CopyScToMvSel
               jsr      CopyScToScrap
               jsr      SetScrapRect
               jsr      InvertPatNR

               rts
*
*              Colle une partie de l'icone
*
CPaste         anop
               lda      #$FFFF
               sta      >IcModified

               jsr      EndSelect
               jsr      CopyScToUndo
               jsr      CopyScToMvSel

               lda      #SelectMode
               sta      RectNum
               jsr      InSelect

               PushWord #0
               PushLong #ScrapCRect
               _EmptyRect
               pla
               beq      CPasteExit

               PushLong #SelectionRect
               lda      ScrapCRect+2
               clc
               adc      BMDessRect+2
               pha
               lda      ScrapCRect
               clc
               adc      BMDessRect
               pha
               lda      ScrapCRect+6
               clc
               adc      BMDessRect+2
               pha
               lda      ScrapCRect+4
               clc
               adc      BMDessRect
               pha
               _SetRect

               jsr      ScrapToSelDR
               jsr      ScrapToPort
               jsr      InvertSelPat

CPasteExit     rts
*
*              Click dans le dessin
*
CLeDessin      anop
               Pushlong #0
               _GetPort
               pla
               sta      LePort
               pla
               sta      LePort+2

               PushLong DlgIconPtr
               _SetPort

               PushLong #EventWhere
               _GetMouse

               lda      CmdsMode
               asl      a
               tax
               jsr      (DessMode,x)

               PushLong Leport
               _SetPort

               rts
*
*              Click dans la boite de commande
*
CLesCmds       anop
               Pushlong #0
               _GetPort
               pla
               sta      LePort
               pla
               sta      LePort+2

               PushLong DlgIconPtr
               _SetPort

               PushLong #EventWhere
               _GetMouse

               stz      RectNum

TryCmdsRect    PushWord #0
               PushLong #EventWhere

               lda      #^CmdsRect
               pha

               lda      RectNum
               asl      a
               asl      a
               asl      a
               clc
               adc      #CmdsRect

               pha
               _PtInRect

               pla
               bne      CmdsFound

               lda      RectNum
               cmp      #NbrCmds
               bcs      CmdsExit

               inc      a
               sta      RectNum
               bra      TryCmdsRect

CmdsFound      lda      RectNum
               cmp      CmdsMode
               beq      CmdsExit
               asl      a
               tax
               jsr      (ExeCmds,x)

CmdsExit       PushLong Leport
               _SetPort

               rts
*
*              Annule la derniere commande
*
CUndo          anop
               lda      #$FFFF
               sta      >IcModified

               jsr      EndSelect

               lda      >UndoBufHdl+2
               tax
               lda      >UndoBufHdl
               jsr      IcDeref
               sta     <Ptr_Buffer1
               stx     <Ptr_Buffer1+2

               jsr      SwitchBuffer

               lda      >UndoBufHdl+2
               tax
               lda      >UndoBufHdl
               jsr      IcUnlock

               jsr      ReDrawLoupe
               
               rts
*
*              Table des sous-programmes de dessin
*
DessMode       anop

               dc i'CrayonAct'
               dc i'SelectAct'
               dc i'FrameAct'
               dc i'LettreAct'
               dc i'IcIgnore'
               dc i'IcIgnore'
               dc i'FrameAct'
               dc i'FrameAct'
               dc i'FrameAct'
               dc i'FrameAct'
               dc i'FrameAct'
               dc i'FrameAct'
*
*              Table des sous-programmes de commande
*
ExeCmds        anop

               dc i'InCrayon'
               dc i'InSelect'
               dc i'InLigne'
               dc i'InLettre'
               dc i'InFlipV'
               dc i'InFlipH'
               dc i'InRectangle'
               dc i'InPlan'
               dc i'InRRectangle'
               dc i'InRPlan'
               dc i'InCercle'
               dc i'InDisque'

               dc i'InFlecheH'
               dc i'InFlecheG'
               dc i'InFlecheD'
               dc i'InFlecheB'

               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'
               dc i'InColor'

               dc i'IcIgnore'
*
*              Dessine des points
*

CrayonAct      anop
               lda      #$FFFF
               sta      >IcModified

               jsr      GetDessCoord    ; obtient Coordonnees relatives

               jsr      GetColCoord     ; obtient couleur du point clique

               jsr      CopyScToUndo    ; copie le buffer ecran dans undo

               lda      CouleurDuPt
               cmp      ColorNum
               bne      NewColPt

               lda      #BlancCol
               bra      MetPt

NewColPt       lda      ColorNum

MetPt          sta      CouleurDuPt
               jsr      SetColCoord

NextCrayEvt    pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               beq      CrayExit
               
               PushLong #EventWhere
               _GetMouse

               jsr      GetDessCoord

               lda      MouseNotMv
               bne      NextCrayEvt

               jsr      SetColLigne

               bra      NextCrayEvt
               
CrayExit       rts

*
*              Selectionne une zone
*

SelectAct      anop

               PushWord #0
               PushLong #EventWhere
               PushLong #SelecDessRect
               _PtInRect

               pla
               bne      MoveStart
               brl      NewSelRect

*              Move Rect

MoveStart      anop
               lda      #$FFFF
               sta      >IcModified

               jsr      GetDessCoord
               jsr      InvertPatNR
               jsr      CopyScToUndo
               jsr      InvertPatNR
               jsr      EndCutCopy
               jsr      SetPaste

MoveSelRect    pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               bne      MoveSelect

               brl      SelRectExit
               
MoveSelect     PushLong #EventWhere
               _GetMouse

               jsr      GetDessCoord

               lda      MouseNotMv
               bne      MoveSelRect

               jsr      CopyMvSelToSc

               PushLong #SelectionRect
               PushWord DeltaX
               PushWord DeltaY
               _OffsetRect

               PushLong #SelecDessRect
               lda      DeltaX
               asl      a
               asl      a
               pha
               lda      DeltaY
               asl      a
               asl      a
               pha
               _OffsetRect

               jsr      ScrapToPort

               jsr      InvertSelPat

               brl      MoveSelRect

NewSelRect     anop

               jsr      EndSelect
               jsr      GetDessCoord

               PushLong #SelectionRect
               PushWord BitMCX
               PushWord BitMCY
               PushWord BitMCX
               PushWord BitMCY
               _SetRect

               lda      BitMCX
               sta      OrigineX

               lda      BitMCY
               sta      OrigineY

SizeSelRect    pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               beq      SelRectQuit
               
               PushLong #EventWhere
               _GetMouse

               jsr      GetDessCoord

               lda      MouseNotMv
               bne      SizeSelRect

               jsr      SetPatRect
               jsr      SetCutCopy

               bra      SizeSelRect

SelRectQuit    anop

               PushWord #0
               PushLong #SelectionRect
               _EmptyRect
               pla
               beq      SelRectExit

               jsr      LikeCopy
               jsr      UnsetPaste

               PushWord #BlancCol
               _SetSolidPenPat

               PushLong #SelectionRect
               _PaintRect

               jsr      CopyScToMvSel

               jsr      ScrapToPort
               jsr      InvertPatNR

               jsr      ScrapToSelDR

SelRectExit    rts

*
*              Routine de toutes les frames : ligne, rectangle, ovales
*

FrameAct       anop

               lda      #$FFFF
               sta      >IcModified

               jsr      CopyScToUndo
               jsr      GetDessCoord

               PushLong #SelectionRect
               PushWord BitMCX
               PushWord BitMCY
               PushWord BitMCX
               PushWord BitMCY
               _SetRect

               lda      BitMCX
               sta      ODiagX
               sta      OrigineX
               sta      EDiagX

               lda      BitMCY
               sta      ODiagY
               sta      OrigineY
               sta      EDiagY

               jsr      InvertPatNR

SizeFraRect    pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               beq      FraRectQuit
               
               PushLong #EventWhere
               _GetMouse

               jsr      GetDessCoord

               lda      MouseNotMv
               bne      SizeFraRect

               jsr      SetPatRect

               bra      SizeFraRect

FraRectQuit    anop

               jsr      PutTheFrame

FraRectExit    rts

*
*              Lettre action
*

LettreAct      anop

               lda      #Enabled
               sta      LettreEnab
               jsr      KillCurret
               jsr      CopyScToUndo
               jsr      GetDessCoord
               PushWord BitMcX
               PushWord BitMcY
               _MoveTo

               stz      NbrCar

               rts

*
*              Click dans crayon
*

InCrayon       anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #CrayonMode
               sta      CmdsMode

               rts

InSelect       anop

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      ChangeRect

               lda      #SelectMode
               cmp      CmdsMode
               beq      InSelExit

               PushLong #SelectionRect
               pea      $0
               pea      $0
               pea      $0
               pea      $0
               _SetRect

               lda      #SelectMode
               sta      CmdsMode

InSelExit      rts

InLigne        anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #LigneMode
               sta      CmdsMode

               rts

InLettre       anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #LettreMode
               sta      CmdsMode
               lda      #Disabled
               sta      LettreEnab

               rts

InFlipH        anop

               lda      #$FFFF
               sta      >IcModified

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      InvertPSel
               jsr      RedrawLoupe
               jsr      CopyScToUndo
               jsr      TestForFlip

               lda      OdiagY
               sta      CoordY
               lda      EDiagY
               dec      a
               sta      TempY

               lda      #$00E1
               sta     <Ptr_ScIcon+2
               sta     <Ptr_DsIcon+2

NextLigFH      lda      TempY
               asl      a
               tax
               lda      BitMapAdr,x
               sta     <Ptr_ScIcon

               lda      CoordY
               asl      a
               tax
               lda      LoupeAdr,x
               sta     <Ptr_DsIcon

               jsr      CopyLigne

               lda      CoordY
               inc      a
               sta      CoordY
               dec      TempY
               cmp      EdiagY
               bcc      NextLigFH

               jsr      ShouldICopySc
               jsr      InvertPSel
               jsr      RedrawLoupe

               rts

InFlipV        anop

               lda      #$FFFF
               sta      >IcModified

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      InvertPSel
               jsr      RedrawLoupe
               jsr      CopyScToUndo
               jsr      TestForFlip

               lda      OdiagY
               sta      CoordY
               sta      TempY

               lda      #$00E1
               sta     <Ptr_DsIcon+2
               sta     <Ptr_ScIcon+2

NextLigFV      lda      TempY
               asl      a
               tax
               lda      BitMapAdr,x
               sta     <Ptr_ScIcon

               lda      CoordY
               asl      a
               tax
               lda      LoupeAdr,x
               sta     <Ptr_DsIcon

               lda      ODiagX
               sta      CoordX
               lda      EDiagX
               dec      a
               sta      TempX

NextFVPt       jsr      FlipPoint

               lda      CoordX
               inc      a
               sta      CoordX
               dec      Tempx
               cmp      EDiagX
               bcc      NextFVPt

               lda      CoordY
               inc      a
               sta      CoordY
               sta      TempY
               cmp      EdiagY
               bcc      NextLigFV

               jsr      ShouldICopySc
               jsr      InvertPSel
               jsr      RedrawLoupe

               rts

InRectangle    anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #RectMode
               sta      CmdsMode

               rts

InPlan         anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #PlanMode
               sta      CmdsMode

               rts

InRRectangle   anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #RRectMode
               sta      CmdsMode

               rts

InRPlan        anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #RPlanMode
               sta      CmdsMode

               rts
InCercle       anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #CercleMode
               sta      CmdsMode

               rts

InDisque       anop

               jsr      EndSelect

               jsr      ChangeRect

               lda      #DisqueMode
               sta      CmdsMode

               rts

InFlecheH      anop

               lda      #$FFFF
               sta      >IcModified

               _HideCursor

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      InvertPSel
               jsr      CopyScToUndo
               jsr      InvertPSel
                        
NextFlecheH    jsr      InvertPSel
               jsr      RedrawLoupe
               jsr      TestForFlip

               lda      EdiagY
               dec      a
               sta      CoordY
               dec      a
               sta      TempY

               lda      #$00E1
               sta     <Ptr_ScIcon+2
               sta     <Ptr_DsIcon+2

NextFlecH      lda      TempY

               bpl      TYPos
               bra      TYLdaEDy
TYPos          cmp      ODiagY
               bcs      TYSupOY
TYLdaEDy       lda      EDiagY
               dec      a

TYSupOY        sta      TempY
               asl      a
               tax
               lda      BitMapAdr,x
               sta     <Ptr_ScIcon

               lda      CoordY
               asl      a
               tax
               lda      LoupeAdr,x
               sta     <Ptr_DsIcon

               jsr      CopyLigne

               lda      CoordY
               cmp      ODiagY
               beq      NRestorH
               dec      a
               sta      CoordY
               dec      TempY
               bra      NextFlecH

NRestorH       anop
               jsr      ShouldICopySc
               jsr      InvertPSel
               jsr      RedrawLoupe

               pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               bne      NextFlecheH

               _ShowCursor

               rts

InFlecheG      anop

               lda      #$FFFF
               sta      >IcModified

               _HideCursor

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      InvertPSel
               jsr      CopyScToUndo
               jsr      InvertPSel

NextFlecheG    jsr      InvertPSel
               jsr      RedrawLoupe
               jsr      TestForFlip

               lda      EdiagX
               dec      a
               sta      CoordX
               dec      a
               sta      TempX

               lda      #$00E1
               sta      <Ptr_ScIcon+2
               sta      <Ptr_DsIcon+2

NextFlecG      lda      TempX

               bpl      TXPos
               bra      TXLdaEDx
TXPos          cmp      ODiagX
               bcs      TXSupOX
TXLdaEDx       lda      EDiagX
               dec      a

TXSupOX        sta      TempX

               lda      ODiagY
               sta      CoordY
               sta      TempY

               asl      a
               tax
               lda      BitMapAdr,x
               sta      <Ptr_ScIcon

               lda      CoordY
               asl      a
               tax
               lda      LoupeAdr,x
               sta      <Ptr_DsIcon

               jsr      CopyColonne

               lda      CoordX
               cmp      ODiagX
               beq      NRestorG
               dec      a
               sta      CoordX
               dec      TempX
               bra      NextFlecG

NRestorG       anop
               jsr      ShouldICopySc
               jsr      InvertPSel
               jsr      RedrawLoupe

               pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               bne      NextFlecheG

               _ShowCursor

               rts

InFlecheD      anop

               lda      #$FFFF
               sta      >IcModified

               _HideCursor

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      InvertPSel
               jsr      CopyScToUndo
               jsr      InvertPSel

NextFlecheD    jsr      InvertPSel
               jsr      RedrawLoupe
               jsr      TestForFlip

               lda      OdiagX
               sta      CoordX
               inc      a
               sta      TempX

               lda      #$00E1
               sta      <Ptr_ScIcon+2
               sta      <Ptr_DsIcon+2

NextFlecD      lda      TempX

               cmp      EDiagX
               bcc      TXMinOX
               lda      ODiagX

TXMinOX        sta      TempX

               lda      ODiagY
               sta      CoordY
               sta      TempY

               asl      a
               tax
               lda      BitMapAdr,x
               sta      <Ptr_ScIcon

               lda      CoordY
               asl      a
               tax
               lda      LoupeAdr,x
               sta      <Ptr_DsIcon

               jsr      CopyColonne

               lda      CoordX
               inc      a
               cmp      EDiagX
               beq      NRestorD
               sta      CoordX
               inc      TempX
               bra      NextFlecD

NRestorD       anop
               jsr      ShouldICopySc
               jsr      InvertPSel
               jsr      RedrawLoupe

               pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               bne      NextFlecheD

               _ShowCursor

               rts

InFlecheB      anop

               lda      #$FFFF
               sta      >IcModified

               _HideCursor

               lda      #Disabled
               sta      LettreEnab      ; on en proffite

               jsr      KillCurret

               jsr      InvertPSel
               jsr      CopyScToUndo
               jsr      InvertPSel

NextFlecheB    jsr      InvertPSel
               jsr      RedrawLoupe
               jsr      TestForFlip

               lda      OdiagY
               sta      CoordY
               inc      a
               sta      TempY

               lda      #$00E1
               sta      <Ptr_ScIcon+2
               sta      <Ptr_DsIcon+2

NextFlecB      lda      TempY

               cmp      EDiagY
               bcc      TYMinOY
               lda      ODiagY

TYMinOY        sta      TempY
               asl      a
               tax
               lda      BitMapAdr,x
               sta      <Ptr_ScIcon

               lda      CoordY
               asl      a
               tax
               lda      LoupeAdr,x
               sta      <Ptr_DsIcon

               jsr      CopyLigne

               lda      CoordY
               inc      a
               cmp      EDiagY
               beq      NRestorB
               sta      CoordY
               inc      TempY
               bra      NextFlecB

NRestorB       anop
               jsr      ShouldICopySc
               jsr      InvertPSel
               jsr      RedrawLoupe

               pea      $0
               pea      $0
               _StillDown               ;  Button encore presse ?
               pla
               bne      NextFlecheB

               _ShowCursor

               rts

InColor        ENTRY

               jsr      ReSetOldClip

               lda #NbrCmds
               sec
               sbc RectNum
               dec a
               sta ColorNum

               PushWord #15             ; couleur 15 = blanc
               _SetSolidPenPat

               PushWord #0
               _GetPenMode
               pla
               sta LePenMode

               PushWord #2              ; Mode XOr
               _SetPenMode

               PushLong #LastColor
               _FrameRect

               lda      RectNum
               asl      a
               asl      a
               asl      a
               tax

               lda      CmdsRect,x
               sta      lastColor
               lda      CmdsRect+2,x
               sta      lastColor+2
               lda      CmdsRect+4,x
               sta      lastColor+4
               lda      CmdsRect+6,x
               sta      lastColor+6

               lda      #^CmdsRect
               pha

               txa
               clc
               adc      #CmdsRect
               pha               

               _FrameRect

               PushWord LePenMode
               _SetPenMode

               jsr      SetNewClip

               rts
;--
Err_Debug_250288 dc i'0'
;--
               END
