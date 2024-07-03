*************************************************************
*
*              Sous-Programmes de l'editeur de sequence
*
*              SeqEditSub.s
*
*************************************************************

SeqEditSub     START
               USING    SeqEditData
               USING    GlobalData
               USING    ProdosData
               USING    WindowData

****************************************
*
*              Open Sequence
*
****************************************
DoOpenSequ     ENTRY

               PushLong #0
               _GetPort
               pla
               sta      SEPortTemp
               pla
               sta      SEPortTemp+2

               PushWord #20
               PushWord #20
               PushLong #SEOpenSequence
               PushLong #0
               PushLong #SETypeList
               PushLong #Reply
               _SFGetFile

               PushLong SEPortTemp
               _SetPort

               lda      Reply_Good
               sec                      ; ko
               bne      DoOpenTSO
               brl      QuitNoMod

DoOpenTSO      anop

               lda      SEScrapOn
               beq      DoOpen1
               jsr      CopyScrapBuf
               bcc      DoOpen1
               stz      SEScrapOn
               brl      OpenError

DoOpen1        anop
               jsr      CopyBeenToWMod
               jsr      KillWorkFile
               jsr      InitBeenMod
               jsr      InitWorkMod

               lda      SequenceOn
               bne      DoOpenDebut

               jsr      DoNew1

DoOpenDebut    anop

               _WaitCursor

               jsr      CopyRepToFNam

               jsr      MakeFileWork
               bcc      DoOpenStart

               bra      OpenError

DoOpenStart    anop
               jsr      LoadCurFrame
               bcc      DoOpenExit

               bra      OpenError

DoOpenExit     lda      SequenceOn
               bne      DoOpenOk
               PushLong Ptr_OptionW
               _SetPort
               PushLong #FullRect
               _InvalRect

               bra      DoOpenOk

OpenError      lda      SequenceOn
               bne      SeqOpenCrash

               jsr      Reset_Frame
               bra      SeqCrashExit

SeqOpenCrash   lda      #$FFFF
               sta      SEFatalError
               lda      #$FFFF
               sta      QuitSeqEd

SeqCrashExit   anop
QuitNoMod      anop
               _InitCursor
               sec
               rts

DoOpenOk       anop
               jsr      SetNewNumToOld

               lda      #1
               sta      SERevertOn

               stz      Top_ActionG

               _InitCursor
               clc                      ; ok
               rts

****************************************
*
*              Save sequence
*
****************************************
DoSaveSequ     ENTRY

               _WaitCursor

               jsr      FillOriginal
               bcs      DoSaveErreur

               jsr      SeqInFrameF
               jsr      SaveSequence
               jsr      CopyFFToFrame   ; reinitialise le nom
               jsr      PutThe000
               jsr      CopyBeenToWMod
               jsr      KillWorkFile
               lda      TmpBeenMod      ; car modifie par initbeenmod
               pha
               jsr      InitBeenMod

               stz      Top_ActionG

               pla
               sta      TmpBeenMod
               jsr      UpdateWithTmp

               jsr      LoadCurFrame

               lda      #1
               sta      SERevertOn

               _InitCursor

               clc
               rts

DoSaveErreur   jsr      CopyFFToFrame
               jsr      PutThe000
               _InitCursor
               sec
               rts

****************************************
*
*           Save sequence As ...
*
****************************************
DoSaveAsSequ   ENTRY

               PushLong #0
               _GetPort
               pla
               sta      SEPortTemp
               pla
               sta      SEPortTemp+2

               PushWord #20
               PushWord #20
               PushLong #SEGiveName
               PushLong #FrameFileName
               PushWord #12
               PushLong #reply
               _SFPutFile

               PushLong SEPortTemp
               _SetPort

               lda      reply_good
               bne      DoSaveAsStart
               brl      DoSaveAsCancel

DoSaveAsStart  jsr      CompareOldNew
               bcc      DoSaveAs1
               brl      DoSaveSequ

DoSaveAs1      _WaitCursor

               lda      SEScrapOn
               beq      DosaveAs2
               jsr      CopyScrapBuf
               bcc      DosaveAs2
               stz      SEScrapOn
               brl      DoSaveAsCancel

DoSaveAs2      jsr      CopyFileWork
               bcs      DoSaveAsCancel

               jsr      CopyBeenToWMod
               jsr      KillWorkFile
               jsr      InitWorkMod
               jsr      CopyRepToFNam
               jsr      ChangeFNames
               lda      TmpBeenMod
               pha
               jsr      InitBeenMod

               stz      Top_ActionG

               pla
               sta      TmpBeenMod
               jsr      UpdateWithTmp

               jsr      LoadCurFrame

               lda      #1
               sta      SERevertOn

DoSaveAsExit   anop

               _InitCursor
               clc
               rts

DoSaveAsCancel _InitCursor
               sec
               rts

****************************************
*
*        Revert to saved sequence
*
****************************************
DoRevertSequ   ENTRY

               jsr      CopyBeenToWMod
               jsr      KillWorkFile
               jsr      InitBeenMod
               jsr      InitWorkMod

               jsr      MakeFileWork
               bcs      DoRevertKo

               jsr      SetNewNumToOld

               stz      Top_ActionG

               clc
               rts

DoRevertKo     sec
               rts

******************************************************************
*
*      Update les petits ecran si le template a ete modifie
*
******************************************************************
UpdateWithTmp  ENTRY

               lda      TmpBeenMod
               bne      UpdatePha
               brl      UpdateTmpExit

UpdatePha      lda      Sequ_NbFrame
               pha

               stz      TmpBeenMod

               lda      SequenceOn
               bne      UpdateStart
               jsr      AloueSmScreen

UpdateStart    lda      #1
UpdateTmp0     sta      Sequ_NbFrame

UpdateTmp1     jsr      LoadCurFrame
               lda      Frame_Template
               bne      UpdateTmp2
               brl      NextUpdate

UpdateTmp2     lda      #FrameFullName
               sta      nameptr
               lda      #^FrameFullName
               sta      nameptr+2

               jsr      OpenFile
               bcs      NextUpdate

               lda      OpenID
               sta      WriteID
               sta      CloseID
               sta      GetEofID
               sta      SetMarkID

*               Enregistre small bitmap

               jsr      MkSmallFrame

               jsr      D_SmallSc
               lda      SmScreenPtr
               sta      WriteDest
               lda      SmScreenPtr+2
               sta      WriteDest+2

               lda      #2000
               sta      writelg
               stz      writelg+2
               jsr      WriteFile
               bcs      OnEstMal

               _GetEof GetEofParams
               bcs      OnEstMal
               lda      GetEofPos
               sta      SetMarkPos
               lda      GetEofPos+2
               sta      SetMarkPos+2

               _SetMark SetMarkParams
               bcs      OnEstMal

               bra      OkClose

OnEstMal       anop
               jsr      U_SmallSc
               _Close CloseParams
               bra      NextUpdate

OkClose        jsr      U_SmallSc
               _Close CloseParams

NextUpdate     lda      Sequ_NbFrame
               cmp      Sequ_HmFrame
               beq      EndUpdate
               inc      a
               brl      UpdateTmp0

EndUpdate      lda      SequenceOn
               bne      ResetNbF
               jsr      DisposeSmSc

ResetNbF       pla
               sta      Sequ_NbFrame

               _InitCursor

UpdateTmpExit  rts

******************************************************************
*
*  Trouve le nom du fichier a charger : dans x numero du fichier
*
******************************************************************
FindRightName ENTRY

               phx

               lda      BeenModified,x
               and      #$00FF
               beq      LoadSource
               jsr      CopyFFToFrame
               bra      FindRight1
LoadSource     jsr      SeqInFrameF
FindRight1     jsr      PutThe000

               plx
               rts

FindTempName   ENTRY

               lda      BeenModified
               and      #$00FF
               beq      LoadSourceTmp
               jsr      CopyFFToFrame
               bra      FindRightTmp1
LoadSourceTmp  jsr      SeqInFrameF
FindRightTmp1  jsr      PutTheTmp

               rts

**************************************************************
*
*              Detruit le fichier de travail
*
**************************************************************
KillWorkAndCCP ENTRY

               _WaitCursor

               ldx      #999
               jsr      KillThisWork    ; detruit le fichier scrap
                    
KillWorkFile   ENTRY

               _WaitCursor

               sep      #$30
               longa    off
               longi    off

               ldx      #0

KillTryNext    lda      WorkModified,x
               cmp      #1
               bne      KillNext
               jsr      KillThisWork

KillNext       inx
               cpx      #100
               bcc      KillTryNext

               rep      #$30
               longa    on
               longi    on

               _InitCursor

               rts

***************************************************************
*
*              Donne un nom pour la sequence
*
***************************************************************
GetNewFName    ENTRY

               PushLong #0
               _GetPort
               pla
               sta      SEPortTemp
               pla
               sta      SEPortTemp+2

               PushWord #20
               PushWord #20
               PushLong #SEGiveName
               PushLong #0
               PushWord #12
               PushLong #reply
               _SFPutFile

               PushLong SEPortTemp
               _SetPort

               lda      reply_good
               bne      DoCopyName
               brl      GetNewFError

DoCopyName     anop
               lda      SEScrapOn
               beq      DoCopyName1
               jsr      CopyScrapBuf
               bcc      DoCopyName1
               stz      SEScrapOn
               bra      GetNewFError

DoCopyName1    jsr      CopyRepToFNam
               jsr      ChangeFNames
               jsr      CopyBeenToWMod
               jsr      KillWorkFile
               jsr      InitBeenMod

               lda      #0
               sta      SERevertOn

               clc                      ; ok
GetNewFExit    rts

GetNewFError   sec                      ; ko
               rts

*****************************************************************
*
*              Routine appelee par Next Frame et par SeNewAct
*
*****************************************************************
SENewAct1      ENTRY

               _WaitCursor

               jsr      FindNumber
               tax
               beq      NewAct1Ko

               lda      Sequ_HMFrame
               cmp      #99
               bcs      NewAct1Ko
               inc      a
               sta      Sequ_HMFrame

               phx
               inc      Sequ_NbFrame    ; on insere apres la selection
               jsr      SEFInsert
               jsr      OkClearFrame1

               sep      #$20
               longa    off
               plx
               lda      Sequ_NbFrame
               sta      Sequ_FileNum,x
               sta      FrameNewNum,x   ; pour affichage du numero et renum
               rep      #$20
               longa    on

               jsr      SaveCurFrame
               bcc      NewAct1Ok

               sep      #$20            ; annule !!!!!!
               longa    off
               lda      #$FF
               sta      Sequ_FileNum,x
               sta      FrameNewNum,x   ; pour affichage du numero et renum
               rep      #$20
               longa    on
               jsr      SEFDelete
               dec      Sequ_HMFrame
               dec      Sequ_NbFrame
               jsr      LoadCurFrame    ; undo le clearframe1

NewAct1Ko      _InitCursor
               sec
               rts

Newact1Ok      _InitCursor
               clc
               rts

******************************************************
*
*              Cree petite image
*
******************************************************
AloueSmScreen  ENTRY

               lda      SEAloueSmOn
               bne      AloueSmScrts

               PushLong #0              ; space for handle
               PushLong #2000           ; 2000 octets
               PushWord MyID
               PushWord #$0010          ; No cross bank boundaries
               PushLong #$0
               _NewHandle

               pla
               sta SmallScreen
               plx
               stx SmallScreen+2

               lda      #1
               sta      SEAloueSmOn

AloueSmScRts   rts

DisposeSmSc    ENTRY

               lda      SEAloueSmOn
               beq      DisposeSmRts

               PushLong SmallScreen
               _DisposeHandle

               stz      SEAloueSmOn

DisposeSmRts   rts

*******************************************************
*
*              Cree petite frame
*
*******************************************************
MkSmallFrame   ENTRY

               PushLong #0
               _GetPort
               pla
               sta      SEPortTemp
               pla
               sta      SEPortTemp+2

               lda      #1
               sta      Top_BitMap
               sta      Force_Bitmap
               jsl      Maj_FrameW

               PushLong SEPortTemp
               _SetPort

               jsr      D_SmallSc

               PushLong #FondLocInfo
               PushLong #SmScreenBlock
               PushLong #SmSourceRect
               PushLong #SmScreenRect
               PushWord #0              ; copy mode
               PushLong #0              ; no clip region
               _CopyPixels

               jsr      U_SmallSc

               rts

*              Deref SmallScreen

D_SmallSc      ENTRY

               lda      SmallScreen
               ldx      SmallScreen+2
               jsr      Deref
               sta      SmScreenPtr
               stx      SmScreenPtr+2

               rts

*              Unlock SmallScreen

U_SmallSc      ENTRY

               lda      SmallScreen
               ldx      SmallScreen+2
               jsr      UnLock

               rts

****************************************************************
*
*              Trouve le numero du fichier : dans x en sortie
*              en foncion du numero de la frame :dans x en entree
*
****************************************************************
FindFileNum    ENTRY

               php
               rep      #$30

               txa
               ldx      #1
               sep      #$20

FindFileNNext  cmp      Sequ_FileNum,x
               beq      SetTxtFndNum
               inx
               cpx      #100
               bcc      FindFileNNext

SetTxtFndNum   plp
               rts

****************************************************************
*
*              Place le numero du fichier dans le titre
*              dans x le numero du fichier
*
****************************************************************
SetTxtNumber   ENTRY

               phx
               lda      #^FrameFullName
               pha
               lda      FrameFullName
               and      #$00FF
               dec      a
               dec      a
               clc
               adc      #FrameFullName
               pha
               pea      3               ; trois caracteres
               pea      0
               _Int2Dec

               lda      FrameFullName
               and      #$00FF
               dec      a
               dec      a
               tax
               lda      FrameFullName,x
               ora      #$1010          ; remplace les blancs par des zeros !!
               sta      FrameFullName,x

               rts

****************************************************************
*
*        Is_ScrollBar : traite la Scroll Bar
*
****************************************************************
SEScrollProc   ENTRY
               Using GlobalData

               phb                      | sauve registres
               phd

               phk
               plb                      | met Data Bank

               lda 13,s                 |Command
               asl a
               tax
               jsr (TabScrollCmd,x)

               pld                      | remet a jour direct bank
               plb                      | data bank

               lda 0,s
               sta 8,s
               lda 2,s
               sta 10,s

               tsc
               clc
               adc #8
               tcs

               rtl

***************************************

TabScrollCmd   ANOP
               dc i'0'
               dc i'InitView'
               dc i'initTotal'
               dc i'InitValue'
               dc i'LineUp'
               dc i'LineDown'
               dc i'PageUp'
               dc i'PageDown'
               dc i'Thumb'
;--
InitView       ANOP
               lda #4
               sta 17,s
               rts
;--
InitTotal      ANOP
               lda Nb_FileSeq
               sta 17,s
               rts
;--
InitValue      ANOP
               lda SECurrentVal
               sta 17,s
               rts
;--
LineUp         ANOP

               PushWord #0
               PushLong DlgSeqEdPtr
               PushWord SEScrollBar
               _GetDItemValue
               pla
               beq SlineUp
               dec a
               sta 17,s
               sta SECurrentVal
               tax

               phd
               lda MyZP
               tcd
               txa
               jsr      ScrollUp
               jsr      EqualNumLast
               jsr      SESelFrame
               pld
               rts

SLineUp        sta 17,s
               sta SECurrentVal
               rts

PageUP         ANOP

               PushWord #0
               PushLong DlgSeqEdPtr
               PushWord SEScrollBar
               _GetDItemValue
               pla
               beq SPageUp
               dec a
               dec a
               dec a
               dec a
               bpl PageUp0
               lda #0
PageUp0        sta 17,s
               sta SECurrentVal
               tax

               phd
               lda MyZP
               tcd
               txa
               jsr      DrawSmScreens
               jsr      EqualNumLast
               jsr      SESelFrame
               pld
               rts

SPageUp        sta 17,s
               sta SECurrentVal
               rts

LineDown       ANOP

               PushWord #0
               PushLong DlgSeqEdPtr
               PushWord SEScrollBar
               _GetDItemValue
               pla
               inc a
               cmp SEPageEnd
               bcs SlineDown

               sta 17,s
               sta SECurrentVal
               tax

               phd
               lda MyZP
               tcd
               txa
               jsr      ScrollDown
               jsr      EqualNumLast
               jsr      SESelFrame
               pld
               rts

SLineDown      dec a
               sta 17,s
               sta SECurrentVal
               rts

PageDown       ANOP

               PushWord #0
               PushLong DlgSeqEdPtr
               PushWord SEScrollBar
               _GetDItemValue
               pla
               inc a
               inc a
               inc a
               inc a
               cmp SEPageEnd
               bcc SPageDown

               lda SEPageEnd
               dec a

SPageDown      sta 17,s
               sta SECurrentVal
               tax

               phd
               lda MyZP
               tcd
               txa
               jsr      DrawSmScreens
               jsr      EqualNumLast
               jsr      SESelFrame
               pld
               rts

Thumb          ANOP

               PushWord #0
               PushLong DlgSeqEdPtr
               PushWord SEScrollBar
               _GetDItemValue
               pla
               sta 17,s
               sta SECurrentVal
               tax

               phd
               lda MyZP
               tcd

               txa

               jsr      DrawSmScreens
               jsr      EqualNumLast
               jsr      SESelFrame

               pld

               rts

***********************************************************
*
*              procedure de definition de l'item Ecran
*
***********************************************************

SEAffProc      ENTRY

               phb                      ; sauve registres
               phd

               phk
               plb                      ; met Data Bank

               PushWord #0
               PushLong DlgSeqEdPtr
               PushWord SEScrollBar
               _GetDItemValue
               plx

               lda      MyZp
               tcd

               txa

               jsr      DrawSmScreens
               lda      #SETimePause
               sta      SEPauseFlip
               lda      Sequ_NbFrame
               sta      SELastValue
               stz      SECurretOn

               pld                      ; remet a jour direct bank
               plb                      ; data bank

               lda      0,s
               sta      6,s
               lda      2,s
               sta      8,s

               tsc
               clc
               adc      #6
               tcs

               rtl

****************************************
*
*              Load Frame
*         from dynamic segment
*
****************************************
LoadDynFrame   ENTRY

               phb
               phk
               plb

               jsr      LoadCurFrame

               plb
               rtl

****************************************
*
*              Save Frame
*         from dynamic segment
*
****************************************
SaveDynFrame   ENTRY

               phb
               phk
               plb

               jsr      SaveCurFrame

               plb
               rtl

               END

*******************************************************
*
*              Enregistre la frame courrante
*
*******************************************************
SaveCurFrame   START
               USING    SeqEditData
               USING    GlobalData
               USING    ProdosData

               lda      #$F1
               sta      FrameType

               lda      #MLNormal
               sta      SEModeSave

               jsr      CopyFFToFrame   ; toujours fichier de travail
               jsr      PutThe000

               ldx      Sequ_NbFrame
               jsr      FindFileNum
               jsr      SetTxtNumber

               jsr      EntryTheSave
               bcc      SaveCurOk
SaveCurKo      rts

SaveCurOk      sep      #$20
               longa    off
               ldx      Sequ_NbFrame
               jsr      FindFileNum
               lda      #1
               sta      BeenModified,x
               rep      #$20
               longa    on

               lda      #1
               sta      Top_actionG
               stz      Top_Action
               clc
               rts

CopyTheSave    ENTRY                    ; le texte est deja selectionne

               ldx      Sequ_NbFrame
               jsr      FindFileNum
               jsr      SetTxtNumber

               lda      #MLCopy
               sta      SEModeSave

               bra      EntryTheSave

SaveCCPFrame   ENTRY

               lda      #MLCopy
               sta      SEModeSave

               jsr      CopyFFToFrame   ; toujours fichier de travail
               jsr      PutTheCCP

               bra      EntryTheSave

SaveReplyPath  ENTRY

               lda      #MLCopy
               sta      SEModeSave

               jsr      CopyRFToFrame
               lda      #FrameFullName
               sta      <Ptr_PZero
               lda      #^FrameFullName
               sta      <Ptr_PZero+2
               lda      #SEWorkTxt
               sta      <Ptr_PUn
               lda      #^SEWorkTxt
               sta      <Ptr_PUn+2
               jsr      ChangeAName
               jsr      PutTheCCP

               bra      EntryTheSave

SaveOneFrame   ENTRY                    ; X en entree = numero du fichier

               lda      #MLNormal       ; recalcule l'image
               sta      SEModeSave

               phx
               jsr      CopyFFToFrame   ; toujours fichier de travail
               jsr      PutThe000
               plx
               jsr      SetTxtNumber

               bra      EntryTheSave

SaveTemplate   ENTRY

               lda      #MLTemplate
               sta      SEModeSave

EntryTheSave   _WaitCursor

               lda      #FrameFullName
               sta      nameptr
               lda      #^FrameFullName
               sta      nameptr+2
               lda      FrameType
               sta      Createfiletype

CreonsLe       ANOP
               jsr      CreateFile
               bcc      OuvronsLe
GoDehors       brl      Dehors

OuvronsLe      jsr      OpenFile
               bcs      GoDehors

OkOpen         anop
               lda      OpenID
               sta      WriteID
               sta      CloseID

*               Enregistre small bitmap

               lda      SEModeSave
               cmp      #MLTemplate
               beq      SMSuite1

               pha
               lda      SequenceOn
               bne      PasDalloc
               jsr      AloueSmScreen
PasDalloc      pla
;--------------------------------------
               ldx Top_debug_sas
               bne CreateSmall
;--------------------------------------
               cmp      #MLCopy
               beq      WriteTheSmall

CreateSmall    jsr      MkSmallFrame

WriteTheSmall  jsr      D_SmallSc
               lda      SmScreenPtr
               sta      WriteDest
               lda      SmScreenPtr+2
               sta      WriteDest+2

               lda      #2000
               sta      writelg
               stz      writelg+2
               jsr      WriteFile
               bcc      SmSuite1
               jsr      U_SmallSc
               brl      OnDelete

*              Enregistre Frame Record

SmSuite1       jsr      U_SmallSc

               lda      #FrameRecord
               sta      WriteDest
               lda      #^FrameRecord
               sta      WriteDest+2

               lda      Lg_FrameRecord
               sta      writelg
               stz      writelg+2
               jsr      WriteFile
               bcc      SmSuite2
               brl      OnDelete

*              Enregistre Bitmap si il y en a.

SmSuite2       lda      Frame_BackG
               bpl      SmSuite4

               jsr      D_Hdl_Bitmap
               sta      WriteDest
               stx      WriteDest+2

               lda      #$7D00
               sta      writelg
               stz      writelg+2
               jsr      WriteFile
               bcc      SmSuite3
               jsr      U_Hdl_Bitmap
               brl      OnDelete
SmSuite3       jsr      U_Hdl_BitMap

*              Enregistre border s'il y en a.

SmSuite4       lda      Frame_Border
               beq      SmSuite6

               jsr      D_Hdl_Border
               sta      WriteDest
               stx      WriteDest+2

               lda      #$268
               sta      writelg
               stz      writelg+2
               jsr      WriteFile
               bcc      SmSuite5
               jsr      U_Hdl_Border
               brl      OnDelete
SmSuite5       jsr      U_Hdl_Border

*              Enregistre shapes

SmSuite6       lda      Frame_Shape
               beq      SmSuite8

               pea      0
               pea      0
               pha
               PushWord Lg_ShapeRecord
               _Multiply
               pla
               sta      Writelg
               pla
               sta      WriteLg+2

               jsr      D_Hdl_Shape
               sta      WriteDest
               stx      WriteDest+2
               jsr      WriteFile
               bcc      SmSuite7
               jsr      U_Hdl_Shape
               brl      OnDelete
SmSuite7       jsr      U_Hdl_Shape

*              Enregistre graphiques

SmSuite8       lda      Frame_Graph
               beq      SmSuite10

               pea      0
               pea      0
               pha
               PushWord Lg_GraphRecord
               _Multiply
               pla
               sta      Writelg
               pla
               sta      WriteLg+2

               jsr      D_Hdl_Graph
               sta      WriteDest
               stx      WriteDest+2
               jsr      WriteFile
               bcc      SmSuite9
               jsr      U_Hdl_Graph
               brl      OnDelete
SmSuite9       jsr      U_Hdl_Graph

*              Enregistre icones

SmSuite10      lda      Frame_Icon
               beq      SmSuite12

               pea      0
               pea      0
               pha
               PushWord Lg_IconRecord
               _Multiply
               pla
               sta      Writelg
               pla
               sta      WriteLg+2

               jsr      D_Hdl_BIcon
               sta      WriteDest
               stx      WriteDest+2

               jsr      WriteFile
               bcc      SmSuite11
               jsr      U_Hdl_BIcon
               brl      OnDelete
SmSuite11      jsr      U_Hdl_BIcon

*              Enregistre lignes de texte

SmSuite12      lda      Frame_Line
               beq      SmSuite14

               pea      0
               pea      0
               pha
               PushWord Lg_LineRecord
               _Multiply
               pla
               sta      Writelg
               pla
               sta      WriteLg+2

               jsr      D_Hdl_Line
               sta      WriteDest
               stx      WriteDest+2

               jsr      WriteFile
               bcc      SmSuite13
               jsr      U_Hdl_Line
               brl      OnDelete
SmSuite13      jsr      U_Hdl_Line

*              Enregistre les stickers

SmSuite14      lda      Frame_Sticker
               beq      SmSuite16

               pea      0
               pea      0
               pha
               PushWord Lg_StickerRecord
               _Multiply
               pla
               sta      Writelg
               pla
               sta      WriteLg+2

               jsr      D_Hdl_Sticker
               sta      WriteDest
               stx      WriteDest+2

               jsr      WriteFile
               bcc      SmSuite15
               jsr      U_Hdl_Sticker
               brl      OnDelete
SmSuite15      jsr      U_Hdl_Sticker

*              Enregistre les ordres series

SmSuite16      lda      Frame_Serie
               beq      SmSuite18

               lda      #802
               sta      Writelg
               stz      Writelg+2

               lda      Hdl_Orders
               ldx      Hdl_Orders+2
               jsr      Deref
               sta      WriteDest
               stx      WriteDest+2
               jsr      WriteFile
               bcc      SmSuite17
               lda      Hdl_Orders
               ldx      Hdl_Orders+2
               jsr      Unlock
               brl      OnDelete

SmSuite17      lda      Hdl_Orders
               ldx      Hdl_Orders+2
               jsr      UnLock

SmSuite18      brl      OkClose

OnDelete       _Close CloseParams       |ca va mal on CLOSE et on DELETE

               lda      #FrameFullName
               sta      DestroyNamePtr
               lda      #^FrameFullName
               sta      DestroyNamePtr+2

               _Destroy DestroyParams

               lda      SEModeSave
               cmp      #MLTemplate
               beq      Dehors
               cmp      #MLCopy
               beq      Dehors

               lda      SequenceOn
               bne      Dehors
               jsr      DisposeSmSc

;--
DEHORS         ANOP
               _InitCursor
               sec
               rts
;--
OkClose        anop
               _Close CloseParams       |le ferme

               _InitCursor

               lda      SEModeSave
               cmp      #MLTemplate
               beq      OkRts
               cmp      #MLCopy
               beq      OkRts

               lda      SequenceOn
               bne      OkRts
               jsr      DisposeSmSc

OkRts          clc
               rts

               END

*****************************************************
*
*              load the current frame
*
*****************************************************
LoadCurFrame   START
               USING    SeqEditData
               USING    GlobalData
               USING    ProdosData

               lda      #MLNormal
               sta      SEModeLoad


               ldx      Sequ_NbFrame
               jsr      FindFileNum
               jsr      FindRightName   ; conserve X
               jsr      SetTxtNumber

               bra      EntryTheLoad

CopyTheLoad    ENTRY

               ldx      Sequ_NbFrame
               jsr      FindFileNum
               jsr      FindRightName   ; conserve X
               jsr      SetTxtNumber  

               lda      #MLCopy
               sta      SEModeLoad

               bra      EntryTheLoad

LoadCCPFrame   ENTRY                    ; charge le fichier du buffer CCPaste

               lda      #MLNormal       ; ne charge pas l'image
               sta      SEModeLoad

               jsr      CopyFFToFrame
               jsr      PutTheCCP

               bra      EntryTheLoad

LoadOneFrame   ENTRY                    ; avant de faire un SaveOneFrame

*              X est en entree le numero du fichier

               lda      #MLCopy
               sta      SEModeLoad

               jsr      FindRightName   ; conserve X
               jsr      SetTxtNumber

               bra      EntryTheLoad

LoadNamedTmp   ENTRY                    ; nom dans frameFullName

               lda      #MLTemplate
               sta      SEModeLoad

               bra      EntryTheLoad

LoadTemplate   ENTRY

               lda      #MLTemplate
               sta      SEModeLoad

               jsr      FindTempName

EntryTheLoad   _WaitCursor

               lda      #FrameFullName
               sta      nameptr
               lda      #^FrameFullName
               sta      nameptr+2

OuvronsLe      jsr      OpenFile
               bcc      OkOpen
               brl      DEHORS

OkOpen         anop
               lda      OpenID
               sta      ReadID
               sta      CloseID
               sta      SetMarkID

               jsr      Eff_Border
               jsl      Eff_Bitmap      ; dealloue les buffer

               lda      SEModeLoad
               cmp      #MLTemplate
               beq      SMSuite1
               cmp      #MLCopy
               bne      LoadCur0

LoadTheSmall   anop

               lda      SequenceOn
               bne      LoadSmall

               jsr      AloueSmScreen

LoadSmall      jsr      D_SmallSc
               lda      SmScreenPtr
               sta      ReadDest
               lda      SmScreenPtr+2
               sta      ReadDest+2

               lda      #2000
               sta      Readlg
               stz      Readlg+2
               jsr      ReadFile
               php
               jsr      U_SmallSc
               plp
               bcc      SmSuite1
               brl      KoClose

LoadCur0       lda      #2000
               sta      SetMarkPos
               stz      SetMarkPos+2
               _SetMark SetMarkParams
               bcc      SmSuite1
               brl      KoClose

*              Load Frame Record

SmSuite1       lda      #FrameRecord
               sta      ReadDest
               lda      #^FrameRecord
               sta      ReadDest+2

               lda      Lg_FrameRecord
               sta      ReadLg
               stz      ReadLg+2
               jsr      ReadFile
               bcc      SmSuite2
               brl      KoClose

*              Load Bitmap si il y en a.

SmSuite2       lda      Frame_BackG
               bpl      SmSuite4

               jsr      Alloc_Bitmap

               jsr      D_Hdl_Bitmap
               sta      ReadDest
               stx      ReadDest+2

               lda      #$7D00
               sta      Readlg
               stz      Readlg+2
               _Read ReadParams
               bcc      SmSuite3
               jsr      U_Hdl_Bitmap
               brl      KoClose

SmSuite3       jsr      U_Hdl_BitMap

*              Load border s'il y en a.

SmSuite4       lda      Frame_Border
               beq      SmSuite6

               jsr      alloc_Border

               jsr      D_Hdl_Border
               sta      ReadDest
               stx      ReadDest+2

               lda      #$268
               sta      Readlg
               stz      Readlg+2
               jsr      ReadFile
               bcc      SmSuite5
               jsr      U_Hdl_Border
               brl      KoClose

SmSuite5       jsr      U_Hdl_Border

*              Load shapes

SmSuite6       jsr      Resize_Shape
               lda      Frame_Shape
               beq      SmSuite8

               pea      0
               pea      0
               pha
               PushWord Lg_ShapeRecord
               _Multiply
               pla
               sta      Readlg
               pla
               sta      ReadLg+2

               jsr      D_Hdl_Shape
               sta      ReadDest
               stx      ReadDest+2
               jsr      ReadFile
               bcc      SmSuite7
               jsr      U_Hdl_Shape
               brl      KoClose

SmSuite7       jsr      U_Hdl_Shape

*              Load graphiques

SmSuite8       jsr      Resize_Graph
               lda      Frame_Graph
               beq      SmSuite10

               pea      0
               pea      0
               pha
               PushWord Lg_GraphRecord
               _Multiply
               pla
               sta      Readlg
               pla
               sta      ReadLg+2

               jsr      D_Hdl_Graph
               sta      ReadDest
               stx      ReadDest+2
               jsr      ReadFile
               bcc      SmSuite9
               jsr      U_Hdl_graph
               brl      KoClose

SmSuite9       jsr      U_Hdl_Graph

*              Load icones

SmSuite10      jsr      Resize_Icon
               lda      Frame_Icon
               beq      SmSuite12

               pea      0
               pea      0
               pha
               PushWord Lg_IconRecord
               _Multiply
               pla
               sta      Readlg
               pla
               sta      ReadLg+2

               jsr      D_Hdl_BIcon
               sta      ReadDest
               stx      ReadDest+2
               jsr      ReadFile
               bcc      SmSuite11
               jsr      U_Hdl_BIcon
               brl      KoClose

SmSuite11      jsr      U_Hdl_BIcon

*              Load lignes de texte

SmSuite12      jsr      Resize_Line
               lda      Frame_Line
               beq      SmSuite14

               pea      0
               pea      0
               pha
               PushWord Lg_LineRecord
               _Multiply
               pla
               sta      Readlg
               pla
               sta      ReadLg+2

               jsr      D_Hdl_Line
               sta      ReadDest
               stx      ReadDest+2
               jsr      ReadFile
               bcc      SmSuite13
               jsr      U_Hdl_Line
               brl      KoCLose

SmSuite13      jsr      U_Hdl_Line

*              Enregistre les stickers

SmSuite14      jsr      Resize_Sticker
               lda      Frame_Sticker
               beq      SmSuite16

               pea      0
               pea      0
               pha
               PushWord Lg_StickerRecord
               _Multiply
               pla
               sta      Readlg
               pla
               sta      ReadLg+2

               jsr      D_Hdl_Sticker
               sta      ReadDest
               stx      ReadDest+2
               jsr      ReadFile
               bcc      SmSuite15
               jsr      U_Hdl_Sticker
               brl      KoClose

SmSuite15      jsr      U_Hdl_Sticker

*              Load Serial Orders

SmSuite16      lda      Frame_Serie
               beq      SmSuite18

               lda      #802
               sta      Readlg
               stz      ReadLg+2

               lda      Hdl_Orders
               ldx      Hdl_Orders+2
               jsr      Deref
               sta      ReadDest
               stx      ReadDest+2
               jsr      ReadFile
               bcc      SmSuite17
               lda      Hdl_Orders
               ldx      Hdl_Orders+2
               jsr      Unlock
               brl      KoClose

SmSuite17      lda      Hdl_Orders
               ldx      Hdl_Orders+2
               jsr      Unlock

SmSuite18      bra      OkClose

KoClose        anop

               _Close CloseParams

               lda      SEModeLoad
               cmp      #MLTemplate
               beq      Dehors
               cmp      #MLCopy
               bne      Dehors

               lda      SequenceOn
               bne      Dehors
               jsr      DisposeSmSc

DEHORS         anop
               _InitCursor
               sec
               rts

OkClose        anop
               _Close CloseParams       |le ferme

               lda      SEModeLoad
               cmp      #MLTemplate
               beq      Okclose2
               cmp      #MLCopy
               bne      OkClose2

               lda      SequenceOn
               bne      OkClose2
               jsr      DisposeSmSc

OkClose2       _InitCursor

               clc
               rts

               END
