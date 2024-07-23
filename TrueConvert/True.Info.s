*----------------------------------------
* True Convert : Information
*----------------------------------------

infWIDTH = $1505
infHEIGHT = $1506
infBPP = $1507
infCOL = $1508

*--------------

meINFO lda wiINFO
 ora wiINFO+2
 beq meINFO1

 PushLong wiINFO
 _SelectWindow
 rts

meINFO1 pha
 pha
 PushLong #0
 PushLong #wINFO
 PushLong #PAINTINFO
 PushLong #0
 PushWord #refIsResource
 PushLong #wINFO
 PushWord #$800e
 _NewWindow2
 PullLong wiINFO

meINFO2 jsr infoSETALL

 PushLong wiINFO
 _ShowWindow
 rts

*--------------

infoSETALL PushWord picWIDTH
 PushLong #infVWIDTH2
 PushWord #5
 PushWord #0
 _Int2Dec


 PushWord picHEIGHT
 PushLong #infVHEIGHT2
 PushWord #5
 PushWord #0
 _Int2Dec

 PushWord picBPP
 PushLong #infVBPP2
 PushWord #5
 PushWord #0
 _Int2Dec

 PushWord picCOL
 PushLong #infVCOL2
 PushWord #5
 PushWord #0
 _Int2Dec

*-------

 ldx #infWIDTH
 lda #infVWIDTH
 jsr infoSETALL1

 ldx #infHEIGHT
 lda #infVHEIGHT
 jsr infoSETALL1

 ldx #infBPP
 lda #infVBPP
 jsr infoSETALL1

 ldx #infCOL
 lda #infVCOL

*--------------

infoSETALL1 sta infVPTR

 pha
 pha
 PushLong wiINFO
 pea $0000
 phx
 _GetCtlHandleFromID
 phd
 tsc
 tcd
 lda [3]
 tax
 ldy #2
 lda [3],y
 pld
 ply
 ply
 sta Debut+2
 stx Debut

 lda infVPTR
 sta Arrivee
 lda #^infVPTR
 sta Arrivee+2

 ldy #$12 ; set size
 lda [Arrivee]
 and #$000f
 sta [Debut],y

 ldy #$1c ; set address
 lda Arrivee
 clc
 adc #1
 sta [Debut],y
 iny
 iny
 lda Arrivee+2
 adc #0
 sta [Debut],y

 ldy #$3c ; set to pointer
 lda [Debut],y
 and #$fffc
 sta [Debut],y

 rts

*--------------

PAINTINFO PushLong wiINFO
 _DrawControls
 rtl

*--------------

wiINFO ds 4

infVPTR ds 2

infVWIDTH hex 05
infVWIDTH2 asc '  800'

infVHEIGHT hex 05
infVHEIGHT2 asc '  600'

infVBPP hex 05
infVBPP2 asc '    8'

infVCOL hex 05
infVCOL2 asc '  256'
