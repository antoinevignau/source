*
*              Data de l'editeur de sequences
*

SeqEditData    DATA

RefConSeqEd    equ 47
SEActif        equ 0
SEInActif      equ 255
SETimePause    equ 18

MLNormal       equ 0
MLTemplate     equ 1
MLCopy         equ 2

NePasDessiner  ds 2

SEScrapOn      ds 2
SERevertOn     ds 2
SEModeLoad     ds 2
SEModeSave     ds 2
SEFatalError   ds 2
SEItemHit      ds 2
QuitSeqEd      ds 2
Nb_FileSeq     ds 2
TmpBeenMod     ds 2
SENumPattern   ds 2
SEPageEnd      ds 2
SERectNum      ds 2
SECurrentVal   ds 2
SELastValue    ds 2
SEPenMode      ds 2
SEPauseFlip    ds 2
SECurretOn     ds 2
SESelVisible   ds 2
SERenumPtr     ds 2
SEAloueSmOn    ds 2
ValidValStart  ds 2
ValidValEnd    ds 2

SELePort       ds 4
SEPortTemp     ds 4
DlgSeqEdPtr    ds 4

SmallScreen    ds 4
SmStartBoucle  ds 2
SmEndBoucle    ds 2
SmRectNumber   ds 2
SmFrameRectNb  ds 2

SeTypeList     dc i1'1,$F2'

SmScreenBlock  dc i1'0'
               dc i1'0'
SmScreenPtr    ds 4
               dc i'40'
SmScreenRect   dc i'0,0,50,80'
SmSourceRect   dc i'0,0,200,320'

SmSelRect      anop
SmRectY        ds 2
SmRectX        ds 2
SmRectY2       ds 2
SmRectX2       ds 2

SEEdit         anop
               dc i'1'                  ; identification number
               dc i'63,254,83,316'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SEEditTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'3'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SECut          anop
               dc i'2'                  ; identification number
               dc i'19,254,32,316'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SECutTxt'          ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SECopy         anop
               dc i'3'                  ; identification number
               dc i'33,254,46,316'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SECopyTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEPaste        anop
               dc i'4'                  ; identification number
               dc i'47,254,60,316'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SEPasteTxt'        ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SERenum        anop
               dc i'5'                  ; identification number
               dc i'87,254,100,316'     ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SERenumTxt'        ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEOpen         anop
               dc i'6'                  ; identification number
               dc i'101,254,114,316'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SEOpenTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SESave         anop
               dc i'7'                  ; identification number
               dc i'115,254,128,316'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SESaveTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SESaveAs       anop
               dc i'8'                  ; identification number
               dc i'129,254,142,316'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SESaveAsTxt'       ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SERevert       anop
               dc i'9'                  ; identification number
               dc i'143,254,156,316'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SERevertTxt'       ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SENew          anop
               dc i'10'                 ; identification number
               dc i'5,254,18,316'       ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SENewTxt'          ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEPrint        anop
               dc i'11'                 ; identification number
               dc i'159,254,172,316'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SEPrintTxt'        ; item descriptor
               dc i'0'                  ; item value
               dc i'2'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEShow         anop
               dc i'12'                 ; identification number
               dc i'177,254,194,316'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SEShowTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'3'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEScrollBar    anop
               dc i'13'                 ; identification number
               dc i'0,240,200,252'      ; display rectangle
               dc i'ScrollBarItem'      ; item type
               dc i4'SEScrollProc'      ; item descriptor
               dc i'0'                  ; item value
               dc i'3'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEAffichage    anop
               dc i'14'                 ; identification number
SeAffRect      dc i'0,0,200,240'        ; display rectangle, en entree de comp.
               dc i'UserItem'           ; item type
               dc i4'SeAffProc'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

SEFrameRect    anop
SEFrame1       dc i'0,0,50,80'
SEFrame2       dc i'0,80,50,160'
SEFrame3       dc i'0,160,50,240'
SEFrame4       dc i'50,0,100,80'
SEFrame5       dc i'50,80,100,160'
SEFrame6       dc i'50,160,100,240'
SEFrame7       dc i'100,0,150,80'
SEFrame8       dc i'100,80,150,160'
SEFrame9       dc i'100,160,150,240'
SEFrame10      dc i'150,0,200,80'
SEFrame11      dc i'150,80,200,160'
SEFrame12      dc i'150,160,200,240'

SEDialFull     dc i'0,0,200,320'
SEAffNRect     dc i'0,0,0,0'

SEAffNTxt      str '00'
SEEditTxt      str 'Edit'
SECutTxt       str 'Cut'
SECopyTxt      str 'Copy'
SEPasteTxt     str 'Paste'
SENewTxt       str 'New'
SEOpenTxt      str 'Open'
SESaveTxt      str 'Save'
SESaveAsTxt    str 'Save as'
SERevertTxt    str 'Revert'
SEPrintTxt     str 'Print'
SERenumTxt     str 'Renum'
SEDoneTxt      str 'Done'
SEShowTxt      str 'Show'
SEGiveName     str 'Name of new sequence ?'
SEOpenSequence str 'Open a sequence'
SEWorkTxt      str 'Sh.wrk'
SEWTempTxt     str 'Sh.wrk.T'
SECCPTxt       str 'Sh.wrkCCP'
SpoolTxt       str 'PrintSpool'

FrameFileName  dc i1'0',15c' '
FrameFullName  dc i1'0',128c' '
RenameFullName dc i1'0',128c' '
FrameFName     dc i1'0',128c' '
Sequ_FullName  dc i1'0',128c' '
SpoolName      dc i1'0',128c' '

BeenModified   dc 100i1'$FF'
WorkModified   dc 100i1'$FF'
FrameNewNum    dc 100i1'$FF'

SESelectPat    dc h'456789AB'
               dc h'56789AB4'
               dc h'6789AB45'
               dc h'789AB456'
               dc h'89AB4567'
               dc h'9AB45678'
               dc h'AB456789'
               dc h'B456789A'
               dc h'456789AB'
               dc h'56789AB4'
               dc h'6789AB45'
               dc h'789AB456'
               dc h'89AB4567'
               dc h'9AB45678'
               dc h'AB456789'
               dc h'B456789A'

               END
