;------------------------------------------------------------------
;
; FILE : SHOWABOUT.S                    - DOABOUT -
;        -----------
;                                       RELOGEABLE
;------------------------------------------------------------------
               List Off
               Gen Off
               Symbol Off
               Keep DoAboutB
               65816 On

               MCopy ShowAbout.MAC

               longa on
               longi on
;...............................................................
;
;        DoAboutR : About Dialog Box
;
;...............................................................
DoAboutR       START

               brl DoAbout

               END
;...............................................................
;
;        DoAbout : code
;
;...............................................................
DoAbout        START

               phb
               phk
               plb
;--
               PushLong #0              |une dialog box
               PushLong #AboutDialog
               _GetNewModalDialog

               PushWord #0              | ok alors adieu
               PushLong #0
               _ModalDialog
               pla

               _CloseDialog

               plb

               rtl
;--------------------------------------
;        ABOUT DIALOG
;--------------------------------------
AboutDialog    anop
               dc i'35,30,135,290'
               dc i2'1'
               dc i4'0'
               dc i4'AboutD0'           |broderbund software present
               dc i4'AboutD1'           |ShowOff
               dc i4'AboutD2'           |Created by Crealude
               dc i4'AboutD3'           |Programmed by Serge Hervy
               dc i4'AboutD4'           |Assisted by Jean-claude Levy
               dc i4'AboutD41'          |Version 1.0
               dc i4'AboutD5'           | 1987 Denis Friedman Production
               dc i4'AboutD6'           |pour le click
               dc i4'0'
;--
AboutD0        anop                     |broder soft presents
               dc i'2'
               dc i'03,22,17,260'
               dc i'15'
               dc i4'AboutTx0'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD1        anop                     |showoff
               dc i'2'
               dc i'18,98,32,260'
               dc i'15'
               dc i4'AboutTx1'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD2        anop                     |created
               dc i'2'
               dc i'33,58,47,260'
               dc i'15'
               dc i4'AboutTx2'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD3        anop                     |pgm
               dc i'2'
               dc i'48,34,62,260'
               dc i'15'
               dc i4'AboutTx3'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD4        anop                     |jcl
               dc i'2'
               dc i'63,18,77,260'
               dc i'15'
               dc i4'AboutTx4'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD41       anop                     |Version 1.0
               dc i'2'
               dc i'78,86,89,260'
               dc i'15'
               dc i4'AboutTx41'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD5        anop                     |1987
               dc i'2'
               dc i'90,02,99,260'
               dc i'15'
               dc i4'AboutTx5'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
AboutD6        anop                     |click
               dc i'1'
               dc i'00,00,99,259'
               dc i'15'
               dc i4'AboutTx6'
               dc i'0'
               dc i'0'
               dc i4'0'

AboutTx0       dc i1'28',c'Br',h'BF',c'derbund Software Presents'
AboutTx1       str 'ShowOff'
AboutTx2       dc i1'19',c'Created by Cr',h'8E',c'alude'
AboutTx3       dc i1'25',c'Programmed by Serge Hervy'
AboutTx4       dc i1'28',c'Assisted by Jean-Claude L',h'8E',c'vy'
AboutTx41      str ' Version 1.1'
AboutTx5       dc i1'35',c'(',h'43',c') 1988 Denis Friedman Productions'
AboutTx6       str ' '

               END
