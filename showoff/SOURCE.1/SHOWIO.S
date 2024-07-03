;------------------------------------------------------------------
;
; FILE : SHOWIO.S                       - routines d'acces ProDOS -
;        --------
;------------------------------------------------------------------
;...............................................................
;
;        Bload_Bitmap : charge les Bitmaps des Fenetres
;
;...............................................................
Bload_Bitmap   START
               Using ProdosData
               Using GlobalData

               lda #BMOptionName        |fichier bitmap FENETRE OPTION
               sta nameptr
               lda #^BMOptionName
               sta nameptr+2

               lda #4056
               sta readlg
               stz readlg+2

               lda Hdl_PPI_Option       |Lock
               ldx Hdl_PPI_Option+2
               jsr Deref
               sta ReadDest
               stx ReadDest+2

               jsl Simple_Load          |LOAD SANS VERIF
               bcc ok
               jsr Err_Ressource        |Erreur Prodos
               bcc Bload_Bitmap

               _Quit QuitParams         |BOING !!!!!
;--
ok             jsr U_Hdl_PPI_Opt        |unlock

               rts

               END
;---------------------------------------------------------------
;
; Simple_Load  : chargement d'un fichier
;
;---------------------------------------------------------------
Simple_Load    START
               Using ProdosData

               phb
               phk
               plb

               _WaitCursor

               _OPEN OpenParams         |ouvre le fichier
               bcc cont1
               jmp Error

cont1          anop
               lda OpenID
               sta ReadID
               sta CloseID

               _READ ReadParams         |le lit
               bcc cont2
               jmp Error

cont2          anop
               _Close CloseParams       |le ferme

               _InitCursor
               plb

               clc
               rtl

Error          Pha
               _InitCursor
               pla
               plb

               sec
               rtl
;--------------------------------------
;        Simple_Load2
;--------------------------------------
Simple_Load2   ENTRY
               phb
               phk
               plb

               _WaitCursor
;--
               jsr OpenFile             |ouvre le fichier
               bcc cont12
               jmp Error
;--
cont12         anop
               lda OpenID
               sta ReadID
               sta CloseID

               jsr ReadFile             |le lit
               bcc cont22
               jmp Error
;--
cont22         anop
               _Close CloseParams       |le ferme

               _InitCursor
               plb

               clc
               rtl
;--
               END
;...............................................................
;
;      Load_FileIcon : load en memoire l'icone in acc (00-0n)
;
;...............................................................
Load_FileIcon  START
               Using GlobalData
               Using ProdosData
               Using SelectIdata

               jsr Find_NameIcon

               bra SLoad_FileIcon
;--------------------------------------
Load_FileBorder ENTRY

               PushLong #0              |CalCul le nom de l'icone
               pha
               _HexIt
               pla
               lda namebor
               and #$00FF
               dec a
               tax
               pla
               sta namebor,x

               lda #namebor
               sta NamePtr
               lda #^namebor
               sta NamePtr+2

               lda #$c0
               sta TypeOfIcon

;--------------------------------------
Sload_FileIcon ENTRY

               jsr D_Hdl_FIcon          |le Coince

again          lda Ptr_FIcon            |buffer Icon
               sta adptr                |buffer ou mettre l'image
               lda Ptr_FIcon+2
               sta adptr+2

               _WaitCursor
;--
               jsr Load_pak             |unpack icone bordure
;--
sagain         php
               pha
               _InitCursor
               pla
               plp
;--------------------------------------
               bcc finok
               jsr Err_Ressource        |AFFICHE ERREUR ALERT
               bcc again
               _InitCursor
               jsr U_Hdl_FIcon
               sec                      |ERREUR
               rts
;--------------------------------------
finok          jsr U_Hdl_FIcon          |le libere
;--
;--------------------------------------
;        Copy_Name
;--------------------------------------
Copy_Name      ENTRY

               ldy #14                  |Nom du Fichier sur Page

LOOP1          lda NameIcon,y
               sta NameTxt1,y
               dey
               dey
               bpl LOOP1
;--
               clc
               rts
;--------------------------------------
;        Find_NameIcon
;--------------------------------------
Find_NameIcon  ENTRY
;--
               PushLong #0
               inc a
               pha
               PushWord #140
               _Multiply
               ply
               plx
;--
               ldx #138
               dey
               dey
RLName         lda TableNameIcon,y
               sta NameFIcon,x
               dey
               dey
               dex
               dex
               bpl RLName
;--
               ldx #126
RLFull         lda NameFIcon,x
               sta Reply_FullName,x
               dex
               dex
               bpl RLFull
;--
               lda #NameFIcon
               sta NamePtr
               lda #^NameFIcon
               sta NamePtr+2
;--
               sep #$20
               longa off

               ldy FilePos
               ldx #1
RLName1        lda NameFIcon,y
               sta NameIcon,x
               iny
               inx
               cpx FileLg
               bcc RLName1
               beq RLName1

               lda FileLg
               sta NameIcon

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        Load_Titre
;
;...............................................................
Load_Titre     START
               Using GlobalData
               Using ProdosData

Show_Broder    ENTRY

               jsr alloc_BitMap

               jsr D_Hdl_Bitmap

               lda #NameBroder
               sta NamePtr
               lda #^NameBroder
               sta NamePtr+2

               lda Ptr_Bitmap
               sta AdPtr
               lda Ptr_Bitmap+2
               sta AdPtr+2

               jsr Load_Pak1            |charge l'image

               jsr LoadSet_Color

               jsr Copie_Titre

               rts
;--
Show_Showoff   ENTRY

               lda #NameShowoff
               sta NamePtr
               lda #^NameShowoff
               sta NamePtr+2

               lda Ptr_Bitmap
               sta AdPtr
               lda Ptr_Bitmap+2
               sta AdPtr+2

               jsr Load_Pak1            |charge l'image

               jsr LoadSet_Color

               jsr Copie_Titre

               jsr Dealloc_BitMap

               rts
;--
Copie_Titre    ENTRY

               lda #$E12000
               sta Ptr_Pzero
               lda #^$E12000
               sta Ptr_Pzero+2

               ldy #$7CFE
Loop           lda [Ptr_Bitmap],y
               sta [Ptr_Pzero],y
               dey
               dey
               bpl Loop

               rts
;--
LoadSet_Color  ENTRY

               jsr Alloc_PBuffer        |buffer de decompactage
               jsr D_Hdl_Pbuffer        |le coince
;--
               _OPEN OpenParams
               bcc cont0
               jmp err_pak

cont0          anop
               lda OpenID
               sta ReadID
               sta CloseID

               lda Ptr_Pbuffer
               sta ReadDest
               lda Ptr_Pbuffer+2
               sta ReadDest+2

               lda #$20                 |Only Palette
               sta readlg
               stz readlg+2

cont1          _READ ReadParams
               bcc cont2
               jmp err_pak1

cont2          _Close CloseParams

               PushWord #0              |palette zero
               PushLong Ptr_PBuffer
               _SetColorTable

               jsr Dealloc_Pbuffer      |deallouer buffer decompactage

               clc

exit           rts
;--
err_pak1       pha
               _Close CloseParams       |Erreur mais on CLOSE
               pla
err_pak        pha
               jsr Dealloc_Pbuffer
               pla
               sec

               rts

               END
;...............................................................
;
;        load_pak : charge image en Ptr_GEN nom en nameptr de read
;
;...............................................................
load_pak       START
               Using GlobalData
               Using ProdosData
;--
               lda TypeOfIcon           |type $c0 compacte
               cmp #$c0                 |     $c1 ecran 32 k
               beq Load_Pak1
;--
LoadEcran32k   lda #$7D00
               sta readlg
               lda #0
               sta Readlg+2
;-
               lda Ptr_FIcon
               sta ReadDest
               lda Ptr_FIcon+2
               sta ReadDest+2
               jsl Simple_Load
               rts
;--
Load_Pak1      ENTRY
               jsr Alloc_PBuffer        |buffer de decompactage
               jsr D_Hdl_Pbuffer        |le coince
;--
               _OPEN OpenParams
               bcc cont0
               jmp err_pak

cont0          anop
               lda OpenID
               sta ReadID
               sta CloseID
               sta SetMarkID

               lda #$7d00               |160 * 200 octets
               sta PicSize

               lda Ptr_Pbuffer
               sta ReadDest
               lda Ptr_Pbuffer+2
               sta ReadDest+2

               lda #512                 |longueur buffer
               sta readlg
               stz readlg+2

               lda #$222                |pos sur packed image
               sta SetMarkPos
               stz SetMarkPos+2

Unpackloop     _SETMARK SetMarkParams
               bcc cont1
               jmp err_pak1

cont1          _READ ReadParams
               bcc cont2
               jmp err_pak1

cont2          PushWord #0              ; space for result
               PushLong Ptr_PBuffer
               PushWord #512
               PushLong #adPtr          ; These get changed by UnPackBytes
               PushLong #PicSize

               _UnPackBytes

               pla                      ; Add the number of source bytes that
               clc                      ; we unpacked to the file offset.
               adc SetMarkpos
               sta SetMarkpos
               lda setmarkpos+2
               adc #0
               sta SetMarkpos+2         ; new starting loc.

               lda PicSize              ; done?
               bne UnPackLoop

               _Close CloseParams

               jsr Dealloc_Pbuffer      |deallouer buffer decompactage
               clc
exit           rts
;--
err_pak1       pha
               _Close CloseParams       |Erreur mais on CLOSE
               pla
err_pak        pha
               jsr Dealloc_Pbuffer
               pla
               sec

               rts

               END
;...............................................................
;
; DoSaveBitmap : Sauve la Page au Format PAINTWORK 32 K
;
;...............................................................
DoSaveBitMap   START
               Using GlobalData
               Using WindowData
               Using ProdosData

               PushWord #20
               PushWord #20
               PushLong #TxSaveBitmap
               PushLong #0
               PushWord #15
               PushLong #reply
               _SFPutFile

               lda reply_good
               bne DoSaveBitmap1
               rts
;--
DoSaveBitmap1  ENTRY

               lda #1
               sta Top_BitMap
               sta Force_BitMap

               jsr swap_palette         |palette standard

               PushLong #PortFond       |port = port fond
               _SetPort

               PushLong #FullRect       |tout le port
               _ClipRect

               jsl maj_FrameW           |le calcule

               jsr Save_Bitmap          |sauve bitmap

               php
;--
finsave        jsr Swap_palette

               plp                      |STATUS CARRY +++

               rts

               END
;...............................................................
;
;        Save_Bitmap : sauve la bitmap
;
;...............................................................
Save_Bitmap    START
               Using GlobalData
               Using ProdosData
;--
               _WaitCursor              |la montre
;--
               lda #reply_fullname      |init open create
               sta nameptr
               lda #^reply_fullname
               sta nameptr+2
               lda #$c1
               sta Createfiletype
;--
OuvronsLe      _OPEN OpenParams         |ouvre le fichier
               bcc OkOpen
;--
CreonsLe       ANOP
               jsr CreateFile
               bcc OuvronsLe
               bra DEHORS
;--
OkOpen         anop
               lda OpenID
               sta WriteID
               sta CloseID
;--
               lda ptr_Fond             |Write 32000 OCTETS
               sta WriteDest
               lda ptr_Fond+2
               sta WriteDest+2

               lda #$7D00               |la bitmap 32000 octets
               sta writelg
               stz writelg+2

               jsr WriteFile
               bcc Lereste
               bra OnDelete
;--
lereste        lda #$E19D00             |768 octets de palette
               sta WriteDest
               lda #^$E19D00
               sta WriteDest+2

               lda #$300
               sta writelg
               stz writelg+2

               jsr WriteFile
               bcc OkClose
;--
OnDelete       _Close CloseParams       |ca va mal on CLOSE et on DELETE

               lda NamePtr
               sta DestroyNamePtr
               lda NamePtr+2
               sta DestroyNamePtr+2

               _Destroy DestroyParams
;--
DEHORS         ANOP
               _InitCursor
               sec
               rts
;--
OkClose        anop
               _Close CloseParams       |le ferme

               _InitCursor

               clc
               rts

               END
;...............................................................
;
;        Read volume text : lit le nom du volume dans NamePtr
;
;...............................................................
ReadVolTxt     START
               USING ProdosData

               lda NamePtr
               sta Ptr_PZero
               lda NamePtr+2
               sta Ptr_PZero+2

               sep #$30
               longa off
               longi off

               lda #6
               sta AltVolTxt            ; remet longueur de insert

               ldx #0
               ldy #1

NextRead       lda [Ptr_Pzero],y
               cmp #'1'
               beq TestSquiz
               cmp #'/'
               beq IsItEnd

StockeLettre   inx
               sta VolumeTxt,x
               iny
               bra NextRead

TestSquiz      cpy #1
               bne StockeLettre
               dey

CopyNSq        lda Tx_ErrRes,y
               sta AltVolTxt,y
               iny
               cpy #20
               bcc copyNSq              ; copie : insert system disk

               bra ReadVolExit

IsItEnd        cpy #3
               bcc StockeLettre

               inx                      ; pour le blanc
               txa
               clc
               adc AltVolTxt
               sta AltVolTxt            ; remet longueur AltVolTxt

ReadVolExit    rep #$30
               longa on
               longi on

               rts

               END

;...............................................................
;
;        OpenFile : Ouvrir un fichier
;
;...............................................................
OpenFile       START
               Using ProdosData

               _Open OpenParams
               bcs KoOpen
               clc
               rts
;--
KoOpen         cmp #PathNotFound
               beq Alert_Dial
               cmp #VolNotFound
               beq Alert_Dial
               cmp #FileNotFound
               beq Alert_Dial
               cmp #IoError
               beq Alert_IO
;--
               jsr Alert_Gloup
ErrOpen        sec
               rts
;--
Alert_Dial     ENTRY
               jsr Alert_PVFNFnd
               bcc OpenFile
               bra ErrOpen
;--
Alert_IO       jsr Alert_IOError
               bra ErrOpen

               END
;...............................................................
;
;        CreateFile : creation d'un Fichier
;
;...............................................................
CreateFile     START
               Using ProdosData
               Using WindowData

               lda NamePtr
               sta CreateNamePtr
               lda NamePtr+2
               sta CreateNamePtr+2
               _Create CreateParams
               bcs KoCreate
OkCreate       clc
               rts
;--
KoCreate       cmp #WriteProtect
               beq Alert_WP
               cmp #PathNotFound
               beq Alert_Dial
               cmp #VolNotFound
               beq Alert_Dial
               cmp #FileNotFound
               beq Alert_Dial
               cmp #VolumeFull
               beq Alert_VF
               cmp #VolumeDirFull
               beq Alert_VDF
               cmp #IoError
               beq Alert_IO
               cmp #DuplicatePN
               beq OkCreate

;--
               jsr Alert_Gloup
ErrCreate      sec
               rts

;--
Alert_Dial     jsr Alert_PVFNFnd
               bcc CreateFile
               bra ErrCreate
;--
Alert_WP       jsr Alert_WProtect
               bra CreateFile
;--
Alert_VF       jsr Alert_VFULL
               bra ErrCreate
;--
Alert_VDF      jsr Alert_VDFULL
               bra ErrCreate
;--
Alert_IO       jsr Alert_IOError
               bra ErrCreate

               END
;...............................................................
;
;        WriteFile : Ecrire des DONNEES
;
;...............................................................
WriteFile      START
               Using ProdosData

               _Write WriteParams
               bcs KoWrite
               clc
               rts
;--
KoWrite        cmp #WriteProtect
               beq Alert_WP
               cmp #VolumeFull
               beq Alert_VF
               cmp #IoError
               beq Alert_IO
;--
               jsr Alert_Gloup
ErrWrite       sec
               rts
;--
Alert_WP       jsr Alert_WProtect
               bra WriteFile
;--
Alert_VF       jsr Alert_VFull
               bra ErrWrite
;--
Alert_IO       jsr Alert_IOError
               bra ErrWrite

               END
;...............................................................
;
;        ReadFile : Lire des DONNEES
;
;...............................................................
ReadFile       START
               Using ProdosData

               _Read ReadParams
               bcs KoRead
               clc
               rts
;-
KoRead         cmp #IoError
               beq Alert_IO
;--
               jsr Alert_Gloup
ErrRead        sec
               rts
;--
Alert_IO       jsr Alert_IOError
               bra ErrRead

               END

;...............................................................
;
;        RenameFile : Renomer un fichier
;
;...............................................................
RenameFile     START
               Using ProdosData

               _ChangePath RenameParams
               bcs KoRename
               clc
               rts
;--
KoRename       cmp #WriteProtect
               beq Alert_WP
               cmp #PathNotFound
               beq Alert_Dial
               cmp #VolNotFound
               beq Alert_Dial
               cmp #FileNotFound
               beq Alert_Dial
               cmp #VolumeFull
               beq Alert_VF
               cmp #VolumeDirFull
               beq Alert_VDF
               cmp #IoError
               beq Alert_IO

;--
               jsr Alert_Gloup
ErrRename      sec
               rts

;--
Alert_Dial     jsr Alert_PVFNFnd
               bcc RenameFile
               bra ErrRename
;--
Alert_WP       jsr Alert_WProtect
               bra RenameFile
;--
Alert_VF       jsr Alert_VFULL
               bra ErrRename
;--
Alert_VDF      jsr Alert_VDFULL
               bra ErrRename
;--
Alert_IO       jsr Alert_IOError
               bra ErrRename

               END
;...............................................................
;
;        Err_Ressource : err sur icone bordure
;
;...............................................................
Err_Ressource  START
               Using GlobalData
               Using ProdosData
               Using WindowData

               cmp #$44
               beq Err_Insert
               cmp #$45
               beq Err_Insert
               cmp #$46
               beq Err_Insert
;--
Err_IO         jsr Alert_Gloup          |Erreur grave CANCEL
               sec
               rts
;--
Err_Insert     jsr Alert_Pvfnfnd        |Erreur Not Found (Retry) (cancel)
               rts
;               cmp #1
;               beq ok_Insert
;
;Cancel_Insert  sec
;               rts
;
;ok_insert      clc
;               rts

               END
;...............................................................
;
;        Alert_Protect : ALERT BOX
;
;...............................................................
Alert_Box      START
               Using WindowData
               Using ProdosData
;--
Alert_WProtect ENTRY

               lda #TX_ERRWP
               sta ItemAp2tx
               lda #^TX_ERRWP
               sta ItemAP2tx+2
               brl Note_Alert
;--
Alert_VFull    ENTRY

               lda #TX_ERRVF
               sta ItemAp2tx
               lda #^TX_ERRVF
               sta ItemAP2tx+2
               brl Stop_Alert
;--
Alert_VDFull   ENTRY

               lda #TX_ERRVDF
               sta ItemAp2tx
               lda #^TX_ERRVDF
               sta ItemAP2tx+2
               brl Stop_Alert
;--
Alert_ResErr   ENTRY
               lda #TX_ERRRES
               sta ItemAp2tx
               lda #^TX_ERRRES
               sta ItemAp2tx+2
               brl Note_AlertRes
;--
Alert_IOError  ENTRY

               lda #TX_ERRIO
               sta ItemAp2tx
               lda #^TX_ERRIO
               sta ItemAP2tx+2
               brl Stop_Alert
;--
Alert_Gloup    ENTRY

               PushLong #0
               pha
               _HexIt
               pla
               sta TX_ERRGL+16
               pla
               sta TX_ERRGL+18

               lda #TX_ERRGL
               sta ItemAp2tx
               lda #^TX_ERRGL
               sta ItemAp2tx+2
               brl Stop_Alert
;--
Alert_LoadBM   ENTRY

               lda #Tx_ErrLBM
               sta ItemAp2tx
               lda #^Tx_ErrLBM
               sta ItemAp2tx+2
               brl Stop_Alert
;--
Alert_PVFNFnd  ENTRY

               jsr ReadVolTxt

               lda #AltVolTxt
               sta ItemAP2tx
               lda #^AltVolTxt
               sta ItemAP2tx+2

               _InitCursor
               PushWord #0
               PushLong #Alert_Res
               PushLong #0
               _StopAlert
               _WaitCursor
               pla
               cmp #1
               beq Alert_PVFNF0
               sec
               rts

Alert_PVFNF0   clc
               rts

;--
Stop_Alert     _InitCursor
               PushWord #0
               PushLong #Alert_Prodos
               PushLong #0
               _StopAlert
               _WaitCursor
               pla
               rts
;--
Note_Alert     _InitCursor
               PushWord #0
               PushLong #Alert_Prodos
               PushLong #0
               _NoteAlert
               _WaitCursor
               pla
               rts
;--
Note_AlertRes  _InitCursor
               PushWord #0
               PushLong #Alert_Res
               PushLong #0
               _NoteAlert
               _WaitCursor
               pla
               rts
;--
Ok_Alert       ENTRY
               _InitCursor
               PushWord #0
               PushLong #Alert_Ok
               PushLong #0
               _NoteAlert
               _WaitCursor
               pla
               rts

               END
;...............................................................
;
;        Save_PakIcon : Save a Icon File Packed
;
;...............................................................
Save_PakIcon   START
               Using GlobalData
               Using ProdosData
;--
               lda TypeOfIcon           |Format $c0
               cmp #$C0                 |Format $c1
               beq Save_Compacte

;--
               jsr Alloc_PBuffer        |buffer de compactage pour branchemant
               lda Ptr_Fond             |sur SPSI avec dealloc pbuffer
               pha
               lda Ptr_Fond+2
               pha

               jsr D_Hdl_FIcon          |Format 32 k
               sta Ptr_Fond
               stx Ptr_Fond+2

               jsr Save_BitMap

               pla
               sta Ptr_Fond+2
               pla
               sta Ptr_Fond

               bra SSPI
;--
Save_Compacte  _WaitCursor              |Watch

               jsr Alloc_PBuffer        |buffer de compactage
               jsr D_Hdl_Pbuffer
               jsr D_Hdl_FIcon          |Coince buffer ICON
;--
               lda #Reply_FullName      |Init Name etc
               sta NamePtr
               lda #^Reply_FullName
               sta NamePtr+2

               lda #$C0                 |File Packed
               sta CreateFileType

               jsr OpenIcon
;--
SSPI           php
               jsr Dealloc_PBuffer
               jsr U_Hdl_FIcon
               plp
               rts
;-----------------------------------------------------------------------
OpenIcon       ANOP
               jsr CreateFile
               bcc SOpenIcon
;--
erropenicon    brl Dehors
;--
SOpenIcon      _OPEN OpenParams         |ouvre le fichier
               bcc OkOpen
               bra erropenicon
;--
OkOpen         ANOP
               lda OpenID
               sta WriteID
               sta CloseID
               sta SetMarkId
;--
SavePalette    ANOP
               PushWord #0
               PushLong Ptr_PBuffer
               _GetColorTable
               lda #15                  |white
               ldy #$20
               sta [Ptr_PBuffer],y

               lda Ptr_PBuffer
               sta WriteDest
               lda Ptr_Pbuffer+2
               sta WriteDest+2

               lda #$22
               sta WriteLg
               stz WriteLg+2

               jsr WriteFile
               bcc SavePattern
               brl OnDelete
;--
SavePattern    ANOP
               lda #512
               sta WriteLg
               stz WriteLg+2

               jsr WriteFile
               bcc SavePicture
               brl OnDelete
;--
SavePicture    ANOP
               lda Ptr_FIcon
               sta Ptr_Picture
               lda Ptr_FIcon+2
               sta Ptr_Picture+2

               ldy #200                 |only 200 Lines
;--
LoopWrite      ANOP                     |like PaintWorks
               phy

               lda #160
               sta PicSize

               lda Ptr_Picture
               sta AdPtr
               lda Ptr_Picture+2
               sta AdPtr+2
;--
LoopWrite2     ANOP
               pha
               PushLong #AdPtr
               PushLong #PicSize
               PushLong Ptr_PBuffer
               PushWord #160
               _PackBytes
               pla
               sta Writelg
               jsr WriteFile
               bcc SLW2
;--
               ply
               bra OnDelete
;--
SLW2           lda PicSize
               bne LoopWrite2

               lda Ptr_Picture
               clc
               adc #160
               sta Ptr_Picture
               lda Ptr_Picture+2
               adc #0
               sta Ptr_Picture+2

               ply
               dey
               bne LoopWrite

               bra OkClose
;--
OnDelete       _Close CloseParams       |ca va mal on CLOSE et on DELETE

               lda NamePtr
               sta DestroyNamePtr
               lda NamePtr+2
               sta DestroyNamePtr+2

               _Destroy DestroyParams
;--
DEHORS         ANOP
               _InitCursor
               sec
               rts
;--
OkClose        anop
               _Close CloseParams       |le ferme

               _InitCursor

               clc
               rts

Ptr_Picture    ds 4                     |Icon File is here

               END
;...............................................................
;
;        DoFormat
;
;...............................................................
DoFormat       START
               Using GlobalData

               lda #11
               sta SegNumber
               jsr Disk_Present
;--
               jsl DoFormatSbr
               PushWord MyID
               pea 1
               pea 11
               _UnLoadSegNum
;--
               rts

               END
