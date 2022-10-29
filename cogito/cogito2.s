*
* Cogito: The Return
*
* (c) 1997, Jérôme Crétaux
* (c) 1997, Atreid Concept
* (c) 1997, Brutal Deluxe Software
*

	mx	%00
	rel
	dsk	Cogito2.l
	lst	off

*-----------------------

KBD	=	$C000
KBDSTROBE	=	$C010
BUTN3	=	$C060
GSOS	=	$E100A8

*-----------------------

*
* Resources
*
* $0001: sound - click
* $0002: sound - end of level
* $0010: 69B0 - Data Happyland
* $0011: 6980 - Data Ludyland
* $0012: 6980 - Data Planet
* $0013: 6980 - Data Xenoland
* $0014: VGA palette
* $0015: VGA palette
* $0020: 010D28 - Happyland (PCX)
* $0021: 00F6FE - Ludyland (PCX)
* $0022: 00CEA2 - Planet (PCX)
* $0023: 019954 - Xenoland (PCX)
* $0024: 02FCE3 - Title (PCX)
* $0025: 006500 - About (PCX)

*-----------------------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Resource.Macs
	use	4/Sound.Macs
	use	4/Util.Macs
	
*--------------------------
* Initialisations d'entree
*--------------------------

         PHK
         PLB

         _TLStartUp
         PHA
         _MMStartUp
         PLA
         STA   myID

         PHA
         PHA
         PHA
         PushWord #2
	 PushLong #1
         _StartUpTools
	 PullLong SStopREC
         BCC   L0056

         PHA
         PEA   ^errSTR1
         PEA   errSTR1
         PEA   ^memSTR3
         PEA   memSTR3
         PEA   ^memSTR4
         PEA   memSTR4
         PEA   ^memSTR4
         PEA   memSTR4
         _TLTextMountVolume
         PLA
         JMP   initOFF

L0056    PushLong #bufferSS
         JSL   _xGetStatus	; Do I have a SecondSight?
         CMP   #$0000
         BEQ   L0089		; Yes, I do

         PHA			; No, I quit
         PEA   ^errSTR2
         PEA   errSTR2
         PEA   ^memSTR3
         PEA   memSTR3
         PEA   ^memSTR4
         PEA   memSTR4
         PEA   ^memSTR4
         PEA   memSTR4
         _TLTextMountVolume
         PLA
         JMP   initOFF

L0089    INC   fgSS

         PHA
         PHA
         _FreeMem
         PLA
         PLA
         CMP   #$0004
         BCS   L009F
         JMP   memERR1
L009F    JMP   okIT3

         ASC   8D8D
         ASC   'hi Chuck, we perfectly know that you don'27't have any second Sight in your GS but '
         ASC   'as you usually have a look at the hidden texts of our software, we say you hello first... :-)'8D8D

okIT3    PushLong #0
         PushLong #$10000
         PushWord myID
         PushWord #%11000000_00011100
         PushLong #0
         _NewHandle
         LDX   temp
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrBANK1,X
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrBANK1+2,X
         PLD
         PLA
         PLA
         JSR   memERR
         INX
         INX
         INX
         INX
         STX   temp
         CPX   #4*4	; 4 bancs
         BNE   okIT3

*---

         JSR   initSS
         JSR   loadTITRE
         LDA   #$0000	; affiche logo Kalisto
         JSR   unpackPCX
         LDA   #$0000
         JSR   showIMAGE
         JSR   waitMOUSEUP
         JSR   fadeOUT
         LDA   #$0001	; affiche image titre
         JSR   unpackPCX
         LDA   #$0001
         JSR   showIMAGE
         JSR   loadIMAGES
         JSR   loadDATA
         JSR   initSOUND
         JSR   fadeOUT

         INC   fgINTER2
         STZ   Melange

         SEI
	 PushLong #myVBL
         _SetHeartBeat
	 PushLong #myRAN
         _SetHeartBeat
         CLI
         PEA   $0002
         _IntSource
         STZ   CurDecor

L01F3    STZ   window
         LDA   #1
         STA   Niveau
         STZ   moX
         STZ   moY
         STZ   oldX
         STZ   oldY
L0208    LDA   #1
         STA   NbCoups
         STZ   NbCoups+2
         STZ   NbCompute
         STZ   ldFlag

L0217    JSR   setDecor
         JSR   DoInit
         JSR   DoDecor
         JSR   DoDeplacement
         JSR   DoFleches
         JSR   PutArrows
         JSR   ShowAll
         LDA   #$0000
         STA   firstLINE
         LDA   #$018F
         STA   lastLINE
         JSR   refreshSCREEN
         JSR   fadeIN
         JSR   moFORE
         LDA   ldFlag
         BNE   L0258

         STZ   Temps
         STZ   Temps+2
         STZ   Temps+4
         STZ   NbCoups
         STZ   NbCoups+2
         STZ   NbCompute

L0258    JSR   OpenPanel
         JSR   ahNIVEAU
         JSR   ahCOMPCP
         JSR   ahMOICP
         LDX   #$0003
         STX   noINTER
         JSR   ahTIME
         INC   Melange

*--- On a demarre, maintenant melange

         LDA   ldFlag
         BNE   L0278
         JSR   ComputeIt

L0278    JSR   moREAD
         JSR   ahTIME
         LDAL  KBD-1
         BPL   L0287
         BRL   L0336
L0287    JSR   moCONTROL
         BCS   L0278
         STA   MyArrow
         LDA   #$FFFF
         STA   windowC
         JSR   TestArrow
         BCS   L0278
         LDX   #$0000
         JSR   playSND
         LDA   NbCoups
         CLC
         ADC   #1
         STA   NbCoups
         LDA   NbCoups+2
         ADC   #0
         STA   NbCoups+2
         JSR   moBACK
         JSR   ahMOICP
         JSR   ChoixMelange
         JSR   moFORE
         JSR   TestEnd
         BCS   L0278
         LDX   #$0001
         JSR   playSND
L02CA    STZ   Melange
         JSR   moBACK
         INC   CurDecor
         LDA   CurDecor
         CMP   #$0004
         BCC   L02DE
         STZ   CurDecor
L02DE    STZ   ldFlag
         INC   Niveau
         LDA   Niveau
         CMP   #$0079	; le dernier niveau ?
         BCC   L02FB
         LDX   #$0001	; le joueur a gagné
         JSR   playSND	; il a droit au son
         LDX   #$0001	; deux fois
         JSR   playSND	; snif
         BRL   L01F3

L02FB    JSR   fadeOUT
         BRL   L0217

         ASC   8D8D
         ASC   'Big Kisses from Antoine to my beloved Emmanuelle '8D8D

*--- Gestion des touches

L0336    STAL  KBDSTROBE-1
         XBA
         AND   #$00DF
         CLC
         ADC   #$0020
         TAX
         STZ   Melange
         LDAL  BUTN3
         BMI   L036F
         TXA
         CMP   #$00AB
         BNE   L0355
         JMP   L02CA

L0355    CMP   #$00AD
         BNE   L036C
         LDA   Niveau
         SEC
         SBC   #$0002
         BPL   L0366
         LDA   #$0000
L0366    STA   Niveau
         JMP   L02CA
L036C    JMP   L0462

L036F    TXA
         CMP   #"1"
         BNE   L038F
         LDA   #$0000
         CMP   CurDecor
         BEQ   L038C
         STA   CurDecor
         LDA   #$0001
         STA   ldFlag
         JSR   fadeOUT
         JMP   L0217
L038C    JMP   L0462

L038F    CMP   #"2"
         BNE   L03AE
         LDA   #$0001
         CMP   CurDecor
         BEQ   L03AB
         STA   CurDecor
         LDA   #$0001
         STA   ldFlag
         JSR   fadeOUT
         JMP   L0217
L03AB    JMP   L0462

L03AE    CMP   #"3"
         BNE   L03CD
         LDA   #$0002
         CMP   CurDecor
         BEQ   L03CA
         STA   CurDecor
         LDA   #$0001
         STA   ldFlag
         JSR   fadeOUT
         JMP   L0217
L03CA    JMP   L0462

L03CD    CMP   #"4"
         BNE   L03EC
         LDA   #$0003
         CMP   CurDecor
         BEQ   L03E9
         STA   CurDecor
         LDA   #$0001
         STA   ldFlag
         JSR   fadeOUT
         JMP   L0217
L03E9    JMP   L0462

L03EC    CMP   #$00F3
         BNE   L03F7
         JSR   saveFILE
         JMP   L0462

L03F7    CMP   #$00AB
         BNE   L0409
         LDA   Niveau
         CLC
         ADC   #$000B
         STA   Niveau
         JMP   L02CA

L0409    CMP   #$00AD
         BNE   L0420
         LDA   Niveau
         SEC
         SBC   #$000D
         BPL   L041A
         LDA   #$0000
L041A    STA   Niveau
         JMP   L02CA

L0420    CMP   #$00ED
         BNE   L0431
         LDA   fgNOMUSIC
         EOR   #$0001
         STA   fgNOMUSIC
         JMP   L0462

L0431    CMP   #$00EF
         BNE   L0447
         JSR   loadFILE
         BCS   L0462
         LDA   #$0001
         STA   ldFlag
         JSR   fadeOUT
         JMP   L0217

L0447    CMP   #$00F2
         BNE   L0452
         JSR   fadeOUT
         JMP   L01F3

L0452    CMP   #$00FA
         BNE   L045D
         JSR   fadeOUT
         JMP   L0208

L045D    CMP   #$00F1
         BEQ   L046B
L0462    LDA   #$0001
         STA   Melange
         JMP   L0287

L046B    STZ   Melange
         JSR   fadeOUT

initOFF  LDA   fgSS
         BEQ   L0493

         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0007
         PEA   $D000
         JSL   _xClearScreen
         PEA   $0060
         PEA   $0000
         JSL   _xSetMode

L0493    LDA   fgINTER2
         BEQ   L04B4

         SEI
	 PushLong #myRAN
         _DelHeartBeat
	 PushLong #myVBL
         _DelHeartBeat
         CLI

L04B4    JSR   sndOFF
         PushWord #1
	 PushLong SStopREC
         _ShutDownTools
	 PushWord myID
         _DisposeAll
         _MMShutDown
         _TLShutDown

         JSL   GSOS
         DW    $2029      ; Quit
         ADRL  proQuit
         BRK   $00

         ASC   8D8D
         ASC   'August 97, Olivier in California... Dinner with Nathan, no beans this time...:-) '
         ASC   'Nice Saturn Game... (ThunderForce V is still unavailable in France). '
         ASC   'Impossible to look at the baywatch girls, perhaps next time... :-)'8D8D

*--------------------------
* Routines melange
*--------------------------

ChoixMelange    LDA   WhichDep

         CMP   #1	; Normal
         BNE   melan2
         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan2   CMP   #2	; 2 cases dans la meme direction
         BNE   melan3

         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         JSR   DoScroll
         RTS

*---

melan3   CMP   #3	; Inversion N/E, S/O
         BNE   melan4

         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel38,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan4   CMP   #4	; Normal sans fleches
         BNE   melan5

         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan5   CMP   #5	; Inversion N/S, E/O
         BNE   melan6
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel5,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan6   CMP   #6	; N1=S9, E1=O9
         BNE   melan7
	 
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel67,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan7   CMP   #7	; N1=N1+S9, N2=N2+S8
         BNE   melan8
	 
         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel67,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan8   CMP   #8	; N1=N1+E1, S1=S1+01
         BNE   melan9
	 
         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel38,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan9   CMP   #9	; N&=N1+N9, N2=N2+N8
         BNE   melan10
	 
         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel9,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan10  CMP   #10	; Manque fleches, sinon comme 8
         BNE   melan11
	 
         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel38,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan11  CMP   #11	; N1=N1+N2, O1=O1+O2
         BNE   melan12
	 
         LDA   MyArrow
         ASL
         STA   MyColumn
         JSR   DoScroll
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel11,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

*---

melan12  LDA   MyArrow	; N4=N4+N2, N9=N9+N7
         ASL
         STA   MyColumn
         JSR   DoScroll
         LDA   MyArrow
         ASL
         TAX
         LDA   TblMel12,X
         ASL
         STA   MyColumn
         JSR   DoScroll
         RTS

         ASC   8D8D
         ASC   'Minax is not dead !'8D8D
	 
*--- Regarde si la fleche X existe

TestArrow LDA  MyArrow
         ASL
         TAX
         LDA   Fleches2,X
         BNE   TstArr1
         SEC		; Fleche n'existe pas
         RTS
TstArr1  CLC		; Fleche existe
         RTS

*--- L'ordinateur choisit

ComputeIt JSR  Random
         BEQ   ComputeIt
         CMP   #37
         BCS   ComputeIt
         DEC		; Pour 0-36
         CMP   MyArrow
         BEQ   ComputeIt
         STA   MyArrow

         JSR   TestArrow	; Fleche existe ?
         BCS   ComputeIt	; non, si C=1
         INC   NbCompute
         JSR   ahCOMPCP	; Ah! Le nombre de deplacement
         JSR   ChoixMelange	; Melange

         LDA   NbCompute
         CMP   NbMelange
         BNE   ComputeIt

         JSR   TestEnd	; Plateau=Probleme ?
         BCC   ComputeIt	; C=0, oui, recommence

         STZ   Diabolic
         JSR   L0D5B
         RTS

*--- Compare les deux plateaux

TestEnd  LDX   #0
]lp      LDA   Plateau,X	; C=1, c'est le meme
         CMP   Probleme,X	; C=0, different
         BNE   TstEnd1
         INX
         INX
         CPX   #81*2
         BNE   ]lp
         CLC
         RTS
TstEnd1  SEC	; Erreur
         RTS

*--- Initialise les donnes de decor, deplacement et nom

DoInit   LDA   Niveau
         DEC
         ASL
         TAX
         LDA   ChoixDeplace,X
         STA   WhichDep
         LDA   ChoixDecor,X
         STA   WhichDecor
         RTS

*--- Prepare le decor

DoDecor  LDA   ldFlag
         BNE   noDec
         LDA   WhichDecor
         DEC
         ASL
         TAX
         JSR   (AdrCalcDec,X)
noDec    RTS

*--- Prepare les deplacements

DoDeplacement    LDA   ldFlag
         BNE   noDep
	 
         LDA   WhichDep
         DEC
         ASL
         TAX
         LDA   TblDeplacement,X
         STA   NbMelange
         STA   Diabolic
noDep    RTS

*--- Prepare les fleches suivant le deplacement

DoFleches LDA   Niveau
         CMP   #24
         BCS   FlechesA

         LDX   #0	; On deplace sur 9
         LDA   #9
]lp      STA   Fleches,X
         INX
         INX
         CPX   #36*2
         BNE   ]lp
         BRL   FlechesE

*---

FlechesA CMP   #48
         BCS   FlechesB

         LDX   #0	; On deplace sur 5
         LDA   #5
]lp      STA   Fleches,X
         INX
         INX
         CPX   #36*2
         BNE   ]lp
         BRL   FlechesE

*---

FlechesB CMP   #72
         BCS   FlechesC

         LDX   #0	; On deplace sur 6 et 4
]lp      LDA   #6
         STA   Fleches,X
         STA   Fleches+36,X
         LDA   #4
         STA   Fleches+18,X
         STA   Fleches+54,X
         INX
         INX
         CPX   #9*2
         BNE   ]lp
         BRL   FlechesE

*---

FlechesC CMP   #99
         BCS   FlechesD

         LDX   #0	; On deplace sur 6, 4, 7 et 3
]lp      LDA   #6
         STA   Fleches,X
         LDA   #4
         STA   Fleches+18,X
         LDA   #7
         STA   Fleches+36,X
         LDA   #3
         STA   Fleches+54,X
         INX
         INX
         CPX   #9*2
         BNE   ]lp
	 
         LDA   #3
         STA   Fleches+6
         STA   Fleches+8
         STA   Fleches+10
         LDA   #7
         STA   Fleches+24
         STA   Fleches+26
         STA   Fleches+28
         BRL   FlechesE

*---

FlechesD LDX   #0	; On deplace sur 8 et 3
]lp      LDA   #8
         STA   Fleches,X
         STA   Fleches+36,X
         LDA   #3
         STA   Fleches+18,X
         STA   Fleches+54,X
         INX
         INX
         CPX   #9*2
         BNE   ]lp
	 
*---

FlechesE LDA   WhichDep
         CMP   #4
         BEQ   FlechesG
         CMP   #10
         BEQ   FlechesG

FlechesF LDX   #0
         LDA   #1
]lp      STA   Fleches2,X
         INX
         INX
         CPX   #36*2
         BNE   ]lp
         RTS

FlechesG JSR   FlechesF
         STZ   Fleches2+2	; Inhibe des fleches
         STZ   Fleches2+12
         STZ   Fleches2+20
         STZ   Fleches2+22
         STZ   Fleches2+30
         STZ   Fleches2+38
         STZ   Fleches2+48
         STZ   Fleches2+56
         STZ   Fleches2+58
         STZ   Fleches2+66
         RTS

         ASC   8D8D
         ASC   'About our next game, I will say.... SUCH A YEAR !!!'8D8D
	 
*--------------------------
* Routines mathematiques
*--------------------------

ahCOMPCP LDA   #'00'
         STA   StrPtr
         STA   StrPtr+1

	 PushWord NbCompute
	 PushLong #StrPtr
	 PushWord #3
	 PushWord #0
         _Int2Dec

         LDA   CurDecor
         ASL
         TAX
         LDA   zeCOMPCPY,X	; Y
         TAY
         LDA   zeCOMPCPX,X	; X
         TAX
         LDA   #StrPtr
         JSR   printNUMJ
         RTS

*--- Affiche mon nombre de coups

ahMOICP  LDA   #'00'
         STA   LgStrPtr
         STA   LgStrPtr+2
         STA   LgStrPtr+3

         PushLong NbCoups
         PushLong #LgStrPtr
         PushWord #5
         PushWord #0
         _Long2Dec
	 
         LDA   CurDecor
         ASL
         TAX
         LDA   zeMOICPY,X
         TAY
         LDA   zeMOICPX,X
         TAX
         LDA   #LgStrPtr
         JSR   printNUMR
         RTS

*--- Affiche le niveau

ahNIVEAU JSR   chNIVEAU
         LDA   CurDecor
         ASL
         TAX
         LDA   zeCOMPCPY,X
         TAY
         LDA   zeNIVEAU,X
         TAX
         LDA   #StrPtr
         JSR   printNUMJ
         RTS

chNIVEAU LDA   #'00'
         STA   StrPtr
         STA   StrPtr+1
	 
	 PushWord Niveau
	 PushLong #StrPtr
	 PushWord #3
	 PushWord #0
         _Int2Dec
         RTS

*---

ahTIME   LDA   noINTER
         BNE   L0974
         RTS

L0974    LDA   CurDecor
         ASL
         ASL
         TAX

         LDA   moY	; la souris
         CMP   PanelY2,X	; est-elle sur le panneau ?
         BPL   L099A
         CMP   PanelY1,X
         BMI   L099A
         LDA   moX
         CMP   PanelX2,X
         BPL   L099A
         CMP   PanelX1,X
         BMI   L099A
         JSR   moBACK
         INC   fgTIME

L099A    LDX   noINTER
         CPX   #$0003
         BCC   L09D2

         LDA   #'00'
         STA   StrTime
	 PushWord Temps
	 PushLong #StrTime
         PushWord #2
	 PushWord #0
         _Int2Dec

         LDA   CurDecor
         ASL
         TAX
         LDA   zeTEMPSY,X	; Y
         TAY
         LDA   zeTEMPS1,X	; X
         TAX
         LDA   #StrTime
         JSR   printNUMR

L09D2    LDX   noINTER
         CPX   #$0002
         BCC   L0A0A

         LDA   #'00'
         STA   StrTime
         PushWord Temps+2
         PushLong #StrTime
         PushWord #2
         PushWord #0
         _Int2Dec

         LDA   CurDecor
         ASL
         TAX
         LDA   zeTEMPSY,X	; Y
         TAY
         LDA   zeTEMPS2,X	; X++
         TAX
         LDA   #StrTime
         JSR   printNUMR

L0A0A    LDX   noINTER
         CPX   #$0001
         BCC   L0A42

         LDA   #'00'
         STA   StrTime
         PushWord Temps+4
         PushLong #StrTime
         PushWord #2
         PushWord #0
         _Int2Dec

         LDA   CurDecor
         ASL
         TAX
         LDA   zeTEMPSY,X	; Y
         TAY
         LDA   zeTEMPS3,X	; X++++
         TAX
         LDA   #StrTime
         JSR   printNUMR

L0A42    LDA   fgTIME
         BEQ   L0A4D
         STZ   fgTIME
         JSR   moFORE
L0A4D    STZ   noINTER
         RTS

setDecor    LDA   CurDecor
         ASL
         ASL
         TAX
         LDA   ptrPANEL1,X
         STA   $1C
         LDA   ptrPANEL1+2,X
         STA   $1E
         LDA   PanelX1,X
         STA   PanelX
         LDA   PanelY1,X
         STA   PanelY

         LDY   #0
L0A70    LDA   [$1C]
         STA   L566B,Y
         INC   $1C
         BNE   L0A7B
         INC   $1E
L0A7B    INY
         CPY   #$69B0
         BNE   L0A70
         LDA   CurDecor
         JSR   unpackPCX
         RTS

         ASC   8D8D
         ASC   'Nathan : what about distributing your programs once more ? '
	 ASC   'I'27'd like to get the latest version of GUPP'8D8D

*--------------------------
* Creation des decors
*--------------------------

Decor1   JSR   Random	; couleur 1
         BEQ   Decor1
         CMP   #7
         BCS   Decor1
         STA   colorA
]lp      JSR   Random	; couleur 2
         BEQ   ]lp
         CMP   #7
         BCS   ]lp
         CMP   colorA
         BEQ   ]lp
         STA   colorB

         LDX   #0	; met le fond
         LDA   colorA
]lp      STA   Plateau,X
         STA   Probleme,X
         INX
         INX
         CPX   #81*2
         BNE   ]lp
	 
         lda   colorB   ; met le motif
         sta   Plateau+60
         sta   Probleme+60
         sta   Plateau+62
         sta   Probleme+62
         sta   Plateau+64
         sta   Probleme+64
         sta   Plateau+78
         sta   Probleme+78
         sta   Plateau+80
         sta   Probleme+80
         sta   Plateau+82
         sta   Probleme+82
         sta   Plateau+96
         sta   Probleme+96
         sta   Plateau+98
         sta   Probleme+98
         sta   Plateau+100
         sta   Probleme+100
         rts

*---

Decor2   jsr   Random     ; couleur 1
         beq   Decor2
         cmp   #7
         bcs   Decor2
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB

         ldx   #0         ; met couleur 1
         lda   colorA
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #36*2
         bne   ]lp

         ldx   #36*2      ; met couleur 2
         lda   colorB
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*---

Decor3   jsr   Random     ; couleur 1
         beq   Decor3
         cmp   #7
         bcs   Decor3
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB
]lp      jsr   Random     ; couleur 3
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         cmp   colorB
         beq   ]lp
         sta   colorC

         ldx   #0         ; met le motif
]lp      lda   colorA
         sta   Plateau,x
         sta   Probleme,x
         sta   Plateau+2,x
         sta   Probleme+2,x
         sta   Plateau+4,x
         sta   Probleme+4,x
         lda   colorB
         sta   Plateau+6,x
         sta   Probleme+6,x
         sta   Plateau+8,x
         sta   Probleme+8,x
         sta   Plateau+10,x
         sta   Probleme+10,x
         lda   colorC
         sta   Plateau+12,x
         sta   Probleme+12,x
         sta   Plateau+14,x
         sta   Probleme+14,x
         sta   Plateau+16,x
         sta   Probleme+16,x
         txa
         clc
         adc   #9*2
         tax
         cpx   #81*2
         bne   ]lp
         rts

*---

Decor4   jsr   Random     ; couleur 1
         beq   Decor4
         cmp   #7
         bcs   Decor4
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB
]lp      jsr   Random     ; couleur 3
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         cmp   colorB
         beq   ]lp
         sta   colorC

         ldx   #0         ; met le motif 1
         lda   colorA
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #27*2
         bne   ]lp

         ldx   #27*2      ; met le motif 2
         lda   colorB
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #54*2
         bne   ]lp

         ldx   #54*2      ; met le motif 3
         lda   colorC
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*--- Simplification par tableaux deja en memoire

Decor5   LDA   #AdrDecor5
         BRA   DecorA
Decor6   LDA   #AdrDecor6
         BRA   DecorA
Decor7   LDA   #AdrDecor7
         BRA   DecorA
Decor8   LDA   #AdrDecor8
         BRA   DecorA
Decor9   LDA   #AdrDecor9

DecorA   STA   DecorB+1

         LDX   #0
DecorB   LDA   $FFFF,X
         STA   Plateau,X
         STA   Probleme,X
         INX
         INX
         CPX   #81*2
         BNE   DecorB
         RTS

*---

Decor10  LDX   #0
]lp      STZ   Plateau,X
         STZ   Probleme,X
         INX
         INX
         CPX   #81*2
         BNE   ]lp

         LDX   #0
]lp      JSR   Random	; Random2
         BNE   Decor10a
         INC
Decor10a CMP   #7
         BCS   ]lp

         STA   Plateau,X
         STA   Probleme,X
         INX
         INX
         CPX   #81*2
         BNE   ]lp
         RTS

         ASC   8D8D
         ASC   'Pizza Party in San Rafael with Sheppy and Joe. (Splash on Tv for Stephanie)'8D8D

*--- Affiche tous les pions

ShowAll  LDX   #0
]lp      PHX
         LDA   Plateau,X
         JSR   WriteBig
         PLX
         PHX
         LDA   Probleme,X
         JSR   WriteSmall
         PLX
         INX
         INX
         CPX   #81*2
         BNE   ]lp
         RTS

L0D5B    JSR   moBACK
         LDX   #$0000
L0D61    PHX
         LDA   Plateau,X
         JSR   WriteBig
         PLX
         INX
         INX
         CPX   #$00A2
         BNE   L0D61
         LDA   #$001D
         STA   firstY3
         LDA   #$018F
         STA   lastY3
         JSR   refreshLINE
         JSR   moFORE
         RTS

*--- Draw panel (79x49 pixels)

OpenPanel
         LDX   #sprPanel1
         JSR   L0D90
         LDX   #sprPanel2
         JSR   L0D90
         RTS

L0D90    TXA
         CLC
         ADC   #$0F1F	; 79x49
         STA   L0ECA+1
         LDY   PanelY
L0D9B    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $18
         LDA   lineBANK1+2,Y
         STA   $1A
         LDY   PanelX
         LDA   |$0000,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0002,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0004,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0006,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0008,X
         STA   [$18],Y
         INY
         INY
         LDA   |$000A,X
         STA   [$18],Y
         INY
         INY
         LDA   |$000C,X
         STA   [$18],Y
         INY
         INY
         LDA   |$000E,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0010,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0012,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0014,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0016,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0018,X
         STA   [$18],Y
         INY
         INY
         LDA   |$001A,X
         STA   [$18],Y
         INY
         INY
         LDA   |$001C,X
         STA   [$18],Y
         INY
         INY
         LDA   |$001E,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0020,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0022,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0024,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0026,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0028,X
         STA   [$18],Y
         INY
         INY
         LDA   |$002A,X
         STA   [$18],Y
         INY
         INY
         LDA   |$002C,X
         STA   [$18],Y
         INY
         INY
         LDA   |$002E,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0030,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0032,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0034,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0036,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0038,X
         STA   [$18],Y
         INY
         INY
         LDA   |$003A,X
         STA   [$18],Y
         INY
         INY
         LDA   |$003C,X
         STA   [$18],Y
         INY
         INY
         LDA   |$003E,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0040,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0042,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0044,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0046,X
         STA   [$18],Y
         INY
         INY
         LDA   |$0048,X
         STA   [$18],Y
         INY
         INY
         LDA   |$004A,X
         STA   [$18],Y
         INY
         INY
         LDA   |$004C,X
         STA   [$18],Y
         INY
         LDA   |$004E,X
         STA   [$18],Y
         PLY
         INY
         TXA
         CLC
         ADC   #79
         TAX
L0ECA    CPX   #$FFFF
         BCS   L0ED2
         BRL   L0D9B

L0ED2    LDA   PanelY
         STA   firstY4
         CLC
         ADC   #$0031
         STA   lastY4
         JSR   refreshPANEL
         RTS

         ASC   8D8D
         ASC   'Antoine promises : No More versions of Cogito'8D8D

*---

PutArrows
         LDY   #0	; Au nord
L0F17    PHY
         LDA   Fleches2,Y
         BEQ   L0F23
         LDX   #LA029
         JSR   PrintNS
L0F23    PLY
         INY
         INY
         CPY   #18
         BNE   L0F17

         LDY   #18	; A l'est
L0F2E    PHY
         LDA   Fleches2,Y
         BEQ   L0F3A
         LDX   #LB037
         JSR   PrintEO
L0F3A    PLY
         INY
         INY
         CPY   #36
         BNE   L0F2E

         LDY   #36	; Au sud
L0F45    PHY
         LDA   Fleches2,Y
         BEQ   L0F51
         LDX   #LA83F
         JSR   PrintNS
L0F51    PLY
         INY
         INY
         CPY   #54
         BNE   L0F45
	 
         LDY   #54	; A l'ouest
L0F5C    PHY
         LDA   Fleches2,Y
         BEQ   L0F68
         LDX   #LB7F3
         JSR   PrintEO
L0F68    PLY
         INY
         INY
         CPY   #72
         BNE   L0F5C
         RTS

*--- Affiche une flèche haut/bas (30x23)

PrintNS  TXA
         CLC
         ADC   #$02B2	; 30x23
         STA   L1007+1
         LDA   FlecheX1,Y
         STA   FlecheX
         LDA   FlecheY1,Y
         STA   FlecheY
         TAY
L0F86    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $28
         LDA   lineBANK1+2,Y
         STA   $2A
         LDY   FlecheX
         LDA   |$0000,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0002,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0004,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0006,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0008,X
         STA   [$28],Y
         INY
         INY
         LDA   |$000A,X
         STA   [$28],Y
         INY
         INY
         LDA   |$000C,X
         STA   [$28],Y
         INY
         INY
         LDA   |$000E,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0010,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0012,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0014,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0016,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0018,X
         STA   [$28],Y
         INY
         INY
         LDA   |$001A,X
         STA   [$28],Y
         INY
         INY
         LDA   |$001C,X
         STA   [$28],Y
         PLY
         INY
         TXA
         CLC
         ADC   #30
         TAX
L1007    CPX   #$FFFF
         BCS   L100F
         BRL   L0F86
L100F    RTS

*--- Affiche une flèche gauche/droite (22x30)

PrintEO  TXA
         CLC
         ADC   #$0294	; 22x30
         STA   L108A+1
         LDA   FlecheX1,Y
         STA   FlecheX
         LDA   FlecheY1,Y
         STA   FlecheY
         TAY
L1025    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $28
         LDA   lineBANK1+2,Y
         STA   $2A
         LDY   FlecheX
         LDA   |$0000,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0002,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0004,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0006,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0008,X
         STA   [$28],Y
         INY
         INY
         LDA   |$000A,X
         STA   [$28],Y
         INY
         INY
         LDA   |$000C,X
         STA   [$28],Y
         INY
         INY
         LDA   |$000E,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0010,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0012,X
         STA   [$28],Y
         INY
         INY
         LDA   |$0014,X
         STA   [$28],Y
         PLY
         INY
         TXA
         CLC
         ADC   #22
         TAX
L108A    CPX   #$FFFF
         BCS   L1092
         BRL   L1025
L1092    RTS

*--------------------------
* Routines scrolls
*--------------------------

DoScroll LDA   MyColumn	; Ma colonne
         CMP   #18
         BCS   scrol1
         BRL   ScrollNorth
scrol1   CMP   #36
         BCS   scrol2
         BRL   ScrollEast
scrol2   CMP   #54
         BCS   scrol3
         BRL   ScrollSouth
scrol3   BRL   ScrollWest

*--- Scroll plateau haut->bas

ScrollNorth LDX MyColumn
         LDA   TblPlateau,X
         STA   MyArrivee

         LDA   Fleches,X
         DEC
         ASL
         TAX
         LDA   TblPlateau2,X
         CLC
         ADC   MyArrivee
         STA   MyDepart

         LDX   MyDepart
         LDA   Plateau,X
         TAY
]lp      TXA
         SEC
         SBC   #18
         TAX
         LDA   Plateau,X
         STA   Plateau+18,X
         CPX   MyArrivee
         BNE   ]lp
         TYA
         STA   Plateau,X

         LDA   Diabolic
         BNE   noScrN
         JSR   ScrNorth
noScrN   RTS

*--- Scroll plateau droite->gauche

ScrollEast LDX MyColumn
         LDA   TblPlateau,X
         CLC
         ADC   #2
         STA   MyArrivee

         LDA   Fleches,X
         ASL
         STA   PlaEast1+1
         LDA   MyArrivee
         SEC
PlaEast1 SBC   #$0000
         STA   MyDepart

         LDX   MyDepart
         LDA   Plateau,X
         TAY
]lp      LDA   Plateau+2,X
         STA   Plateau,X
         INX
         INX
         CPX   MyArrivee
         BNE   ]lp
         TYA
         STA   Plateau-2,X

         LDA   Diabolic
         BNE   noScrE
         JSR   ScrEast
noScrE   RTS

*--- Scroll plateau bas->haut

ScrollSouth LDX MyColumn
         LDA   TblPlateau,X
         STA   MyArrivee

         LDA   Fleches,X
         DEC
         ASL
         TAX
         LDA   TblPlateau2,X
         STA   PlaSouth1+1

         LDA   MyArrivee
         SEC
PlaSouth1 SBC  #$FFFF
         STA   MyDepart

         LDX   MyDepart
         LDA   Plateau,X
         TAY
]lp      LDA   Plateau+18,X
         STA   Plateau,X
         TXA
         CLC
         ADC   #18
         TAX
         CPX   MyArrivee
         BNE   ]lp
         TYA
         STA   Plateau,X

         LDA   Diabolic
         BNE   noScrS
         JSR   ScrSouth
noScrS   RTS

*--- Scroll plateau gauche->droite

ScrollWest LDX MyColumn
         LDA   TblPlateau,X
         STA   MyArrivee

         LDA   Fleches,X
         ASL
         CLC
         ADC   MyArrivee
         SEC
         SBC   #2
         STA   MyDepart

         LDX   MyDepart
         LDA   Plateau,X
         TAY
]lp      DEX
         DEX
         LDA   Plateau,X
         STA   Plateau+2,X
         CPX   MyArrivee
         BNE   ]lp
         TYA
         STA   Plateau,X

         LDA   Diabolic
         BNE   noScrW
         JSR   ScrWest
noScrW   RTS

         ASC   8D8D
         ASC   'Nice meeting at Burger Bill'27'home, next time in LogicWare office ??'8D8D

*--------------------------
* Routines scrolls ecran
*--------------------------

*--- Retourne l'adresse mémoire d'une ligne à partir d'un index

calcXY   ASL
         ASL
         TAY
         LDA   lineBANK1+2,Y
         TAX
         LDA   lineBANK1,Y
         CLC
         ADC   scrX1
         TAY
         RTS

*--- Copie la ligne du haut dans le buffer

saveLINE
         LDY   #0
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         INY
         LDA   [$34],Y
         STA   bufLIGNE,Y
         RTS

*--- Restaure la ligne copiee

restoreLINE
         LDY   #0
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         INY
         LDA   bufLIGNE,Y
         STA   [$30],Y
         RTS

*--------------------------
* Routines scrolls ecran
*--------------------------

*--- Scroll plateau haut->bas

ScrNorth LDX   MyArrivee
         LDA   scrBigY,X
         STA   MyArrivee
         STA   firstY1
         LDA   scrBigX,X
         STA   scrX1
         LDX   MyDepart
         TXA
         LDA   scrBigY,X
         CLC
         ADC   #$0022
         STA   MyDepart
         STA   lastY1
         LDX   #$0023
L1325    PHX
         LDA   MyDepart
         JSR   calcXY
         STY   $34
         STY   $3C
         STX   $36
         STX   $3E
         LDA   MyArrivee
         JSR   calcXY
         STY   $30
         STX   $32
         LDA   MyDepart
         DEC
         STA   MyDepart2
         JSR   saveLINE
L1348    LDA   MyDepart2
         JSR   calcXY
         STY   $38
         STX   $3A
         LDY   #$0022
L1355    LDA   [$38],Y
         STA   [$3C],Y
         DEY
         BPL   L1355
         LDA   $38
         STA   $3C
         LDA   $3A
         STA   $3E
         DEC   MyDepart2
         LDA   MyDepart2
         CMP   MyArrivee
         BCS   L1348
         JSR   restoreLINE
         PLX
         DEX
         BEQ   L1386
         CPX   #$0011
         BEQ   L137E
         BRL   L1325
L137E    PHX
         JSR   refreshCOLUMN
         PLX
         BRL   L1325
L1386    JSR   refreshCOLUMN
         RTS

*--- Scroll plateau droite->gauche

ScrEast  LDX   MyDepart
         LDA   scrBigY,X
         STA   MyDepart
         STA   MyDepart2
         STA   firstY3
         CLC
         ADC   #34
         STA   MyArrivee2
         STA   lastY3
         LDA   scrBigX,X
         STA   scrX1
         LDX   MyArrivee
         DEX
         DEX
         LDA   scrBigX,X
         CLC
         ADC   #34
         SEC
         SBC   scrX1
         STA   scrX2
         LDX   #$0023
L13BF    PHX
L13C0    LDA   MyDepart2
         JSR   calcXY
         STY   $34
         STX   $36
         INY
         STY   $30
         STX   $32
         SEP   #$20
         LDA   [$34]
         PHA
         LDY   #$0000
L13D7    LDA   [$30],Y
         STA   [$34],Y
         INY
         CPY   scrX2
         BCC   L13D7
         PLA
         STA   [$34],Y
         REP   #$20
         INC   MyDepart2
         LDA   MyDepart2
         CMP   MyArrivee2
         BCC   L13C0
         BEQ   L13C0
         LDA   MyDepart
         STA   MyDepart2
         PLX
         DEX
         BEQ   L140D
         CPX   #$0011
         BEQ   L1405
         BRL   L13BF
L1405    PHX
         JSR   refreshLINE
         PLX
         BRL   L13BF
L140D    JSR   refreshLINE
         RTS

*--- Scroll plateau bas->haut

ScrSouth LDX   MyArrivee
         LDA   scrBigY,X
         CLC
         ADC   #$0022
         STA   MyArrivee
         STA   lastY1
         LDA   scrBigX,X
         STA   scrX1
         LDX   MyDepart
         LDA   scrBigY,X
         STA   MyDepart
         STA   firstY1
         LDX   #$0023
L1436    PHX
         LDA   MyDepart
         JSR   calcXY
         STY   $34
         STY   $3C
         STX   $36
         STX   $3E
         LDA   MyArrivee
         JSR   calcXY
         STY   $30
         STX   $32
         LDA   MyDepart
         INC
         STA   MyDepart2
         JSR   saveLINE
L1459    LDA   MyDepart2
         JSR   calcXY
         STY   $38
         STX   $3A
         LDY   #$0022
L1466    LDA   [$38],Y
         STA   [$3C],Y
         DEY
         BPL   L1466
         LDA   $38
         STA   $3C
         LDA   $3A
         STA   $3E
         INC   MyDepart2
         LDA   MyArrivee
         CMP   MyDepart2
         BCS   L1459
         JSR   restoreLINE
         PLX
         DEX
         BEQ   L1497
         CPX   #$0011
         BEQ   L148F
         BRL   L1436
L148F    PHX
         JSR   refreshCOLUMN
         PLX
         BRL   L1436
L1497    JSR   refreshCOLUMN
         RTS

*--- Scroll plateau gauche->droite

ScrWest  LDX   MyDepart
         LDA   scrBigY,X
         STA   MyDepart
         STA   MyDepart2
         STA   firstY3
         CLC
         ADC   #$0022
         STA   MyArrivee2
         STA   lastY3
         LDA   scrBigX,X
         SEC
         SBC   #$0006
         STA   scrX2
         LDX   MyArrivee
         LDA   scrBigX,X
         STA   scrX1
         LDX   #$0023
L14CA    PHX
L14CB    LDA   MyDepart2
         JSR   calcXY
         STY   $30
         STX   $32
         INY
         STY   $34
         STX   $36
         SEP   #$20
         LDY   scrX2
         LDA   [$30],Y
         PHA
         DEY
L14E3    LDA   [$30],Y
         STA   [$34],Y
         DEY
         BPL   L14E3
         PLA
         STA   [$30]
         REP   #$20
         INC   MyDepart2
         LDA   MyDepart2
         CMP   MyArrivee2
         BCC   L14CB
         BEQ   L14CB
         LDA   MyDepart
         STA   MyDepart2
         PLX
         DEX
         BEQ   L1516
         CPX   #$0011
         BEQ   L150E
         BRL   L14CA
L150E    PHX
         JSR   refreshLINE
         PLX
         BRL   L14CA
L1516    JSR   refreshLINE
         RTS

         ASC   8D8D
         ASC   'Corona for ever, Cobol for never !'8D8D

*--------------------------
* Sprites routines
*--------------------------

*--- Affiche un gros sprite (35x35)

WriteBig DEC		; en A le sprite à afficher
         ASL
         TAY
         LDA   SprBig+2,Y	; adresse de fin du sprite
         STA   L15F2+1
         LDA   SprBig,Y	; adresse de début
         TAY
         LDA   scrBigX,X
         STA   SprX
         LDA   scrBigY,X
         STA   SprY
         TYX		; => adresse de début du sprite
         LDY   SprY
L155D    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $0C
         LDA   lineBANK1+2,Y
         STA   $0E
         LDY   SprX
         LDA   |$0000,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0002,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0004,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0006,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0008,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$000A,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$000C,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$000E,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0010,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0012,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0014,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0016,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0018,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$001A,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$001C,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$001E,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0020,X
         STA   [$0C],Y
         INY
         LDA   |$0022,X
         STA   [$0C],Y
         PLY
         INY
         TXA
         CLC
         ADC   #35	; 35 de large
         TAX
L15F2    CPX   #$FFFF
         BCS   L15FA
         BRL   L155D
L15FA    RTS

*--- Affiche un petit sprite (14x14)

WriteSmall
         DEC
         ASL
         TAY
         LDA   SprSmall+2,Y
         STA   L1661+1
         LDA   SprSmall,Y
         TAY
         LDA   scrSmallX,X
         STA   SprX
         LDA   scrSmallY,X
         STA   SprY
         TYX
         LDY   SprY
L1618    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $0C
         LDA   lineBANK1+2,Y
         STA   $0E
         LDY   SprX
         LDA   |$0000,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0002,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0004,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0006,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$0008,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$000A,X
         STA   [$0C],Y
         INY
         INY
         LDA   |$000C,X
         STA   [$0C],Y
         PLY
         INY
         TXA
         CLC
         ADC   #14	; 14 de large
         TAX
L1661    CPX   #$FFFF
         BNE   L1618
         RTS

         ASC   8D8D
         ASC   'No more Yada Yada... Seinfeld show is over :-('8D8D

*--------------------------
* Routines ressources
*--------------------------

loadTITRE
         PHA		; Title
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0024
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrIMAGE1
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrIMAGE1+2
         PLD
         PLA
         PLA
         BCC   L16C3
         JMP   resERR

L16C3    PHA		; About
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0025
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrIMAGE2
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrIMAGE2+2
         PLD
         PLA
         PLA
         BCC   L16ED
         JMP   resERR

L16ED    PHA		; VGA palette
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0014
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrPANEL1
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrPANEL1+2
         PLD
         PLA
         PLA
         BCC   L1717
         JMP   resERR

L1717    PHA		; VGA palette
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0015
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrPANEL2
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrPANEL2+2
         PLD
         PLA
         PLA
         BCC   L1741
         JMP   resERR
L1741    RTS

*--- Charge les images du jeu

loadIMAGES
         PHA		; Happyland
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0020
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrIMAGE1
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrIMAGE1+2
         PLD
         PLA
         PLA
         BCC   L176C
         JMP   resERR

L176C    PHA		; Ludyland
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0021
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrIMAGE2
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrIMAGE2+2
         PLD
         PLA
         PLA
         BCC   L1796
         JMP   resERR

L1796    PHA		; Planet
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0022
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrIMAGE3
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrIMAGE3+2
         PLD
         PLA
         PLA
         BCC   L17C0
         JMP   resERR

L17C0    PHA		; Xenoland
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0023
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrIMAGE4
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrIMAGE4+2
         PLD
         PLA
         PLA
         BCC   L17EA
         JMP   resERR
L17EA    RTS

*---

loadDATA PHA		; Data Happyland
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0010
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrPANEL1
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrPANEL1+2
         PLD
         PLA
         PLA
         BCC   L1815
         JMP   resERR

L1815    PHA		; Data Ludyland
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0011
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrPANEL2
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrPANEL2+2
         PLD
         PLA
         PLA
         BCC   L183F
         JMP   resERR

L183F    PHA		; Data Planet
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0012
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrPANEL3
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrPANEL3+2
         PLD
         PLA
         PLA
         BCC   L1869
         JMP   resERR

L1869    PHA		; Data Xenoland
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0013
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrPANEL4
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrPANEL4+2
         PLD
         PLA
         PLA
         BCC   L1893
         JMP   resERR
L1893    RTS

*--------------------------
* Routines gs/os
*--------------------------

loadFILE JSL   GSOS
         DW    $2010      ; Open
         ADRL  proOpen
         BCS   loadERR
	 
         LDA   proOpen+2
         STA   proRead+2
         STA   proClose+2

         JSL   GSOS
         DW    $2012      ; Read
         ADRL  proRead

loadERR  PHP
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  proClose
         PLP
         RTS

*---

saveFILE JSL   GSOS
         DW    $2005      ; SetFileInfo
         ADRL  proInfo

         JSL   GSOS
         DW    $2002      ; Destroy
         ADRL  proKill

         JSL   GSOS
         DW    $2001      ; Create
         ADRL  proCreate
         BCS   saveERR

         JSL   GSOS
         DW    $2010      ; Open
         ADRL  proOpen

         LDA   proOpen+2
         STA   proWrite+2
         STA   proClose+2

         JSL   GSOS
         DW    $2013      ; Write
         ADRL  proWrite

saveERR  JSL   GSOS
         DW    $2014      ; Close
         ADRL  proClose
         RTS

         ASC   8D8D
         ASC   'Godzilla is back ! Thanks to the French nuclear tests. '
	 ASC   'If there were none, the film would not have existed :->'8D8D

*--------------------------
* Routines diverses
*--------------------------

*--- Erreur de memoire

memERR   BCS   memERR1
         RTS

memERR1	 PushWord #0
	 PushLong #memSTR1
	 PushLong #memSTR2
	 PushLong #memSTR3
	 PushLong #memSTR4
         _TLTextMountVolume
         PLA
         JMP   initOFF

resERR	 PushWord #0
	 PushLong #memSTR2
	 PushLong #memSTR3
	 PushLong #memSTR4
	 PushLong #memSTR4
         _TLTextMountVolume
         PLA
         JMP   initOFF

*--- Genere un nombre aleatoire

Random   LDAL  $E0C02E
         XBA
         CLC
         ADC   VBLCounter0
         STA   VBLCounter0
         AND   #$00FF
         RTS

*--------------------------
* Interruption VBL
*--------------------------

         MX    %11

myVBL    ADRL  $00000000
VBLcnt   DW    $003C
         DW    $A55A

         PHB
         PHK
         PLB
         LDA   #60
         STA   VBLcnt
         LDA   Melange
         BEQ   noVBL
         LDX   #$01
         LDA   Temps+2
         INC
         CMP   #60
         BEQ   L19F9
         STA   Temps+2
         BRA   L1A1B
L19F9    STZ   Temps+2
         INX
         LDA   Temps
         INC
         CMP   #60
         BEQ   L1A0A
         STA   Temps
         BRA   L1A1B
L1A0A    STZ   Temps
         INX
         LDA   Temps
         INC
         CMP   #60
         BNE   L1A18
         LDA   #$00
L1A18    STA   Temps
L1A1B    STX   noINTER

noVBL    SEP   #$30
         PLB
         CLC
         RTL

	 MX    %00	; A laisser pour avoir suite en 16 bits

*---

myRAN    ADRL  $00000000
RANcnt   DW    $0001
         DW    $A55A
	 
         PHB
         PHK
         PLB
         REP   #$30

         INC   VBLCounter0

         LDA   #$0001
         STA   RANcnt
         SEP   #$30
         PLB
         CLC
         RTL

         MX    %00

*---

         PHA
         PHA
         PEA   $0001
         PEA   $0000
         LDA   myID
         PHA
         PEA   $C01C
         PEA   $0000
         PEA   $0000
         _NewHandle
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrMEM
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrMEM+2
         PLD
         PLY
         STY   haMEM
         PLX
         STX   haMEM+2
         RTS

*--------------------------
* Routines graphiques
*--------------------------

unpackPCX ASL
         ASL
         TAX
         LDA   ptrIMAGE1,X
         CLC
         ADC   #$0080	; entête de 128 octets
         STA   $24
         LDA   ptrIMAGE1+2,X
         ADC   #$0000
         STA   $26
         STZ   numLIGNE
         LDA   lineBANK1
         STA   $04
         LDA   lineBANK1+2
         STA   $06
         LDY   #$0000
L1A98    JSR   L1AE2
         CMP   #$00C0
         BCC   L1AB8
         AND   #$003F
         STA   PCXcnt
         JSR   L1AE2
L1AA9    STA   [$04],Y
         INY
         CPY   #$FA00
         BCS   L1AC0
         DEC   PCXcnt
         BNE   L1AA9
         BRA   L1A98
L1AB8    STA   [$04],Y
         INY
         CPY   #$FA00
         BNE   L1A98

L1AC0    LDA   numLIGNE	; on a 100 lignes par banc
         CLC
         ADC   #100
         STA   numLIGNE
         CMP   #$0190
         BCS   L1AE1
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $04
         LDA   lineBANK1+2,Y
         STA   $06
         LDY   #$0000
         BRA   L1A98
L1AE1    RTS

L1AE2    LDA   [$24]
         AND   #$00FF
         INC   $24
         BNE   L1AED
         INC   $26
L1AED    RTS

PCXcnt   DS    2
numLIGNE DS    2

*--- Affiche l'image avec un fade in

showIMAGE
         ASL
         ASL
         TAX
         LDA   ptrPANEL1,X
         STA   $20
         LDA   ptrPANEL1+2,X
         STA   $20+2
         LDY   #768-2
]lp      LDA   [$20],Y
         STA   refPALETTE,Y
         DEY
         DEY
         BPL   ]lp

         LDA   #0
         STA   firstLINE
         LDA   #400-1
         STA   lastLINE
         JSR   refreshSCREEN

*---

fadeIN   LDY   #$0100
L1B1D    PHY
         LDX   #$02FF
         SEP   #$20
L1B23    LDA   thePALETTE,X
         CMP   refPALETTE,X
         BEQ   L1B4F
         INC   thePALETTE,X
         LDA   thePALETTE,X
         CMP   refPALETTE,X
         BEQ   L1B4F
         INC   thePALETTE,X
         LDA   thePALETTE,X
         CMP   refPALETTE,X
         BEQ   L1B4F
         INC   thePALETTE,X
         LDA   thePALETTE,X
         CMP   refPALETTE,X
         BEQ   L1B4F
         INC   thePALETTE,X
L1B4F    DEX
         BPL   L1B23
         REP   #$20
         PEA   ^thePALETTE
         PEA   thePALETTE
         JSL   _xSetPalette
         PLY
         DEY
         BNE   L1B1D
         RTS

fadeOUT  LDY   #$0100
L1B66    PHY
         LDX   #$02FF
         SEP   #$20
L1B6C    LDA   thePALETTE,X
         BEQ   L1B83
         DEC   thePALETTE,X
         BEQ   L1B83
         DEC   thePALETTE,X
         BEQ   L1B83
         DEC   thePALETTE,X
         BEQ   L1B83
         DEC   thePALETTE,X
L1B83    DEX
         BPL   L1B6C
         REP   #$20
         PEA   ^thePALETTE
         PEA   thePALETTE
         JSL   _xSetPalette
         PLY
         DEY
         BNE   L1B66
         RTS

         ASC   8D8D
         ASC   'The finest clothes on Peer 39 : a Wallace & Gromit T-Shirt !!!'8D8D

*--- Affiche une chaine de nombres (petits caracteres) en rouge (8x12)

printNUMR
         PHA
         LDA   #sprNumR
         STA   L1C23+1
         STA   L1C2B+1
         PLA
         BRA   L1BF1

*--- Affiche une chaine de nombres (petits caracteres) en jaune (8x12)

printNUMJ
         PHA
         LDA   #sprNumJ
         STA   L1C23+1
         STA   L1C2B+1
         PLA

L1BF1    STA   L1BFA+1
         STX   SprX
         STY   SprY
L1BFA    LDA   $FFFF
         AND   #$00FF
         BNE   L1C13
         LDA   SprY
         STA   firstY4
         CLC
         ADC   #$000D
         STA   lastY4
         JSR   refreshPANEL
         RTS

L1C13    CMP   #$0020
         BNE   L1C1B
         LDA   #'0'
L1C1B    SEC
         SBC   #'0'
         ASL
         TAX
         INX
         INX
L1C23    LDA   sprNumR,X
         STA   L1C66+1
         DEX
         DEX
L1C2B    LDA   sprNumR,X
         TAX
         LDY   SprY
L1C32    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $10
         LDA   lineBANK1+2,Y
         STA   $12
         LDY   SprX
         LDA   |$0000,X
         STA   [$10],Y
         INY
         INY
         LDA   |$0002,X
         STA   [$10],Y
         INY
         INY
         LDA   |$0004,X
         STA   [$10],Y
         INY
         INY
         LDA   |$0006,X
         STA   [$10],Y
         PLY
         INY
         TXA
         CLC
         ADC   #8
         TAX
L1C66    CPX   #$FFFF
         BNE   L1C32
         LDA   SprX
         CLC
         ADC   #8
         STA   SprX
         INC   L1BFA+1
         BRL   L1BFA

*--------------------------
* Routines sonores
*--------------------------

initSOUND PHA
         _SoundToolStatus
         PLA
         BPL   L1C8A
         INC   fgNOSOUND
         RTS

L1C8A    TDC
         CLC
         ADC   #$0100
         PHA
         _SoundStartUp

         PHA		; load click sound
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0001
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrSOUND1
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrSOUND1+2
         PLD
         PLA
         STA   haSOUND1
         PLA
         STA   haSOUND1+2
         BCC   L1CC7
         INC   fgNOSOUND1

L1CC7    PHA		; load tada sound
         PHA
         PEA   $BDBD
         PEA   $0000
         PEA   $0002
         _LoadResource
         PHD
         TSC
         TCD
         LDA   [$03]
         STA   ptrSOUND2
         LDY   #$0002
         LDA   [$03],Y
         STA   ptrSOUND2+2
         PLD
         PLA
         STA   haSOUND2
         PLA
         STA   haSOUND2+2
         BCC   L1CF7
         INC   fgNOSOUND2
L1CF7    RTS

*---

sndOFF   LDA   fgNOSOUND
         BNE   L1D04
         _SoundShutDown
L1D04    RTS

*---

playSND  LDA   fgNOSOUND
         ORA   fgNOMUSIC
         BNE   L1D53
         CPX   #$0001
         BEQ   L1D22
         LDA   fgNOSOUND1
         BNE   L1D53
         LDX   ptrSOUND1+2
         LDY   ptrSOUND1
         LDA   #$0028
         BRA   L1D30
L1D22    LDA   fgNOSOUND2
         BNE   L1D53
         LDX   ptrSOUND2+2
         LDY   ptrSOUND2
         LDA   #$00EB
L1D30    STY   pZIKptr
         STX   pZIKptr+2
         STA   pZIKptr+4

         PushWord #%01111111_11111111
         _FFStopSound
         PEA   $0201
         PEA   ^pZIKptr
         PEA   pZIKptr
         _FFStartSound
L1D53    RTS

pZIKptr  DS    4
         DS    2
         DW    $01B7
         DW    $8000
         DW    $0006
         DS    4
         DW    $00FF

fgNOSOUND DS   2
fgNOSOUND1 DS  2
fgNOSOUND2 DS  2
fgNOMUSIC DS   2

haSOUND1 DS    4
haSOUND2 DS    4
ptrSOUND1 DS   4
ptrSOUND2 DS   4

         ASC   8D8D
         ASC   'True is not out there... here it is : http://www.cyberstation.fr/~zardini'8D8D

*--- Mouse routines - See blockade.Mice.s pour plus d'informations

moREAD   JSR   moTOOL
         LDA   moX
         CMP   oldX
         BNE   moREAD1
         LDA   moY
         CMP   oldY
         BNE   moREAD1
         RTS

moREAD1  JSR   moBACK
         LDX   moX
         STX   oldX
         LDY   moY
         STY   oldY
         JSR   moFORE
         RTS

moCONTROL
         LDA   window
         ASL
         TAX
         LDA   windowS+2,X
         ASL
         PHA
         LDA   windowS,X
         ASL
         TAX
L1E01    LDA   moX
         CMP   FlecheX1,X
         BCC   L1E1B
         CMP   FlecheX2,X
         BCS   L1E1B
         LDA   moY
         CMP   FlecheY1,X
         BCC   L1E1B
         CMP   FlecheY2,X
         BCC   L1E25
L1E1B    INX
         INX
         TXA
         CMP   $01,S
         BCC   L1E01
         LDX   #$FFFF

L1E25    PLA
         LDA   moBTN0
         AND   #$00C0
         CMP   #$0040
         BEQ   L1E40
         CMP   #$0080
         BEQ   L1E88
         CMP   #$00C0
         BNE   L1E3E
         BRL   L1EB1
L1E3E    SEC
         RTS

*- is up, was down

L1E40    CPX   #$FFFF
         BNE   L1E63
         LDX   windowC
         LDA   FlecheStatut,X
         AND   #$0002
         BNE   L1E61
         LDA   FlecheStatut,X
         AND   #$0001
         BEQ   L1E61
         LDA   FlecheStatut,X
         AND   #$FFFE
         STA   FlecheStatut,X
L1E61    SEC
         RTS

L1E63    CPX   windowC
         BNE   L1E61
         LDA   FlecheStatut,X
         AND   #$0002
         BNE   L1E61
         LDA   FlecheStatut,X
         AND   #$0001
         BEQ   L1E84
         LDA   FlecheStatut,X
         AND   #$FFFE
         STA   FlecheStatut,X
         JSR   inverseNON
L1E84    TXA
         LSR
         CLC
         RTS

L1E88    CPX   #$FFFF
         BEQ   L1EAF
         LDA   FlecheStatut,X
         AND   #$0002
         BNE   L1EAF
         STX   windowC
         LDA   FlecheStatut,X
         AND   #$0001
         BNE   L1EAF
         LDA   FlecheStatut,X
         AND   #$FFFE
         ORA   #$0001
         STA   FlecheStatut,X
         JSR   inverseOUI
L1EAF    SEC
         RTS

L1EB1    CPX   windowC
         BEQ   L1EDC
         LDX   windowC
         CPX   #$FFFF
         BEQ   L1EDA
         LDA   FlecheStatut,X
         AND   #$0002
         BNE   L1EDA
         LDA   FlecheStatut,X
         AND   #$0001
         BEQ   L1EDA
         LDA   FlecheStatut,X
         AND   #$FFFE
         STA   FlecheStatut,X
         JSR   inverseNON
L1EDA    SEC
         RTS

L1EDC    CPX   #$FFFF
         BEQ   L1F00
         LDA   FlecheStatut,X
         AND   #$0002
         BNE   L1F00
         LDA   FlecheStatut,X
         AND   #$0001
         BNE   L1F00
         LDA   FlecheStatut,X
         AND   #$FFFE
         ORA   #$0001
         STA   FlecheStatut,X
         JSR   inverseOUI
L1F00    SEC
         RTS

inverseOUI
         PHX
         LDA   Fleches2,X
         BEQ   L1F2D
         JSR   moBACK
         PLX
         PHX
         LDA   FlecheY1,X
         STA   firstY3
         LDA   FlecheY2,X
         STA   lastY3
         LDA   FlecheAffiche,X
         STA   L1F24+1
         TXY
         LDA   FlecheSprOui,X
         TAX
L1F24    JSR   $FFFF
         JSR   refreshLINE
         JSR   moFORE
L1F2D    PLX
         RTS

inverseNON    PHX
         LDA   Fleches2,X
         BEQ   L1F5A
         JSR   moBACK
         PLX
         PHX
         LDA   FlecheY1,X
         STA   firstY3
         LDA   FlecheY2,X
         STA   lastY3
         LDA   FlecheAffiche,X
         STA   L1F51+1
         TXY
         LDA   FlecheSprNon,X
         TAX
L1F51    JSR   $FFFF
         JSR   refreshLINE
         JSR   moFORE
L1F5A    PLX
         RTS

waitMOUSEUP
         JSR   moTOOL
         LDA   moBTN0
         CMP   #$0040
         BNE   waitMOUSEUP
         RTS

*--------------------------------------

maximumX	=	64
maximumY	=	64

*---

moTOOL   ldal  $e0c026
         bpl   moTOOL1
         and   #%00000010_00000000
         beq   moTOOL2
         ldal  $e0c024
moTOOL1  rts

moTOOL2  ldal  $e0c024
         tax
         and   #%00000000_10000000
         eor   #%00000000_10000000
         lsr   moBTN1
         eor   moBTN1
         and   #%00000000_11000000
         sta   moBTN1

         ldal  $e0c024
         tay
         and   #%00000000_10000000
         eor   #%00000000_10000000
         lsr   moBTN0
         eor   moBTN0
         and   #%00000000_11000000
         sta   moBTN0

*- Occupe toi de X

         txa
         and   #%00000000_00111111
         pha
         txa
         and   #%00000000_01000000
         beq   moTOOL3

         lda   moX
         clc
         adc   1,s
         sec
         sbc   #64
         bcc   moTOOL4
         sta   moX
         bra   moTOOL4

moTOOL3  lda   moX
         clc
         adc   1,s
         cmp   #maximumX
         bcs   moTOOL4
         sta   moX

*- Occupe toi de Y

moTOOL4  pla              ; Recupere la pile

         tya
         and   #%00000000_00111111
         pha
         tya
         and   #%00000000_01000000
         beq   moTOOL6

         lda   moY
         clc
         adc   1,s
         sec
         sbc   #64
         bcc   moTOOL5
         sta   moY
moTOOL5  pla
         rts

moTOOL6  lda   moY
         clc
         adc   1,s
         cmp   #maximumY
         bcs   moTOOL7
         sta   moY
moTOOL7  pla
         rts

*--------------------------------------

moBACK   LDX   #$0000
         LDY   oldY
L2003    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $14
         LDA   lineBANK1+2,Y
         STA   $16
         LDY   oldX
         LDA   moDATA,X
         STA   [$14],Y
         INY
         INY
         LDA   moDATA+2,X
         STA   [$14],Y
         INY
         INY
         LDA   moDATA+4,X
         STA   [$14],Y
         INY
         INY
         LDA   moDATA+6,X
         STA   [$14],Y
         INY
         INY
         LDA   moDATA+8,X
         STA   [$14],Y
         INY
         INY
         LDA   moDATA+$A,X
         STA   [$14],Y
         INY
         INY
         LDA   moDATA+$C,X
         STA   [$14],Y
         PLY
         INY
         TXA
         CLC
         ADC   #$000E
         TAX
         CPX   #$00C4
         BEQ   L2054
         BRL   L2003
L2054    LDA   oldX
         STA   offsetX
         LDA   oldY
         STA   firstY2
         CLC
         ADC   #$000E
         STA   lastY2
         JSR   refreshCURSOR
         RTS

*--------------------------------------

moFORE   LDX   #$0000
         LDY   moY
L2071    PHY
         TYA
         ASL
         ASL
         TAY
         LDA   lineBANK1,Y
         STA   $14
         LDA   lineBANK1+2,Y
         STA   $16
         LDY   moX
         LDA   [$14],Y
         STA   moDATA,X
         AND   moMASK,X
         ORA   moSPRI,X
         STA   [$14],Y
         INY
         INY
         LDA   [$14],Y
         STA   moDATA+2,X
         AND   moMASK+2,X
         ORA   moSPRI+2,X
         STA   [$14],Y
         INY
         INY
         LDA   [$14],Y
         STA   moDATA+4,X
         AND   moMASK+4,X
         ORA   moSPRI+4,X
         STA   [$14],Y
         INY
         INY
         LDA   [$14],Y
         STA   moDATA+6,X
         AND   moMASK+6,X
         ORA   moSPRI+6,X
         STA   [$14],Y
         INY
         INY
         LDA   [$14],Y
         STA   moDATA+8,X
         AND   moMASK+8,X
         ORA   moSPRI+8,X
         STA   [$14],Y
         INY
         INY
         LDA   [$14],Y
         STA   moDATA+$A,X
         AND   moMASK+$A,X
         ORA   moSPRI+$A,X
         STA   [$14],Y
         INY
         INY
         LDA   [$14],Y
         STA   moDATA+$C,X
         AND   moMASK+$C,X
         ORA   moSPRI+$C,X
         STA   [$14],Y
         PLY
         INY
         TXA
         CLC
         ADC   #$000E
         TAX
         CPX   #$00C4
         BEQ   L20FA
         BRL   L2071
L20FA    LDA   moX
         STA   offsetX
         LDA   moY
         STA   firstY2
         CLC
         ADC   #$000E
         STA   lastY2
         JSR   refreshCURSOR
         RTS

offsetX  DS    2
moX      DS    2
moY      DS    2
moBTN0   DS    2
moBTN1   DS    2
oldX     DS    2
oldY     DS    2

moDATA   HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
         HEX   0000000000000000000000000000
moSPRI   HEX   0000000000000000000000000000
         HEX   00FFFFFF00000000000000000000
         HEX   00FFFFFFFFFFFF00000000000000
         HEX   00FFFFFFFFFFFFFFFFFF00000000
         HEX   0000FFFFFFFFFFFFFFFFFFFFFF00
         HEX   0000FFFFFFFFFFFFFFFFFF000000
         HEX   0000FFFFFFFFFFFFFF0000000000
         HEX   000000FFFFFFFF00000000000000
         HEX   000000FFFFFFFF00000000000000
         HEX   000000FFFFFF0000000000000000
         HEX   00000000FFFF0000000000000000
         HEX   00000000FF000000000000000000
         HEX   00000000FF000000000000000000
         HEX   0000000000000000000000000000
moMASK   HEX   00000000FFFFFFFFFFFFFFFFFFFF
         HEX   00000000000000FFFFFFFFFFFFFF
         HEX   00000000000000000000FFFFFFFF
         HEX   00000000000000000000000000FF
         HEX   FF00000000000000000000000000
         HEX   FF000000000000000000000000FF
         HEX   FF00000000000000000000FFFFFF
         HEX   FFFF00000000000000FFFFFFFFFF
         HEX   FFFF000000000000FFFFFFFFFFFF
         HEX   FFFF0000000000FFFFFFFFFFFFFF
         HEX   FFFFFF00000000FFFFFFFFFFFFFF
         HEX   FFFFFF000000FFFFFFFFFFFFFFFF
         HEX   FFFFFF000000FFFFFFFFFFFFFFFF
         HEX   FFFFFFFF00FFFFFFFFFFFFFFFFFF

window   DW    $0000	; on'a qu'une fenêtre
windowC  DW    $FFFF
windowS  DW    $0000	; on part du bouton 0 et
         DW    $0024	; on a 36 boutons sur le plateau

*--- Les coordonnees des flèches sur l'écran

FlecheX1 DW    $002A	; X de départ
         DW    $004D
         DW    $0070
         DW    $0093
         DW    $00B6
         DW    $00D9
         DW    $00FC
         DW    $011F
         DW    $0142
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $0164
         DW    $002A
         DW    $004D
         DW    $0070
         DW    $0093
         DW    $00B6
         DW    $00D9
         DW    $00FC
         DW    $011F
         DW    $0142
         DW    $0011
         DW    $0011
         DW    $0011
         DW    $0011
         DW    $0011
         DW    $0011
         DW    $0011
         DW    $0011
         DW    $0011

FlecheX2 DW    $004C	; X de fin
         DW    $006F
         DW    $0092
         DW    $00B5
         DW    $00D8
         DW    $00FB
         DW    $011E
         DW    $0141
         DW    $0164
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $0177
         DW    $004C
         DW    $006F
         DW    $0092
         DW    $00B5
         DW    $00D8
         DW    $00FB
         DW    $011E
         DW    $0141
         DW    $0164
         DW    $0025
         DW    $0025
         DW    $0025
         DW    $0025
         DW    $0025
         DW    $0025
         DW    $0025
         DW    $0025
         DW    $0025

FlecheY1 DW    $0006	; Y de départ
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $001F
         DW    $0042
         DW    $0065
         DW    $0088
         DW    $00AB
         DW    $00CE
         DW    $00F1
         DW    $0114
         DW    $0137
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $0158
         DW    $001F
         DW    $0042
         DW    $0065
         DW    $0088
         DW    $00AB
         DW    $00CE
         DW    $00F1
         DW    $0114
         DW    $0137
	 
FlecheY2 DW    $001A	; Y de fin
         DW    $001A
         DW    $001A
         DW    $001A
         DW    $001A
         DW    $001A
         DW    $001A
         DW    $001A
         DW    $001A
         DW    $0041
         DW    $0064
         DW    $0087
         DW    $00AA
         DW    $00CD
         DW    $00F0
         DW    $0113
         DW    $0136
         DW    $0159
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $016C
         DW    $0041
         DW    $0064
         DW    $0087
         DW    $00AA
         DW    $00CD
         DW    $00F0
         DW    $0113
         DW    $0136
         DW    $0159

*--- Statut des flèches pour la routine de la souris (doit vouloir dire cliquable)

FlecheStatut
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004

*--- Sprite d'une fleche non appuyée

FlecheSprNon
         DA    LA029	; flèche haut/bas
         DA    LA029
         DA    LA029
         DA    LA029
         DA    LA029
         DA    LA029
         DA    LA029
         DA    LA029
         DA    LA029
         DA    LB037	; flèche gauche/droite
         DA    LB037
         DA    LB037
         DA    LB037
         DA    LB037
         DA    LB037
         DA    LB037
         DA    LB037
         DA    LB037
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LA83F
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3
         DA    LB7F3

*--- Sprite d'une fleche appuyée (ou l'inverse)

FlecheSprOui
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LA2DB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LB2CB
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LAAF1
         DA    LBA87
         DA    LBA87
         DA    LBA87
         DA    LBA87
         DA    LBA87
         DA    LBA87
         DA    LBA87
         DA    LBA87
         DA    LBA87

*--- Routines d'affichage des flèches

FlecheAffiche
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintNS
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    PrintEO
         DA    $0000
         DA    $0000

         ASC   8D8D
         ASC   'Cogito for Second Sight : The most beautiful game ever made on Apple IIgs !!! '
	 ASC   '(ok ok, we perfectly know that beautiful doesn'27't mean interesting... :-()'8D8D

*----------------------------------------
*
* Bibliotheque des appels SecondSight
*
* (c) 1995, Brutal Deluxe
*
*----------------------------------------

ssCOMMAND =    $E0C0B0
ssWRITEDATA =  $E0C0B1
ssREADDATA =   $E0C0B2
ssHANDSHAKE =  $E0C0B8

*----------------------------------------

initSS   JSR   calcPTRLIGNES
         JSR   calcLIGNES

         PEA   $03D4		; Probably Start Address Low Register
         PEA   $000D		; pour dire où l'image est dans
         PEA   $03D5		; la mémoire de la Second Sight
         PEA   $0000
         JSL   _xSetVGAReg

         PEA   $03D4		; Probably Start Address High Register
         PEA   $000C
         PEA   $03D5
         PEA   $0000
         JSL   _xSetVGAReg

         PEA   $0000		; color to set the pixels to
         PEA   $0000		; address to start setting pixels at
         PEA   $0000
         PEA   $0007		; two times 640x400x256
         PEA   $D000
         JSL   _xClearScreen

         PEA   ^thePALETTE	; uploads a complete new palette
         PEA   thePALETTE
         JSL   _xSetPalette

         PEA   $0061		; mode $61 - 640x400x256
         PEA   $0001
         JSL   _xSetMode
         RTS

*--- Prepare les numéros de ligne

calcPTRLIGNES
         LDX   #0
         TXA
]lp      STA   lineBANK1,X
         STA   lineBANK2,X
         STA   lineBANK3,X
         STA   lineBANK4,X
         TAY
         LDA   ptrBANK1+2
         STA   lineBANK1+2,X
         LDA   ptrBANK2+2
         STA   lineBANK2+2,X
         LDA   ptrBANK3+2
         STA   lineBANK3+2,X
         LDA   ptrBANK4+2
         STA   lineBANK4+2,X
         TYA
         CLC
         ADC   #640
         INX
         INX
         INX
         INX
         CPX   #400
         BNE   ]lp
         RTS

*--- Calcule l'adresse de départ des lignes

calcLIGNES
         LDX   #0
         STZ   temp
         STZ   temp+2
]lp      LDA   temp
         STA   Ligne,X
         LDA   temp+2
         STA   Ligne+2,X
         LDA   temp
         CLC
         ADC   #640
         STA   temp
         LDA   temp+2
         ADC   #0
         STA   temp+2
         INX
         INX
         INX
         INX
         CPX   #1600	; 400*4
         BNE   ]lp
         RTS

*--- Refresh une colonne de pions

refreshCOLUMN
         LDA   firstY1
]lp      PHA
         ASL
         ASL
         TAY
         PEA   $0001
         LDA   Ligne,Y
         CLC
         ADC   scrX1
         TAX
         LDA   Ligne+2,Y
         ADC   #$0000
         PHA
         PHX
         PEA   $0000
         PEA   $0022
         LDA   lineBANK1,Y
         CLC
         ADC   scrX1
         TAX
         LDA   lineBANK1+2,Y
         ADC   #$0000
         PHA
         PHX
         JSL   vgaCOLUMN
         PLA
         CLC
         ADC   #$0001
         CMP   lastY1
         BCC   ]lp
         BEQ   ]lp
         RTS

*--- Draw the mouse cursor onto the VGA buffer

refreshCURSOR
         LDA   firstY2
]lp      PHA
         ASL
         ASL
         TAY
         PEA   $0001
         LDA   Ligne,Y
         CLC
         ADC   offsetX
         TAX
         LDA   Ligne+2,Y
         ADC   #$0000
         PHA
         PHX
         PEA   $0000
         PEA   $000E
         LDA   lineBANK1,Y
         CLC
         ADC   offsetX
         TAX
         LDA   lineBANK1+2,Y
         ADC   #$0000
         PHA
         PHX
         JSL   vgaMOUSE
         PLA
         CLC
         ADC   #$0001
         CMP   lastY2
         BCC   ]lp
         BEQ   ]lp
         RTS

*--- Refresh une ligne de pions

refreshLINE
         LDA   firstY3
]lp      PHA
         ASL
         ASL
         TAY
         PEA   $0001
         LDA   Ligne+2,Y
         PHA
         LDA   Ligne,Y
         PHA
         PEA   $0000
         PEA   $0190
         LDA   lineBANK1+2,Y
         PHA
         LDA   lineBANK1,Y
         PHA
         JSL   vgaLINE
         PLA
         CLC
         ADC   #$0001
         CMP   lastY3
         BCC   ]lp
         BEQ   ]lp
         RTS

*--- Refresh the panel area

refreshPANEL
         LDA   firstY4
]lp      PHA
         ASL
         ASL
         TAY
         PEA   $0001
         LDA   Ligne,Y
         CLC
         ADC   PanelX
         TAX
         LDA   Ligne+2,Y
         ADC   #$0000
         PHA
         PHX
         PEA   $0000
         PEA   $0050
         LDA   lineBANK1,Y
         CLC
         ADC   PanelX
         TAX
         LDA   lineBANK1+2,Y
         ADC   #$0000
         PHA
         PHX
         JSL   vgaPANEL
         PLA
         CLC
         ADC   #1
         CMP   lastY4
         BCC   ]lp
         BEQ   ]lp
         RTS

*--- Refresh full screen

refreshSCREEN
         LDA   firstLINE
]lp      PHA
         ASL
         ASL
         TAY
         PEA   $0001
         LDA   Ligne+2,Y
         PHA
         LDA   Ligne,Y
         PHA
         PEA   $0000
         PEA   $0280
         LDA   lineBANK1+2,Y
         PHA
         LDA   lineBANK1,Y
         PHA
         JSL   vgaSCREEN
         PLA
         CLC
         ADC   #1
         CMP   lastLINE
         BCC   ]lp
         BEQ   ]lp
         RTS

*----------------------------------------
* Low-Level VGA routines
*----------------------------------------

vgaCOLUMN
         TSC		; Recopie de 34 pixels
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         STZ   $05
         PHP
         SEI
         LDA   #$0000
         SEP   #$20
         LDA   #$02
         STAL  ssCOMMAND
         LDA   #$01
L2848    CMPL  ssHANDSHAKE
         BNE   L2848
         LDA   $16
         STAL  ssWRITEDATA
         LDA   $12
         STAL  ssWRITEDATA
         LDA   $13
         STAL  ssWRITEDATA
         LDA   $14
         STAL  ssWRITEDATA
         LDA   $0E
         STAL  ssWRITEDATA
         LDA   $0F
         STAL  ssWRITEDATA
         LDA   $10
         STAL  ssWRITEDATA
         LDA   $0A
         STAL  ssWRITEDATA
         LDA   $0B
         STAL  ssWRITEDATA
         LDA   $0C
         STAL  ssWRITEDATA
         LDA   #$00
L288C    CMPL  ssHANDSHAKE
         BNE   L288C
         LDA   #$01
L2894    CMPL  ssHANDSHAKE
         BNE   L2894
         REP   #$20
         PHB
         LDA   $0C
         LDX   $0A
         SEP   #$20
         PHA
         PLB
         REP   #$20
         PHD
         LDA   #$C000
         TCD
         LDA   |$0000,X
         STA   $B1
         LDA   |$0002,X
         STA   $B1
         LDA   |$0004,X
         STA   $B1
         LDA   |$0006,X
         STA   $B1
         LDA   |$0008,X
         STA   $B1
         LDA   |$000A,X
         STA   $B1
         LDA   |$000C,X
         STA   $B1
         LDA   |$000E,X
         STA   $B1
         LDA   |$0010,X
         STA   $B1
         LDA   |$0012,X
         STA   $B1
         LDA   |$0014,X
         STA   $B1
         LDA   |$0016,X
         STA   $B1
         LDA   |$0018,X
         STA   $B1
         LDA   |$001A,X
         STA   $B1
         LDA   |$001C,X
         STA   $B1
         LDA   |$001E,X
         STA   $B1
         LDA   |$0020,X
         STA   $B1
         PLD
         PLB
         SEP   #$20
         LDA   #$00
L2907    CMPL  ssHANDSHAKE
         BNE   L2907
         PLP
         MX    %00
         LDA   $08
         STA   $16
         LDA   $07
         STA   $15
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

*----------------------------------------

vgaMOUSE
         TSC		; Recopie de 14 pixels
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         STZ   $05
         PHP
         SEI
         LDA   #$0000
         SEP   #$20
         LDA   #$02
         STAL  ssCOMMAND
         LDA   #$01
L2937    CMPL  ssHANDSHAKE
         BNE   L2937
         LDA   $16
         STAL  ssWRITEDATA
         LDA   $12
         STAL  ssWRITEDATA
         LDA   $13
         STAL  ssWRITEDATA
         LDA   $14
         STAL  ssWRITEDATA
         LDA   $0E
         STAL  ssWRITEDATA
         LDA   $0F
         STAL  ssWRITEDATA
         LDA   $10
         STAL  ssWRITEDATA
         LDA   $0A
         STAL  ssWRITEDATA
         LDA   $0B
         STAL  ssWRITEDATA
         LDA   $0C
         STAL  ssWRITEDATA
         LDA   #$00
L297B    CMPL  ssHANDSHAKE
         BNE   L297B
         LDA   #$01
L2983    CMPL  ssHANDSHAKE
         BNE   L2983
         REP   #$20
         PHB
         LDA   $0C
         LDX   $0A
         SEP   #$20
         PHA
         PLB
         REP   #$20
         PHD
         LDA   #$C000
         TCD
         LDA   |$0000,X
         STA   $B1
         LDA   |$0002,X
         STA   $B1
         LDA   |$0004,X
         STA   $B1
         LDA   |$0006,X
         STA   $B1
         LDA   |$0008,X
         STA   $B1
         LDA   |$000A,X
         STA   $B1
         LDA   |$000C,X
         STA   $B1
         PLD
         PLB
         SEP   #$20
         LDA   #$00
L29C4    CMPL  ssHANDSHAKE
         BNE   L29C4
         MX    %00
         PLP
         LDA   $08
         STA   $16
         LDA   $07
         STA   $15
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

*----------------------------------------

vgaLINE
         TSC		; Recopie de 400 pixels
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         STZ   $05
         PHP
         SEI
         LDA   #$0000
         SEP   #$20
         LDA   #$02
         STAL  ssCOMMAND
         LDA   #$01
L29F4    CMPL  ssHANDSHAKE
         BNE   L29F4
         LDA   $16
         STAL  ssWRITEDATA
         LDA   $12
         STAL  ssWRITEDATA
         LDA   $13
         STAL  ssWRITEDATA
         LDA   $14
         STAL  ssWRITEDATA
         LDA   $0E
         STAL  ssWRITEDATA
         LDA   $0F
         STAL  ssWRITEDATA
         LDA   $10
         STAL  ssWRITEDATA
         LDA   $0A
         STAL  ssWRITEDATA
         LDA   $0B
         STAL  ssWRITEDATA
         LDA   $0C
         STAL  ssWRITEDATA
         LDA   #$00
L2A38    CMPL  ssHANDSHAKE
         BNE   L2A38
         LDA   #$01
L2A40    CMPL  ssHANDSHAKE
         BNE   L2A40
         REP   #$20
         PHB
         LDA   $0C
         LDX   $0A
         SEP   #$20
         PHA
         PLB
         REP   #$20
         PHD
         LDA   #$C000
         TCD
         LDA   |$0000,X
         STA   $B1
         LDA   |$0002,X
         STA   $B1
         LDA   |$0004,X
         STA   $B1
         LDA   |$0006,X
         STA   $B1
         LDA   |$0008,X
         STA   $B1
         LDA   |$000A,X
         STA   $B1
         LDA   |$000C,X
         STA   $B1
         LDA   |$000E,X
         STA   $B1
         LDA   |$0010,X
         STA   $B1
         LDA   |$0012,X
         STA   $B1
         LDA   |$0014,X
         STA   $B1
         LDA   |$0016,X
         STA   $B1
         LDA   |$0018,X
         STA   $B1
         LDA   |$001A,X
         STA   $B1
         LDA   |$001C,X
         STA   $B1
         LDA   |$001E,X
         STA   $B1
         LDA   |$0020,X
         STA   $B1
         LDA   |$0022,X
         STA   $B1
         LDA   |$0024,X
         STA   $B1
         LDA   |$0026,X
         STA   $B1
         LDA   |$0028,X
         STA   $B1
         LDA   |$002A,X
         STA   $B1
         LDA   |$002C,X
         STA   $B1
         LDA   |$002E,X
         STA   $B1
         LDA   |$0030,X
         STA   $B1
         LDA   |$0032,X
         STA   $B1
         LDA   |$0034,X
         STA   $B1
         LDA   |$0036,X
         STA   $B1
         LDA   |$0038,X
         STA   $B1
         LDA   |$003A,X
         STA   $B1
         LDA   |$003C,X
         STA   $B1
         LDA   |$003E,X
         STA   $B1
         LDA   |$0040,X
         STA   $B1
         LDA   |$0042,X
         STA   $B1
         LDA   |$0044,X
         STA   $B1
         LDA   |$0046,X
         STA   $B1
         LDA   |$0048,X
         STA   $B1
         LDA   |$004A,X
         STA   $B1
         LDA   |$004C,X
         STA   $B1
         LDA   |$004E,X
         STA   $B1
         LDA   |$0050,X
         STA   $B1
         LDA   |$0052,X
         STA   $B1
         LDA   |$0054,X
         STA   $B1
         LDA   |$0056,X
         STA   $B1
         LDA   |$0058,X
         STA   $B1
         LDA   |$005A,X
         STA   $B1
         LDA   |$005C,X
         STA   $B1
         LDA   |$005E,X
         STA   $B1
         LDA   |$0060,X
         STA   $B1
         LDA   |$0062,X
         STA   $B1
         LDA   |$0064,X
         STA   $B1
         LDA   |$0066,X
         STA   $B1
         LDA   |$0068,X
         STA   $B1
         LDA   |$006A,X
         STA   $B1
         LDA   |$006C,X
         STA   $B1
         LDA   |$006E,X
         STA   $B1
         LDA   |$0070,X
         STA   $B1
         LDA   |$0072,X
         STA   $B1
         LDA   |$0074,X
         STA   $B1
         LDA   |$0076,X
         STA   $B1
         LDA   |$0078,X
         STA   $B1
         LDA   |$007A,X
         STA   $B1
         LDA   |$007C,X
         STA   $B1
         LDA   |$007E,X
         STA   $B1
         LDA   |$0080,X
         STA   $B1
         LDA   |$0082,X
         STA   $B1
         LDA   |$0084,X
         STA   $B1
         LDA   |$0086,X
         STA   $B1
         LDA   |$0088,X
         STA   $B1
         LDA   |$008A,X
         STA   $B1
         LDA   |$008C,X
         STA   $B1
         LDA   |$008E,X
         STA   $B1
         LDA   |$0090,X
         STA   $B1
         LDA   |$0092,X
         STA   $B1
         LDA   |$0094,X
         STA   $B1
         LDA   |$0096,X
         STA   $B1
         LDA   |$0098,X
         STA   $B1
         LDA   |$009A,X
         STA   $B1
         LDA   |$009C,X
         STA   $B1
         LDA   |$009E,X
         STA   $B1
         LDA   |$00A0,X
         STA   $B1
         LDA   |$00A2,X
         STA   $B1
         LDA   |$00A4,X
         STA   $B1
         LDA   |$00A6,X
         STA   $B1
         LDA   |$00A8,X
         STA   $B1
         LDA   |$00AA,X
         STA   $B1
         LDA   |$00AC,X
         STA   $B1
         LDA   |$00AE,X
         STA   $B1
         LDA   |$00B0,X
         STA   $B1
         LDA   |$00B2,X
         STA   $B1
         LDA   |$00B4,X
         STA   $B1
         LDA   |$00B6,X
         STA   $B1
         LDA   |$00B8,X
         STA   $B1
         LDA   |$00BA,X
         STA   $B1
         LDA   |$00BC,X
         STA   $B1
         LDA   |$00BE,X
         STA   $B1
         LDA   |$00C0,X
         STA   $B1
         LDA   |$00C2,X
         STA   $B1
         LDA   |$00C4,X
         STA   $B1
         LDA   |$00C6,X
         STA   $B1
         LDA   |$00C8,X
         STA   $B1
         LDA   |$00CA,X
         STA   $B1
         LDA   |$00CC,X
         STA   $B1
         LDA   |$00CE,X
         STA   $B1
         LDA   |$00D0,X
         STA   $B1
         LDA   |$00D2,X
         STA   $B1
         LDA   |$00D4,X
         STA   $B1
         LDA   |$00D6,X
         STA   $B1
         LDA   |$00D8,X
         STA   $B1
         LDA   |$00DA,X
         STA   $B1
         LDA   |$00DC,X
         STA   $B1
         LDA   |$00DE,X
         STA   $B1
         LDA   |$00E0,X
         STA   $B1
         LDA   |$00E2,X
         STA   $B1
         LDA   |$00E4,X
         STA   $B1
         LDA   |$00E6,X
         STA   $B1
         LDA   |$00E8,X
         STA   $B1
         LDA   |$00EA,X
         STA   $B1
         LDA   |$00EC,X
         STA   $B1
         LDA   |$00EE,X
         STA   $B1
         LDA   |$00F0,X
         STA   $B1
         LDA   |$00F2,X
         STA   $B1
         LDA   |$00F4,X
         STA   $B1
         LDA   |$00F6,X
         STA   $B1
         LDA   |$00F8,X
         STA   $B1
         LDA   |$00FA,X
         STA   $B1
         LDA   |$00FC,X
         STA   $B1
         LDA   |$00FE,X
         STA   $B1
         LDA   $0100,X
         STA   $B1
         LDA   $0102,X
         STA   $B1
         LDA   $0104,X
         STA   $B1
         LDA   $0106,X
         STA   $B1
         LDA   $0108,X
         STA   $B1
         LDA   $010A,X
         STA   $B1
         LDA   $010C,X
         STA   $B1
         LDA   $010E,X
         STA   $B1
         LDA   $0110,X
         STA   $B1
         LDA   $0112,X
         STA   $B1
         LDA   $0114,X
         STA   $B1
         LDA   $0116,X
         STA   $B1
         LDA   $0118,X
         STA   $B1
         LDA   $011A,X
         STA   $B1
         LDA   $011C,X
         STA   $B1
         LDA   $011E,X
         STA   $B1
         LDA   $0120,X
         STA   $B1
         LDA   $0122,X
         STA   $B1
         LDA   $0124,X
         STA   $B1
         LDA   $0126,X
         STA   $B1
         LDA   $0128,X
         STA   $B1
         LDA   $012A,X
         STA   $B1
         LDA   $012C,X
         STA   $B1
         LDA   $012E,X
         STA   $B1
         LDA   $0130,X
         STA   $B1
         LDA   $0132,X
         STA   $B1
         LDA   $0134,X
         STA   $B1
         LDA   $0136,X
         STA   $B1
         LDA   $0138,X
         STA   $B1
         LDA   $013A,X
         STA   $B1
         LDA   $013C,X
         STA   $B1
         LDA   $013E,X
         STA   $B1
         LDA   $0140,X
         STA   $B1
         LDA   $0142,X
         STA   $B1
         LDA   $0144,X
         STA   $B1
         LDA   $0146,X
         STA   $B1
         LDA   $0148,X
         STA   $B1
         LDA   $014A,X
         STA   $B1
         LDA   $014C,X
         STA   $B1
         LDA   $014E,X
         STA   $B1
         LDA   $0150,X
         STA   $B1
         LDA   $0152,X
         STA   $B1
         LDA   $0154,X
         STA   $B1
         LDA   $0156,X
         STA   $B1
         LDA   $0158,X
         STA   $B1
         LDA   $015A,X
         STA   $B1
         LDA   $015C,X
         STA   $B1
         LDA   $015E,X
         STA   $B1
         LDA   $0160,X
         STA   $B1
         LDA   $0162,X
         STA   $B1
         LDA   $0164,X
         STA   $B1
         LDA   $0166,X
         STA   $B1
         LDA   $0168,X
         STA   $B1
         LDA   $016A,X
         STA   $B1
         LDA   $016C,X
         STA   $B1
         LDA   $016E,X
         STA   $B1
         LDA   $0170,X
         STA   $B1
         LDA   $0172,X
         STA   $B1
         LDA   $0174,X
         STA   $B1
         LDA   $0176,X
         STA   $B1
         LDA   $0178,X
         STA   $B1
         LDA   $017A,X
         STA   $B1
         LDA   $017C,X
         STA   $B1
         LDA   $017E,X
         STA   $B1
         LDA   $0180,X
         STA   $B1
         LDA   $0182,X
         STA   $B1
         LDA   $0184,X
         STA   $B1
         LDA   $0186,X
         STA   $B1
         LDA   $0188,X
         STA   $B1
         LDA   $018A,X
         STA   $B1
         LDA   $018C,X
         STA   $B1
         LDA   $018E,X
         STA   $B1
         PLD
         PLB
         SEP   #$20
         LDA   #$00
L2E46    CMPL  ssHANDSHAKE
         BNE   L2E46
         MX    %00
         PLP
         LDA   $08
         STA   $16
         LDA   $07
         STA   $15
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

*----------------------------------------

vgaPANEL
         TSC			; Recopiede 80 pixels
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         STZ   $05
         PHP
         SEI
         LDA   #$0000
         SEP   #$20
         LDA   #$02
         STAL  ssCOMMAND
         LDA   #$01
L2E76    CMPL  ssHANDSHAKE
         BNE   L2E76
         LDA   $16
         STAL  ssWRITEDATA
         LDA   $12
         STAL  ssWRITEDATA
         LDA   $13
         STAL  ssWRITEDATA
         LDA   $14
         STAL  ssWRITEDATA
         LDA   $0E
         STAL  ssWRITEDATA
         LDA   $0F
         STAL  ssWRITEDATA
         LDA   $10
         STAL  ssWRITEDATA
         LDA   $0A
         STAL  ssWRITEDATA
         LDA   $0B
         STAL  ssWRITEDATA
         LDA   $0C
         STAL  ssWRITEDATA
         LDA   #$00
L2EBA    CMPL  ssHANDSHAKE
         BNE   L2EBA
         LDA   #$01
L2EC2    CMPL  ssHANDSHAKE
         BNE   L2EC2
         REP   #$20
         PHB
         LDA   $0C
         LDX   $0A
         SEP   #$20
         PHA
         PLB
         REP   #$20
         PHD
         LDA   #$C000
         TCD
         LDA   |$0000,X
         STA   $B1
         LDA   |$0002,X
         STA   $B1
         LDA   |$0004,X
         STA   $B1
         LDA   |$0006,X
         STA   $B1
         LDA   |$0008,X
         STA   $B1
         LDA   |$000A,X
         STA   $B1
         LDA   |$000C,X
         STA   $B1
         LDA   |$000E,X
         STA   $B1
         LDA   |$0010,X
         STA   $B1
         LDA   |$0012,X
         STA   $B1
         LDA   |$0014,X
         STA   $B1
         LDA   |$0016,X
         STA   $B1
         LDA   |$0018,X
         STA   $B1
         LDA   |$001A,X
         STA   $B1
         LDA   |$001C,X
         STA   $B1
         LDA   |$001E,X
         STA   $B1
         LDA   |$0020,X
         STA   $B1
         LDA   |$0022,X
         STA   $B1
         LDA   |$0024,X
         STA   $B1
         LDA   |$0026,X
         STA   $B1
         LDA   |$0028,X
         STA   $B1
         LDA   |$002A,X
         STA   $B1
         LDA   |$002C,X
         STA   $B1
         LDA   |$002E,X
         STA   $B1
         LDA   |$0030,X
         STA   $B1
         LDA   |$0032,X
         STA   $B1
         LDA   |$0034,X
         STA   $B1
         LDA   |$0036,X
         STA   $B1
         LDA   |$0038,X
         STA   $B1
         LDA   |$003A,X
         STA   $B1
         LDA   |$003C,X
         STA   $B1
         LDA   |$003E,X
         STA   $B1
         LDA   |$0040,X
         STA   $B1
         LDA   |$0042,X
         STA   $B1
         LDA   |$0044,X
         STA   $B1
         LDA   |$0046,X
         STA   $B1
         LDA   |$0048,X
         STA   $B1
         LDA   |$004A,X
         STA   $B1
         LDA   |$004C,X
         STA   $B1
         LDA   |$004E,X
         STA   $B1
         PLD
         PLB
         SEP   #$20
         LDA   #$00
L2FA8    CMPL  ssHANDSHAKE
         BNE   L2FA8
         MX    %00
         PLP
         LDA   $08
         STA   $16
         LDA   $07
         STA   $15
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

*----------------------------------------

vgaSCREEN
         TSC			; Recopie une ligne de 640 pixels
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         STZ   $05
         PHP
         SEI
         LDA   #$0000
         SEP   #$20
         LDA   #$02
         STAL  ssCOMMAND
         LDA   #$01
L2FD8    CMPL  ssHANDSHAKE
         BNE   L2FD8
         LDA   $16
         STAL  ssWRITEDATA
         LDA   $12
         STAL  ssWRITEDATA
         LDA   $13
         STAL  ssWRITEDATA
         LDA   $14
         STAL  ssWRITEDATA
         LDA   $0E
         STAL  ssWRITEDATA
         LDA   $0F
         STAL  ssWRITEDATA
         LDA   $10
         STAL  ssWRITEDATA
         LDA   $0A
         STAL  ssWRITEDATA
         LDA   $0B
         STAL  ssWRITEDATA
         LDA   $0C
         STAL  ssWRITEDATA
         LDA   #$00
L301C    CMPL  ssHANDSHAKE
         BNE   L301C
         LDA   #$01
L3024    CMPL  ssHANDSHAKE
         BNE   L3024
         REP   #$20
         PHB
         LDA   $0C
         LDX   $0A
         SEP   #$20
         PHA
         PLB
         REP   #$20
         PHD
         LDA   #$C000
         TCD
         LDA   |$0000,X
         STA   $B1
         LDA   |$0002,X
         STA   $B1
         LDA   |$0004,X
         STA   $B1
         LDA   |$0006,X
         STA   $B1
         LDA   |$0008,X
         STA   $B1
         LDA   |$000A,X
         STA   $B1
         LDA   |$000C,X
         STA   $B1
         LDA   |$000E,X
         STA   $B1
         LDA   |$0010,X
         STA   $B1
         LDA   |$0012,X
         STA   $B1
         LDA   |$0014,X
         STA   $B1
         LDA   |$0016,X
         STA   $B1
         LDA   |$0018,X
         STA   $B1
         LDA   |$001A,X
         STA   $B1
         LDA   |$001C,X
         STA   $B1
         LDA   |$001E,X
         STA   $B1
         LDA   |$0020,X
         STA   $B1
         LDA   |$0022,X
         STA   $B1
         LDA   |$0024,X
         STA   $B1
         LDA   |$0026,X
         STA   $B1
         LDA   |$0028,X
         STA   $B1
         LDA   |$002A,X
         STA   $B1
         LDA   |$002C,X
         STA   $B1
         LDA   |$002E,X
         STA   $B1
         LDA   |$0030,X
         STA   $B1
         LDA   |$0032,X
         STA   $B1
         LDA   |$0034,X
         STA   $B1
         LDA   |$0036,X
         STA   $B1
         LDA   |$0038,X
         STA   $B1
         LDA   |$003A,X
         STA   $B1
         LDA   |$003C,X
         STA   $B1
         LDA   |$003E,X
         STA   $B1
         LDA   |$0040,X
         STA   $B1
         LDA   |$0042,X
         STA   $B1
         LDA   |$0044,X
         STA   $B1
         LDA   |$0046,X
         STA   $B1
         LDA   |$0048,X
         STA   $B1
         LDA   |$004A,X
         STA   $B1
         LDA   |$004C,X
         STA   $B1
         LDA   |$004E,X
         STA   $B1
         LDA   |$0050,X
         STA   $B1
         LDA   |$0052,X
         STA   $B1
         LDA   |$0054,X
         STA   $B1
         LDA   |$0056,X
         STA   $B1
         LDA   |$0058,X
         STA   $B1
         LDA   |$005A,X
         STA   $B1
         LDA   |$005C,X
         STA   $B1
         LDA   |$005E,X
         STA   $B1
         LDA   |$0060,X
         STA   $B1
         LDA   |$0062,X
         STA   $B1
         LDA   |$0064,X
         STA   $B1
         LDA   |$0066,X
         STA   $B1
         LDA   |$0068,X
         STA   $B1
         LDA   |$006A,X
         STA   $B1
         LDA   |$006C,X
         STA   $B1
         LDA   |$006E,X
         STA   $B1
         LDA   |$0070,X
         STA   $B1
         LDA   |$0072,X
         STA   $B1
         LDA   |$0074,X
         STA   $B1
         LDA   |$0076,X
         STA   $B1
         LDA   |$0078,X
         STA   $B1
         LDA   |$007A,X
         STA   $B1
         LDA   |$007C,X
         STA   $B1
         LDA   |$007E,X
         STA   $B1
         LDA   |$0080,X
         STA   $B1
         LDA   |$0082,X
         STA   $B1
         LDA   |$0084,X
         STA   $B1
         LDA   |$0086,X
         STA   $B1
         LDA   |$0088,X
         STA   $B1
         LDA   |$008A,X
         STA   $B1
         LDA   |$008C,X
         STA   $B1
         LDA   |$008E,X
         STA   $B1
         LDA   |$0090,X
         STA   $B1
         LDA   |$0092,X
         STA   $B1
         LDA   |$0094,X
         STA   $B1
         LDA   |$0096,X
         STA   $B1
         LDA   |$0098,X
         STA   $B1
         LDA   |$009A,X
         STA   $B1
         LDA   |$009C,X
         STA   $B1
         LDA   |$009E,X
         STA   $B1
         LDA   |$00A0,X
         STA   $B1
         LDA   |$00A2,X
         STA   $B1
         LDA   |$00A4,X
         STA   $B1
         LDA   |$00A6,X
         STA   $B1
         LDA   |$00A8,X
         STA   $B1
         LDA   |$00AA,X
         STA   $B1
         LDA   |$00AC,X
         STA   $B1
         LDA   |$00AE,X
         STA   $B1
         LDA   |$00B0,X
         STA   $B1
         LDA   |$00B2,X
         STA   $B1
         LDA   |$00B4,X
         STA   $B1
         LDA   |$00B6,X
         STA   $B1
         LDA   |$00B8,X
         STA   $B1
         LDA   |$00BA,X
         STA   $B1
         LDA   |$00BC,X
         STA   $B1
         LDA   |$00BE,X
         STA   $B1
         LDA   |$00C0,X
         STA   $B1
         LDA   |$00C2,X
         STA   $B1
         LDA   |$00C4,X
         STA   $B1
         LDA   |$00C6,X
         STA   $B1
         LDA   |$00C8,X
         STA   $B1
         LDA   |$00CA,X
         STA   $B1
         LDA   |$00CC,X
         STA   $B1
         LDA   |$00CE,X
         STA   $B1
         LDA   |$00D0,X
         STA   $B1
         LDA   |$00D2,X
         STA   $B1
         LDA   |$00D4,X
         STA   $B1
         LDA   |$00D6,X
         STA   $B1
         LDA   |$00D8,X
         STA   $B1
         LDA   |$00DA,X
         STA   $B1
         LDA   |$00DC,X
         STA   $B1
         LDA   |$00DE,X
         STA   $B1
         LDA   |$00E0,X
         STA   $B1
         LDA   |$00E2,X
         STA   $B1
         LDA   |$00E4,X
         STA   $B1
         LDA   |$00E6,X
         STA   $B1
         LDA   |$00E8,X
         STA   $B1
         LDA   |$00EA,X
         STA   $B1
         LDA   |$00EC,X
         STA   $B1
         LDA   |$00EE,X
         STA   $B1
         LDA   |$00F0,X
         STA   $B1
         LDA   |$00F2,X
         STA   $B1
         LDA   |$00F4,X
         STA   $B1
         LDA   |$00F6,X
         STA   $B1
         LDA   |$00F8,X
         STA   $B1
         LDA   |$00FA,X
         STA   $B1
         LDA   |$00FC,X
         STA   $B1
         LDA   |$00FE,X
         STA   $B1
         LDA   $0100,X
         STA   $B1
         LDA   $0102,X
         STA   $B1
         LDA   $0104,X
         STA   $B1
         LDA   $0106,X
         STA   $B1
         LDA   $0108,X
         STA   $B1
         LDA   $010A,X
         STA   $B1
         LDA   $010C,X
         STA   $B1
         LDA   $010E,X
         STA   $B1
         LDA   $0110,X
         STA   $B1
         LDA   $0112,X
         STA   $B1
         LDA   $0114,X
         STA   $B1
         LDA   $0116,X
         STA   $B1
         LDA   $0118,X
         STA   $B1
         LDA   $011A,X
         STA   $B1
         LDA   $011C,X
         STA   $B1
         LDA   $011E,X
         STA   $B1
         LDA   $0120,X
         STA   $B1
         LDA   $0122,X
         STA   $B1
         LDA   $0124,X
         STA   $B1
         LDA   $0126,X
         STA   $B1
         LDA   $0128,X
         STA   $B1
         LDA   $012A,X
         STA   $B1
         LDA   $012C,X
         STA   $B1
         LDA   $012E,X
         STA   $B1
         LDA   $0130,X
         STA   $B1
         LDA   $0132,X
         STA   $B1
         LDA   $0134,X
         STA   $B1
         LDA   $0136,X
         STA   $B1
         LDA   $0138,X
         STA   $B1
         LDA   $013A,X
         STA   $B1
         LDA   $013C,X
         STA   $B1
         LDA   $013E,X
         STA   $B1
         LDA   $0140,X
         STA   $B1
         LDA   $0142,X
         STA   $B1
         LDA   $0144,X
         STA   $B1
         LDA   $0146,X
         STA   $B1
         LDA   $0148,X
         STA   $B1
         LDA   $014A,X
         STA   $B1
         LDA   $014C,X
         STA   $B1
         LDA   $014E,X
         STA   $B1
         LDA   $0150,X
         STA   $B1
         LDA   $0152,X
         STA   $B1
         LDA   $0154,X
         STA   $B1
         LDA   $0156,X
         STA   $B1
         LDA   $0158,X
         STA   $B1
         LDA   $015A,X
         STA   $B1
         LDA   $015C,X
         STA   $B1
         LDA   $015E,X
         STA   $B1
         LDA   $0160,X
         STA   $B1
         LDA   $0162,X
         STA   $B1
         LDA   $0164,X
         STA   $B1
         LDA   $0166,X
         STA   $B1
         LDA   $0168,X
         STA   $B1
         LDA   $016A,X
         STA   $B1
         LDA   $016C,X
         STA   $B1
         LDA   $016E,X
         STA   $B1
         LDA   $0170,X
         STA   $B1
         LDA   $0172,X
         STA   $B1
         LDA   $0174,X
         STA   $B1
         LDA   $0176,X
         STA   $B1
         LDA   $0178,X
         STA   $B1
         LDA   $017A,X
         STA   $B1
         LDA   $017C,X
         STA   $B1
         LDA   $017E,X
         STA   $B1
         LDA   $0180,X
         STA   $B1
         LDA   $0182,X
         STA   $B1
         LDA   $0184,X
         STA   $B1
         LDA   $0186,X
         STA   $B1
         LDA   $0188,X
         STA   $B1
         LDA   $018A,X
         STA   $B1
         LDA   $018C,X
         STA   $B1
         LDA   $018E,X
         STA   $B1
         LDA   $0190,X
         STA   $B1
         LDA   $0192,X
         STA   $B1
         LDA   $0194,X
         STA   $B1
         LDA   $0196,X
         STA   $B1
         LDA   $0198,X
         STA   $B1
         LDA   $019A,X
         STA   $B1
         LDA   $019C,X
         STA   $B1
         LDA   $019E,X
         STA   $B1
         LDA   $01A0,X
         STA   $B1
         LDA   $01A2,X
         STA   $B1
         LDA   $01A4,X
         STA   $B1
         LDA   $01A6,X
         STA   $B1
         LDA   $01A8,X
         STA   $B1
         LDA   $01AA,X
         STA   $B1
         LDA   $01AC,X
         STA   $B1
         LDA   $01AE,X
         STA   $B1
         LDA   $01B0,X
         STA   $B1
         LDA   $01B2,X
         STA   $B1
         LDA   $01B4,X
         STA   $B1
         LDA   $01B6,X
         STA   $B1
         LDA   $01B8,X
         STA   $B1
         LDA   $01BA,X
         STA   $B1
         LDA   $01BC,X
         STA   $B1
         LDA   $01BE,X
         STA   $B1
         LDA   $01C0,X
         STA   $B1
         LDA   $01C2,X
         STA   $B1
         LDA   $01C4,X
         STA   $B1
         LDA   $01C6,X
         STA   $B1
         LDA   $01C8,X
         STA   $B1
         LDA   $01CA,X
         STA   $B1
         LDA   $01CC,X
         STA   $B1
         LDA   $01CE,X
         STA   $B1
         LDA   $01D0,X
         STA   $B1
         LDA   $01D2,X
         STA   $B1
         LDA   $01D4,X
         STA   $B1
         LDA   $01D6,X
         STA   $B1
         LDA   $01D8,X
         STA   $B1
         LDA   $01DA,X
         STA   $B1
         LDA   $01DC,X
         STA   $B1
         LDA   $01DE,X
         STA   $B1
         LDA   $01E0,X
         STA   $B1
         LDA   $01E2,X
         STA   $B1
         LDA   $01E4,X
         STA   $B1
         LDA   $01E6,X
         STA   $B1
         LDA   $01E8,X
         STA   $B1
         LDA   $01EA,X
         STA   $B1
         LDA   $01EC,X
         STA   $B1
         LDA   $01EE,X
         STA   $B1
         LDA   $01F0,X
         STA   $B1
         LDA   $01F2,X
         STA   $B1
         LDA   $01F4,X
         STA   $B1
         LDA   $01F6,X
         STA   $B1
         LDA   $01F8,X
         STA   $B1
         LDA   $01FA,X
         STA   $B1
         LDA   $01FC,X
         STA   $B1
         LDA   $01FE,X
         STA   $B1
         LDA   $0200,X
         STA   $B1
         LDA   $0202,X
         STA   $B1
         LDA   $0204,X
         STA   $B1
         LDA   $0206,X
         STA   $B1
         LDA   $0208,X
         STA   $B1
         LDA   $020A,X
         STA   $B1
         LDA   $020C,X
         STA   $B1
         LDA   $020E,X
         STA   $B1
         LDA   $0210,X
         STA   $B1
         LDA   $0212,X
         STA   $B1
         LDA   $0214,X
         STA   $B1
         LDA   $0216,X
         STA   $B1
         LDA   $0218,X
         STA   $B1
         LDA   $021A,X
         STA   $B1
         LDA   $021C,X
         STA   $B1
         LDA   $021E,X
         STA   $B1
         LDA   $0220,X
         STA   $B1
         LDA   $0222,X
         STA   $B1
         LDA   $0224,X
         STA   $B1
         LDA   $0226,X
         STA   $B1
         LDA   $0228,X
         STA   $B1
         LDA   $022A,X
         STA   $B1
         LDA   $022C,X
         STA   $B1
         LDA   $022E,X
         STA   $B1
         LDA   $0230,X
         STA   $B1
         LDA   $0232,X
         STA   $B1
         LDA   $0234,X
         STA   $B1
         LDA   $0236,X
         STA   $B1
         LDA   $0238,X
         STA   $B1
         LDA   $023A,X
         STA   $B1
         LDA   $023C,X
         STA   $B1
         LDA   $023E,X
         STA   $B1
         LDA   $0240,X
         STA   $B1
         LDA   $0242,X
         STA   $B1
         LDA   $0244,X
         STA   $B1
         LDA   $0246,X
         STA   $B1
         LDA   $0248,X
         STA   $B1
         LDA   $024A,X
         STA   $B1
         LDA   $024C,X
         STA   $B1
         LDA   $024E,X
         STA   $B1
         LDA   $0250,X
         STA   $B1
         LDA   $0252,X
         STA   $B1
         LDA   $0254,X
         STA   $B1
         LDA   $0256,X
         STA   $B1
         LDA   $0258,X
         STA   $B1
         LDA   $025A,X
         STA   $B1
         LDA   $025C,X
         STA   $B1
         LDA   $025E,X
         STA   $B1
         LDA   $0260,X
         STA   $B1
         LDA   $0262,X
         STA   $B1
         LDA   $0264,X
         STA   $B1
         LDA   $0266,X
         STA   $B1
         LDA   $0268,X
         STA   $B1
         LDA   $026A,X
         STA   $B1
         LDA   $026C,X
         STA   $B1
         LDA   $026E,X
         STA   $B1
         LDA   $0270,X
         STA   $B1
         LDA   $0272,X
         STA   $B1
         LDA   $0274,X
         STA   $B1
         LDA   $0276,X
         STA   $B1
         LDA   $0278,X
         STA   $B1
         LDA   $027A,X
         STA   $B1
         LDA   $027C,X
         STA   $B1
         LDA   $027E,X
         STA   $B1
         PLD
         PLB
         SEP   #$20
         LDA   #$00
L3682    CMPL  ssHANDSHAKE
         BNE   L3682
         MX    %00
         PLP
         LDA   $08
         STA   $16
         LDA   $07
         STA   $15
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

*----------------------------------------

_xGetStatus tsc
         sec
         sbc   #$0006
         tcs
         phd
         tcd
         php
         sei
         lda   $0A
         sta   $03
         lda   $0C
         sta   $05
         lda   #0
         sta   $01
         sep   #$20
         stal  ssCOMMAND
         ldx   #-1
]lp      ldal  ssHANDSHAKE
         cmp   #$01
         beq   _xGetStatus1
         dex
         bne   ]lp
         rep   #$20
         lda   #-1
         sta   $01
         bra   _xGetStatus8

         mx    %10

_xGetStatus1 ldx #5
         ldal  ssREADDATA
]lp      ldal  ssREADDATA
         sta   [$0A]
         inc   $0A
         bne   _xGetStatus2
         inc   $0B
_xGetStatus2 dex
         bne   ]lp
         lda   [$03]
         cmp   #'G'
         bne   _xGetStatus3
         ldy   #$0001
         lda   [$03],Y
         cmp   #'S'
         bne   _xGetStatus3
         iny
         lda   [$03],Y
         cmp   #'V'
         bne   _xGetStatus3
         iny
         lda   [$03],Y
         cmp   #'G'
         bne   _xGetStatus3
         iny
         lda   [$03],Y
         cmp   #'A'
         beq   _xGetStatus4
_xGetStatus3 lda #$FF
         sta   $01
         sta   $02
         bra   _xGetStatus7
_xGetStatus4 lda #$00
         xba
         ldal  ssREADDATA
         tax
         sta   [$0A]
         inc   $0A
         bne   _xGetStatus5
         inc   $0B
_xGetStatus5 ldal ssREADDATA
         sta   [$0A]
         inc   $0A
         bne   _xGetStatus6
         inc   $0B
_xGetStatus6 dex
         bne   _xGetStatus5
_xGetStatus7 rep #$20
_xGetStatus8 plp
         ldy   $01
         lda   $08
         sta   $0C
         lda   $07
         sta   $0B
         pld
         tsc
         clc
         adc   #$000A
         tcs
         tya
         rtl

*----------------------------------------

_xSetMode tsc
         phd
         tcd
         php
         sei
         lda   #1
         jsr   _WriteCmd
         jsr   WaitHSOn
         lda   $06        ; $04
         jsr   _WriteData
         lda   $04        ; $06
         jsr   _WriteData
         jsr   WaitHSOff
         jsr   WaitHSDone
         plp
         lda   $02
         sta   $06
         lda   $01
         sta   $05
         pld
         tsc
         clc
         adc   #$0004
         tcs
         rtl

*----------------------------------------

_xSetPalette tsc
         phd
         tcd
         php
         sei
         lda   #6
         jsr   _WriteCmd
         jsr   WaitHSOn
         lda   $04
         jsr   _WriteCmd
         lda   $05
         jsr   _WriteCmd
         lda   $06
         jsr   _WriteCmd
         jsr   WaitHSOff
         jsr   WaitHSOn
         ldy   #0
]lp      lda   [$04],y
         jsr   _WriteData
         iny
         cpy   #768
         bne   ]lp
         jsr   WaitHSOff
         plp
         lda   $02
         sta   $06
         lda   $01
         sta   $05
         pld
         tsc
         clc
         adc   #$0004
         tcs
         rtl

*----------------------------------------

_xClearScreen tsc
         phd
         tcd
         php
         sei
         lda   #10
         jsr   _WriteCmd
         jsr   WaitHSOn
         lda   $0C        ; $04
         jsr   _WriteData
         lda   $08        ; $06
         jsr   _WriteData
         lda   $09        ; $07
         jsr   _WriteData
         lda   $0A        ; $08
         jsr   _WriteData
         lda   $04        ; $0A
         jsr   _WriteData
         lda   $05        ; $0B
         jsr   _WriteData
         lda   $06        ; $0C
         jsr   _WriteData
         jsr   WaitHSOff
         jsr   WaitHSDone
         plp
         lda   $02
         sta   $0C
         lda   $01
         sta   $0B
         pld
         tsc
         clc
         adc   #$000A
         tcs
         rtl

*----------------------------------------

_xSetVGAReg tsc
         phd
         tcd
         php
         sei
         lda   #12
         jsr   _WriteCmd
         jsr   WaitHSOn
         lda   $0A        ; $04
         jsr   _WriteCmd
         lda   $0B        ; $05
         jsr   _WriteCmd
         lda   $08        ; $06
         jsr   _WriteCmd
         lda   $06        ; $08
         jsr   _WriteCmd
         lda   $07        ; $09
         jsr   _WriteCmd
         lda   $04        ; $0A
         jsr   _WriteCmd
         jsr   WaitHSOff
         plp
         lda   $02
         sta   $0A
         lda   $01
         sta   $09
         pld
         tsc
         clc
         adc   #$0008
         tcs
         rtl

*----------------------------------------

_WriteCmd sep  #$20
         stal  ssCOMMAND
         rep   #$20
         rts

*----------------------------------------

_WriteData sep #$20
         stal  ssWRITEDATA
         rep   #$20
         rts

*----------------------------------------

WaitHSOn lda   #1
         sep   #$20
]lp      cmpl  ssHANDSHAKE
         bne   ]lp
         rep   #$20
         rts

*----------------------------------------

WaitHSOff lda  #0
         sep   #$20
]lp      cmpl  ssHANDSHAKE
         bne   ]lp
         rep   #$20
         rts

*----------------------------------------

WaitHSDone sep #$20
]lp      ldal  ssHANDSHAKE
         cmp   #$A5
         beq   WaitHSDone1
         cmp   #$A6
         bne   ]lp
WaitHSDone1 rep #$20
         rts

*----------------------------------------

*
* Cogito: The Return
*
* (c) 1997, Jérôme Crétaux
* (c) 1997, Atreid Concept
* (c) 1997, Brutal Deluxe Software
*

bufferSS DS    28
fgSS     DS    2
thePALETTE DS  768

firstY1  DS    2
lastY1   DS    2
firstY2  DS    2	; first Y of VGA buffer to refresh
lastY2   DS    2	; last Y of VGA buffer to refresh
firstY3  DS    2
lastY3   DS    2
firstY4  DS    2
lastY4   DS    2
firstLINE DS   2
lastLINE DS    2

         ASC   8D8D8D8D

myID     DS    2
temp     DS    4
SStopREC DS    4
ptrMEM   DS    4
haMEM    DS    4

ptrBANK1 DS    4
ptrBANK2 DS    4
ptrBANK3 DS    4
ptrBANK4 DS    4
ptrPANEL1 DS   4
ptrPANEL2 DS   4
ptrPANEL3 DS   4
ptrPANEL4 DS   4

ptrIMAGE1 DS   4
ptrIMAGE2 DS   4
ptrIMAGE3 DS   4
ptrIMAGE4 DS   4

*--------------------------
* All the datas
*--------------------------

*--- Parametres du jeu

Probleme ds    162
Plateau  ds    162

Niveau   DS    2
NbCoups  DS    4
NbCompute DS   2
Temps    DS    6

CurDecor DS    2

*--- Tables des adresses des datas

AdrCalcDec DA  Decor1,Decor2,Decor3,Decor4,Decor5
         DA    Decor6,Decor7,Decor8,Decor9,Decor10

         DW    $0002	; utilité ?
         DW    $0004
         DW    $0001
         DW    $0003
         DW    $0000

*--- Coordonnees du panneau

PanelX1  ADRL  $01DF	; coordonnees X1
         ADRL  $01EB
         ADRL  $01C7
         ADRL  $01E4
PanelY1  ADRL  $00C4	; coordonnees Y1
         ADRL  $00D0
         ADRL  $00CF
         ADRL  $00D5
PanelX2  ADRL  $022E	; coordonnees X2
         ADRL  $023A
         ADRL  $0216
         ADRL  $0233
PanelY2  ADRL  $00F5	; coordonnees Y2
         ADRL  $0101
         ADRL  $0100
         ADRL  $0106

*--- Coordonnees des chaînes du panneau

zeTEMPS3 DW    $0217
         DW    $0223
         DW    $01FF
         DW    $021C
zeTEMPS2 DW    $01FF
         DW    $020B
         DW    $01E7
         DW    $0204
zeTEMPS1 DW    $01E7
         DW    $01F3
         DW    $01CF
         DW    $01EC
zeTEMPSY DW    $00C7
         DW    $00D3
         DW    $00D2
         DW    $00D8

zeCOMPCPX
         DW    $020D
         DW    $0219
         DW    $01F5
         DW    $0212
zeMOICPX DW    $01F2
         DW    $01FE
         DW    $01DA
         DW    $01F7
zeMOICPY DW    $00E6
         DW    $00F2
         DW    $00F1
         DW    $00F7
zeNIVEAU DW    $01E5
         DW    $01F1
         DW    $01CD
         DW    $01EA
zeCOMPCPY
         DW    $00D7
         DW    $00E3
         DW    $00E2
         DW    $00E8

PanelX   DS    2
PanelY   DS    2
FlecheX  DS    2
FlecheY  DS    2

*--- Couleurs

colorA   DS    2
colorB   DS    2
colorC   DS    2

*--- Pour les textes

LgStrPtr    ASC   '12345'00
StrPtr    ASC   '123'00
StrTime    ASC   '12'00
         DW    $0000	; en cas de débordement de mémoire

*--- Pour deplacements

scrX1    DS    2
scrX2    DS    2
MyArrow  DS    2
MyColumn DS    2
MyDepart DS    2
MyDepart2 DS   2
MyArrivee DS   2
MyArrivee2 DS  2

WhichDep DS    2
WhichDecor DS  2
NbMelange DS   2
Melange  DS    2

noINTER  DS    2
fgTIME   DS    2

ldFlag   DS    2
Diabolic DS    2
fgINTER2 DS    2	; utilité ?

*--- Messages

errSTR1  STR   'Error with tools'
errSTR2  STR   'SecondSight not detected !'
memSTR1  STR   'Can'27't allocate memory'
memSTR2  STR   'Can'27't load resources'
memSTR3  STR   'Press a key to quit.'
memSTR4  STR   ''

*--- Prodos

proOpen  DW    $000C      ; Parms for Open
         DW    $0000      ;  ref num
         ADRL  pTEMP      ;  path name
         DW    $0000      ;  req access
         DW    $0000      ;  res num
         DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
         ADRL  $00000000  ;  end of file

proRead  DW    $0005      ; Parms for Read
         DW    $0000      ;  ref num
         ADRL  Probleme      ;  buffer ptr
         ADRL  $00000154  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0000      ;  cache priority

proClose DW    $0001      ; Parms for Close
         DW    $0000      ;  ref num

proQuit  DW    $0002      ; Parms for Quit
         ADRL  $00000000  ;  path name
         DW    $0000      ;  flags

proCreate DW    $0007      ; Parms for Create
         ADRL  pTEMP      ;  file name
         DW    $00E3      ;  access
         DW    $005A      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0002      ;  storage
         ADRL  $00000154  ;  end of file
         ADRL  $00000000  ;  resource eof

proKill  DW    $0001      ; Parms for Destroy
         ADRL  pTEMP      ;  file name

proInfo  DW    $0004      ; Parms for SetFileInfo
         ADRL  pTEMP      ;  file name
         DW    $00E3      ;  access
         DW    $005A      ;  file type
         ADRL  $00000000  ;  aux type

proWrite DW    $0005      ; Parms for Write
         DW    $0000      ;  ref num
         ADRL  Probleme      ;  buffer ptr
         ADRL  $00000154  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0000      ;  cache priority

*--- Nom des fichiers

pTEMP    STRL  '1/Temp'

VBLCounter0 DS 2

*--- Fleches

Fleches  DS    72

Fleches2 DS    72

*--- Tableau

TblPlateau dw  0,2,4,6,8,10,12,14,16
         dw    16,34,52,70,88,106,124,142,160
         dw    144,146,148,150,152,154,156,158,160

TblPlateau2 dw 0,18,36,54,72,90,108,126,144

*--- Tables pour le choix des deplacements

TblDeplacement da 35,35,80,60,80,60,60,60,35,500,35,30

TblMel38 da    9,10,11,12,13,14,15,16,17
         da    0,1,2,3,4,5,6,7,8
         da    27,28,29,30,31,32,33,34,35
         da    18,19,20,21,22,23,24,25,26

TblMel5  da    18,19,20,21,22,23,24,25,26
         da    27,28,29,30,31,32,33,34,35
         da    0,1,2,3,4,5,6,7,8
         da    9,10,11,12,13,14,15,16,17

TblMel67 da    26,25,24,23,22,21,20,19,18
         da    35,34,33,32,31,30,29,28,27
         da    8,7,6,5,4,3,2,1,0
         da    17,16,15,14,13,12,11,10,9

TblMel9  da    8,7,6,5,4,3,2,1,0
         da    17,16,15,14,13,12,11,10,9
         da    26,25,24,23,22,21,20,19,18
         da    35,34,33,32,31,30,29,28,27

TblMel11 da    1,2,3,4,5,6,7,8,0
         da    10,11,12,13,14,15,16,17,9
         da    19,20,21,22,23,24,25,26,18
         da    28,29,30,31,32,33,34,35,27

TblMel12 da    7,8,0,1,2,3,4,5,6
         da    16,17,9,10,11,12,13,14,15
         da    25,26,18,19,20,21,22,23,24
         da    34,35,27,28,29,30,31,32,33

*--- Correspondance niveau/deplacement

ChoixDeplace da 1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12

ChoixDecor da  1,1,1,1,1,1,1,1,1,1,1,1
         da    2,2,2,2,2,2,2,2,2,2,2,2
         da    3,3,3,3,3,3,3,3,3,3,3,3
         da    4,4,4,4,4,4,4,4,4,4,4,4
         da    5,5,5,5,5,5,5,5,5,5,5,5
         da    6,6,6,6,6,6,6,6,6,6,6,6
         da    7,7,7,7,7,7,7,7,7,7,7,7
         da    8,8,8,8,8,8,8,8,8,8,8,8
         da    9,9,9,9,9,9,9,9,9,9,9,9
         da    10,10,10,10,10,10,10,10,10,10,10,10

*---

AdrDecor5 da   1,1,1,1,1,1,1,1,1
         da    1,2,2,2,6,3,3,3,1
         da    1,2,2,2,6,3,3,3,1
         da    1,2,2,2,6,3,3,3,1
         da    1,6,6,6,6,6,6,6,1
         da    1,4,4,4,6,5,5,5,1
         da    1,4,4,4,6,5,5,5,1
         da    1,4,4,4,6,5,5,5,1
         da    1,1,1,1,1,1,1,1,1

AdrDecor6 da   1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3

AdrDecor7 da   2,4,4,6,5,6,4,4,2
         da    4,2,4,6,5,6,4,2,4
         da    4,4,2,6,3,6,2,4,4
         da    6,6,6,2,1,2,6,6,6
         da    5,5,3,1,2,1,3,5,5
         da    6,6,6,2,1,2,6,6,6
         da    4,4,2,6,3,6,2,4,4
         da    4,2,4,6,5,6,4,2,4
         da    2,4,4,6,5,6,4,4,2

AdrDecor8 da   2,2,2,5,5,5,4,4,4
         da    2,2,2,5,5,5,4,4,4
         da    2,2,2,5,5,5,4,4,4
         da    3,3,3,6,6,6,3,3,3
         da    3,3,3,6,6,6,3,3,3
         da    3,3,3,6,6,6,3,3,3
         da    4,4,4,1,1,1,2,2,2
         da    4,4,4,1,1,1,2,2,2
         da    4,4,4,1,1,1,2,2,2

AdrDecor9 da   1,1,1,1,1,1,1,1,1
         da    3,1,1,1,1,1,1,1,4
         da    3,3,6,6,6,6,6,4,4
         da    3,3,6,1,1,1,6,4,4
         da    3,3,6,6,6,6,6,4,4
         da    3,3,6,2,2,2,6,4,4
         da    3,3,6,6,6,6,6,4,4
         da    3,2,2,2,2,2,2,2,4
         da    2,2,2,2,2,2,2,2,2

*--- Adresse des lignes dans les 4 bancs d'une image

lineBANK1    DS 400
lineBANK2    DS 400
lineBANK3    DS 400
lineBANK4    DS 400

Ligne    DS    1600	; Adresse des lignes 0-399

bufLIGNE DS    40	; Buffer d'une ligne qui bouge

*--- Coordonnees des cases des deux plateaux

scrBigX  DW    $0028	; Coordonnes X sur le grand plateau
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140
         DW    $0028
         DW    $004B
         DW    $006E
         DW    $0091
         DW    $00B4
         DW    $00D7
         DW    $00FA
         DW    $011D
         DW    $0140

scrBigY  DW    $001D	; Coordonnees Y sur le grand plateau
         DW    $001D
         DW    $001D
         DW    $001D
         DW    $001D
         DW    $001D
         DW    $001D
         DW    $001D
         DW    $001D
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0063
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $0086
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00A9
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00CC
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $00EF
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0112
         DW    $0135
         DW    $0135
         DW    $0135
         DW    $0135
         DW    $0135
         DW    $0135
         DW    $0135
         DW    $0135
         DW    $0135

scrSmallX DW   $01C9	; Coordonnees X pour le petit plateau
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239
         DW    $01C9
         DW    $01D7
         DW    $01E5
         DW    $01F3
         DW    $0201
         DW    $020F
         DW    $021D
         DW    $022B
         DW    $0239

scrSmallY DW   $010C	; Coordonnees Y pour le petit plateau
         DW    $010C
         DW    $010C
         DW    $010C
         DW    $010C
         DW    $010C
         DW    $010C
         DW    $010C
         DW    $010C
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $011A
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0128
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0136
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0144
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0152
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $0160
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $016E
         DW    $017C
         DW    $017C
         DW    $017C
         DW    $017C
         DW    $017C
         DW    $017C
         DW    $017C
         DW    $017C
         DW    $017C

*---

SprX     DS    2
SprY     DS    2

*--- Adresse des gros sprites (35x35)

SprBig    DA    L566B
         DA    L5B34
         DA    L5FFD
         DA    L64C6
         DA    L698F
         DA    L6E58

*--- Adresse des petits sprites (14x14)

SprSmall    DA    L7321
         DA    L73E5
         DA    L74A9
         DA    L756D
         DA    L7631
         DA    L76F5

*--- Les chiffres en rouge (8x12 pixels)

sprNumR  DA    L77B9
         DA    L7819
         DA    L7879
         DA    L78D9
         DA    L7939
         DA    L7999
         DA    L79F9
         DA    L7A59
         DA    L7AB9
         DA    L7B19

*--- Les chiffres en jaune

sprNumJ  DA    L7B79
         DA    L7BD9
         DA    L7C39
         DA    L7C99
         DA    L7CF9
         DA    L7D59
         DA    L7DB9
         DA    L7E19
         DA    L7E79
         DA    L7ED9

*---

         DA    sprPanel1
         DA    sprPanel2

*--- Les flèches haut et bas (30x23)

         DA    L9D77
         DA    LA029
         DA    LA2DB
         DA    LA58D
         DA    LA83F
         DA    LAAF1

*--- Les flèches gauche et droite (22x30)

         DA    LADA3
         DA    LB037
         DA    LB2CB
         DA    LB55F
         DA    LB7F3
         DA    LBA87

*--- Le début du gros fichier de données par niveau

L566B    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L5B34    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L5FFD    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L64C6    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L698F    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L6E58    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L7321    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L73E5    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L74A9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L756D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L7631    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L76F5    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

*--- Les chiffres

L77B9    DS    96	; en rouge avec le 0
L7819    DS    96
L7879    DS    96
L78D9    DS    96
L7939    DS    96
L7999    DS    96
L79F9    DS    96
L7A59    DS    96
L7AB9    DS    96
L7B19    DS    96	; ..9
L7B79    DS    96	; en jaune avec le 0
L7BD9    DS    96
L7C39    DS    96
L7C99    DS    96
L7CF9    DS    96
L7D59    DS    96
L7DB9    DS    96
L7E19    DS    96
L7E79    DS    96
L7ED9    DS    96	; ..9

*--- Les deux panneaux (79x49 pixels = $F1F)

sprPanel1
         DS    79*49
sprPanel2
         DS    79*49

*--- Les flèches haut et bas (30x23)

L9D77    DS    30*23	; fond neutre
LA029    DS    30*23	; fleche
LA2DB    DS    30*23	; fleche enfoncee
LA58D    DS    30*23
LA83F    DS    30*23
LAAF1    DS    30*23

*--- Les flèches gauche et droite (22x30)

LADA3    DS    22*30
LB037    DS    22*30
LB2CB    DS    22*30
LB55F    DS    22*30
LB7F3    DS    22*30
LBA87    DS    22*30

*---

refPALETTE    DS    768

*--- Enfin, j'y suis arrivé !

         ASC   8D8D
         ASC   '-------------- Cogito -------------'8D
         ASC   'Programme original: Jerome Cretaux '8D
         ASC   'Version Apple //gs: Antoine Vignau '8D
         ASC   '                    Olivier Zardini'8D
         ASC   '------------ 01 01 1998 -----------'8D8D
