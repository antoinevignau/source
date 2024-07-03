;...............................................................
;
;        data des polices
;
;...............................................................
FontDATA  DATA

change_Font    dc i'0'                  |change font si 1
top_font       dc i'0'                  |gestion caractere ligne
FontId         ds 4
FontWinPtr     ds 4
DesiredFont    dc i4'$0800FFFE'         | System Font size 8
MonoFlag       dc i2'0'                 | start out showing proportional

               END
;...............................................................
;
;        DoChar : Choix d'une Font
;
;...............................................................
DoChar         START
               Using GlobalDATA
               Using WindowDATA
               Using FontDATA
               Using Cursors

               jsr eff_cursor

               _InitCursor
               stz Type_cursor

               PushLong #0
               _GetPort

               PushLong #TempPort
               _OpenPort

               PushLong #0                    ; space for result
               PushLong DesiredFont
               PushWord #0
               _ChooseFont
               lda 1,s
               ora 3,s
               bne okchoose
;--
               pla
               pla
               brl Fin
;--
okchoose       pla
               sta DesiredFont
               sta FontId
               sta FontNumber
               pla
               sta DesiredFont+2
               sta FontId+2
               sta Fontstylsiz
;--------------------------------------
;              PushLong #0
;              _GetFontId
;              pla
;              pla
;--------------------------------------
RFI            PushLong FontId
               PushWord #0
               _InstallFont
               bcc SIF
;--
               cmp #$45
               bne SIF
;--
               lda #TxInsDiskF
               sta ItemAP2tx
               lda #^TxInsDiskF
               sta ItemAP2tx+2

               PushWord #0
               PushLong #Alert_Res
               PushLong #0
               _StopAlert
               pla
               cmp #1
               beq RFI
;--
SIF            jsr init_caret           |calcul de la taille curseur

               PushLong #0              |restaure font system
               Pushword #0
               _InstallFont

               jsr CH_FontDrag          |Drag Selection

               lda #7                   |changement de Font si select
               sta Ch_Group
               jsr Change_Groupe
;--
               lda Nb_List_Select       |MAJ SELECTION RECTANGLE
               cmp #2
               bcc suite
               jsr Object_Select
               bra suite1
;-
suite          lda line_Select
               bmi suite1
               jsr Cal_Rect2
               jsr Copy_RectL
;--
suite1         lda #0                   |#0
               sta Only_Text

               PushLong #0              |tout rafraichir
               _GetPort

               PushLong Ptr_FrameW
               _SetPort

               PushLong #FullRect
               _InvalRect

               _SetPort

FIN            PushLong #TempPort
               _ClosePort

               _SetPort

               stz top_font             |pour gestion precedent

               rts

TempPort       ds $AA                         ; size of graph port

               END
;...............................................................
;
;        init_caret : taille du flash
;
;...............................................................
init_caret     START
               Using GlobalData

               PushLong #FontInfoRecord        ;hauteur d'une font
               _GetFontInfo

               lda ascent
               clc
               adc descent
               sta hauteur

               rts

               END
;...............................................................
;
;        InsFont : installe la font
;
;...............................................................
InsFont        START
               Using FontData
               Using GlobalData

               phx

               PushLong #0
               _GetPort
               pla
               sta portc
               pla
               sta portc+2

               plx

               sep #$20
               longa off

               lda Line_fltexte,x
               sta Font
               lda Line_fhtexte,x
               sta Font+1
               lda Line_stexte,x
               sta Font+2
               lda Line_ttexte,x
               sta Font+3

               rep #$20
               longa on

               lda portc                |tjs le meme port
               cmp zport
               bne installe
               lda portc+2
               cmp zport+2
               bne installe

               lda Change_font          |font obligatoire
               bne installe

               lda font                 |encore la meme font
               cmp zfont                |si oui dehors
               bne installe
               lda font+2
               cmp zfont+2
               beq saute

installe       PushLong Font
               PushWord #0
               _InstallFont

               lda font
               sta zfont
               lda font+2
               sta zfont+2
               lda portc
               sta zport
               lda portc+2
               sta zport+2

saute          stz Change_font

               rts

font           ds 4
zfont          ds 4
portc          ds 4
zport          ds 4

               END
;...............................................................
;
;        Ch_FontLine
;
;...............................................................
Ch_FontLine    START
               Using GlobalData

               ldx Line_Lg
               dex

               sep #$20
               longa off

again          lda FontNumber
               sta Line_FLtexte,x
               lda FontNumber+1
               sta Line_FHtexte,x

               lda FontStyle
               sta Line_Stexte,x
               lda FontSize
               sta Line_Ttexte,x

               dex
               bpl again

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        Ch_FontDrag
;
;...............................................................
Ch_FontDrag    START
               Using GlobalData
               Using WindowData

               lda Top_select_D
               bne ok
               rts
;--
ok             PushLong #0
               _GetPort

               PushLong Ptr_FrameW
               _SetPort

               jsr Draw_DragE

               _SetPort

               ldx SelectDragD

               sep #$20
               longa off

again          lda FontNumber
               sta Line_FLtexte,x
               lda FontNumber+1
               sta Line_FHtexte,x

               lda FontStyle
               sta Line_Stexte,x
               lda FontSize
               sta Line_Ttexte,x

               inx
               cpx SelectDragF
               bcc again

               rep #$20
               longa on
;--
               PushLong #0
               _GetPort

               PushLong Ptr_FrameW
               _SetPort

               jsr Calcul_Rect

               _SetPort
;--
               lda Line_Y
               sec
               sbc Line_RectY0
               sta RectSelect_DY0

               lda Line_Y
               clc
               adc Line_RectY1
               sta RectSelect_DY1

               jsr Maj_Select_DX1
;--
               lda #1
               sta Top_sauvegarde

               rts
;--------------------------------------
;        Maj_Select_DX1
;--------------------------------------
Maj_Select_DX1 ANOP

               lda Line_X
               sta RectSelect_DX1

               ldx #0

Loop           phx
               jsr Cal_width
               clc
               adc RectSelect_DX1
               sta RectSelect_DX1
               plx
               inx
               cpx SelectDragF
               bcc Loop

               rts

               END
