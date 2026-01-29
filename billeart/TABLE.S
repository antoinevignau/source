*************************************************************************

CLRLI       LDA   POSXA       ; CLEAR LIGNE
            STA   X0
            LDA   POSYA
            STA   Y0

            LDA   BBX
            ASL
            STA   X1
            LDA   BBY
            STA   Y1

            LDA   #$EAEA      ; NOP NOP
            STA   PLOT6+4
            STA   PLOT5+4
            STA   PLOT6+5     ; ORA
            STA   PLOT5+5
            LDA   #$0120
            STA   PLOT6+2
            STA   PLOT5+2
            STA   PLOT6+9
            STA   PLOT5+9

            JSR   LIGNE2

            LDA   #$E120
            STA   PLOT6+2
            STA   PLOT5+2
            STA   PLOT6+9
            STA   PLOT5+9
            LDA   #$0009
            STA   PLOT6+4
            STA   PLOT5+4
CLRLI1      LDA   #$F000
            STA   PLOT6+5
CLRLI2      LDA   #$0F00
            STA   PLOT5+5

            RTS

***********  NO ADB  ****************************

* Routine utilisee dans Set(9) pour activer ou *
* pour desactiver l'ADB.                       *
* En entree : A = 0 => ADB actif,              *
* A = 1 => ADB inactif.                        *

ADBYES      CLC
            XCE               ; 8 BIT
            SEP   #$30
            LDA   #$00
            BRA   STARTADB    ; ACTIF

ADBNO       CLC
            XCE               ; 8 BIT
            SEP   #$30
            LDA   #$01        ; ON ATTEND
            BRA   STARTADB    ; INACTIF

STARTADB    CLC
            XCE
            SEP   #$30
            CMP   #$02        ; B = un Banc des I/Os (0, 1, $E0 ou E1)
            BCS   FINADB
            LDX   #$01
:SUIT       EOR   #$01
            ORA   #$04
            STA   :CMD+1
            TXA
            STA   PTR
            BIT   $C010
            REP   $30
            LDA   #$0000
            PHA
            PHA
            PHA
            PEA   $0003
            _SENDINFO
            PEA   $0001
            PEA   ^PTR
            PEA   PTR
:CMD        PEA   $0000
            _SENDINFO

FINADB      CLC
            XCE               ; ON SORT 16 BIT
            REP   #$30
            RTS
PTR         HEX   0000

***************************************

************************************ LIGNE *************************************

**************  CALCUL  DX  DY  ************

            CLC
            XCE
            REP   #$30

LIGNE       LDA   POSX
            STA   POSXA
            LDA   POSY
            STA   POSYA

LIGNE2      LDA   X0          ; **
            CMP   X1
            BMI   DXP         ; X0<X1

DXN         LDA   X0          ; DX=X1-X0 < 0
            SEC
            SBC   X1
            STA   DX
            BRA   DY1

DXP         LDA   X1          ; DX=X1-X0 > 0
            SEC
            SBC   X0
            STA   DX

DY1         LDA   Y0
            CMP   Y1
            BMI   DYP         ; Y0<Y1

DYN         LDA   Y0          ; DY=Y1-Y0 < 0
            SEC
            SBC   Y1
            STA   DY
            BRA   DEL1

DYP         LDA   Y1          ; DY=Y1-Y0 > 0
            SEC
            SBC   Y0
            STA   DY

DEL1        LDA   DX
            CMP   DY
            BPL   DXDY        ; DX>DY
            JMP   DYDX        ; DX<DY

*******************************************************
**********************  DX > DY  **********************
*******************************************************

DXDY        LDA   DY
            STA   DXDY3+1
            STA   DXDY6+1
            STA   DXDY8+1
            STA   DXDY11+1

            LDA   DX
            SEC
            SBC   DY
            STA   DXDY4+1     ; DX-DY
            STA   DXDY9+1

*** SWAP ***

            LDA   X1
            CMP   X0
            BPL   DXDY1       ; X1 > X0

            LDX   X0
            LDA   X1          ; X1 = X0
            STA   X0          ; X0 = X1
            STX   X1

            LDX   Y0
            LDA   Y1          ; Y1 = Y0
            STA   Y0          ; Y0 = Y1
            STX   Y1

************

DXDY1       LDA   X0
            STA   X           ; X=X0
            LDA   Y0
            STA   Y           ; Y=Y0

            LDA   Y1
            CMP   Y0
            BPL   DXDY13      ; DY>0

*****

            LDA   SVYI
            CMP   #$0001
            BEQ   DXDY12
            LDA   #$0001
            STA   LI
            BRA   PL1
DXDY12      LDA   #$0001
            STA   LI1

PL1         JSR   PLOT        ; DY<0
            LDA   X
            CMP   X1          ; X=X1 ?
            BNE   DXDY2
            LDA   Y
            CMP   Y1          ; Y=Y1 ?
            BNE   DXDY2
            RTS               ; FIN

DXDY2       INC   X           ; X=X+1
            LDA   OF

DXDY3       CMP   #$0000      ; OD=DY
            BPL   DXDY5

            LDA   OF
            CLC
DXDY4       ADC   #$0000      ; DEL
            STA   OF
            DEC   Y           ; Y=Y-1
            BRA   PL1

DXDY5       LDA   OF
            SEC
DXDY6       SBC   #$0000      ; OD=DY
            STA   OF

            BRA   PL1

******

DXDY13      LDA   SVYI
            CMP   #$0001
            BEQ   DXDY14
            LDA   #$0001
            STA   LI
            BRA   PL2
DXDY14      LDA   #$0001
            STA   LI1

PL2         JSR   PLOT        ; DY>0
            LDA   X
            CMP   X1          ; X=X1 ?
            BNE   DXDY7
            LDA   Y
            CMP   Y1          ; Y=Y1 ?
            BNE   DXDY7
            RTS               ; FIN

DXDY7       INC   X           ; X=X+1
            LDA   OF
DXDY8       CMP   #$0000      ; OD=DY
            BPL   DXDY10

            LDA   OF
            CLC
DXDY9       ADC   #$0000      ; DEL
            STA   OF
            INC   Y           ; Y=Y+1
            BRA   PL2

DXDY10      LDA   OF
            SEC
DXDY11      SBC   #$0000      ; OD=DY
            STA   OF

            BRA   PL2

*******************************************************
**********************  DX < DY  **********************
*******************************************************

DYDX        LDA   DX
            STA   DYDX3+1
            STA   DYDX6+1
            STA   DYDX8+1
            STA   DYDX11+1

            LDA   DY
            SEC
            SBC   DX
            STA   DYDX4+1     ; DY-DX
            STA   DYDX9+1

*** SWAP ***

            LDA   Y1
            CMP   Y0
            BPL   DYDX1       ; Y1 > Y0

            LDX   X0
            LDA   X1          ; X1 = X0
            STA   X0          ; X0 = X1
            STX   X1

            LDX   Y0
            LDA   Y1          ; Y1 = Y0
            STA   Y0          ; Y0 = Y1
            STX   Y1

************

DYDX1       LDA   X0
            STA   X           ; X=X0
            LDA   Y0
            STA   Y           ; Y=Y0

            LDA   X1
            CMP   X0
            BPL   DYDX13      ; DX>0

*****

            LDA   SVYI
            CMP   #$0001
            BEQ   DYDX12
            LDA   #$0002
            STA   LI
            BRA   PL3
DYDX12      LDA   #$0002
            STA   LI1

PL3         JSR   PLOT        ; DX<0
            LDA   X
            CMP   X1          ; X=X1 ?
            BNE   DYDX2
            LDA   Y
            CMP   Y1          ; Y=Y1 ?
            BNE   DYDX2
            RTS               ; FIN

DYDX2       INC   Y           ; Y=Y+1
            LDA   OF
DYDX3       CMP   #$0000      ; OD=DX
            BPL   DYDX5

            LDA   OF
            CLC
DYDX4       ADC   #$0000      ; DEL
            STA   OF
            DEC   X           ; X=X-1
            BRA   PL3

DYDX5       LDA   OF
            SEC
DYDX6       SBC   #$0000      ; OD=DX
            STA   OF

            BRA   PL3

******

DYDX13      LDA   SVYI
            CMP   #$0001
            BEQ   DYDX14
            LDA   #$0002
            STA   LI
            BRA   PL4
DYDX14      LDA   #$0002
            STA   LI1

PL4         JSR   PLOT        ; DX>0
            LDA   X
            CMP   X1          ; X=X1 ?
            BNE   DYDX7
            LDA   Y
            CMP   Y1          ; Y=Y1 ?
            BNE   DYDX7
            RTS               ; FIN

DYDX7       INC   Y           ; Y=Y+1
            LDA   OF
DYDX8       CMP   #$0000      ; OD=DX
            BPL   DYDX10

            LDA   OF
            CLC
DYDX9       ADC   #$0000      ; DEL
            STA   OF
            INC   X           ; X=X+1
            BRA   PL4

DYDX10      LDA   OF
            SEC
DYDX11      SBC   #$0000      ; OD=DX
            STA   OF

            BRA   PL4

********************** PLOT **********************

            CLC
            XCE               ; 16 BIT
            REP   #$30

PLOT        LDA   TABCRE      ; LIGNE OU CREATION DE TABLE ?
            CMP   #$0001
            BNE   PLOT7
            BRA   CREA1

PLOT7       LDA   X
            LSR   A           ; DERNIER BIT DANS LA RETENUE
            BCC   PLOT1       ; PAIR
            BRA   PLOT3       ; IMPAIR

*********  X EST PAIR  **********

PLOT1       LDA   X           ; X
            LSR   A           ; X/2
            STA   PLOT2+1
            LDA   Y           ; Y
            ASL   A           ; Y*2
            TAX
            LDA   TABLE,X     ; A0*Y
            CLC
PLOT2       ADC   #$0000      ; X/2
            TAX

PLOT6       LDAL  $E12000,X
            ORA   #$F000
            STAL  $E12000,X

            RTS

*******  X EST IMPAIR  *********

PLOT3       LDA   X           ; X
            LSR   A           ; X/2
            STA   PLOT4+1
            LDA   Y           ; Y
            ASL   A           ; Y*2
            TAX
            LDA   TABLE,X     ; A0*Y
            CLC
PLOT4       ADC   #$0000      ; X/2
            TAX

PLOT5       LDAL  $E12000,X
            ORA   #$0F00
            STAL  $E12000,X

            RTS

**********     CREATION TABLE     **********************

CREA1       LDA   SVYI
            CMP   #$0001
            BEQ   CREA11

            LDA   X           ; X      TAB
            LSR               ; X/2
            STA   CREA2+1
            LDA   Y           ; Y
            ASL               ; Y*2
            TAX
            LDA   TABLE,X     ; A0*Y
            CLC
CREA2       ADC   #$0000      ; X/2
            INY
            INY
            STA   TAB,Y
            STY   SVY
            BRA   CREA10

CREA11      LDA   X           ; X       TAB1
            LSR               ; X/2
            STA   CREA12+1
            LDA   Y           ; Y
            ASL               ; Y*2
            TAX
            LDA   TABLE,X     ; A0*Y
            CLC
CREA12      ADC   #$0000      ; X/2
            INY
            INY
            STA   TAB1,Y
            STY   SVY1

CREA10      LDA   X1
            LSR
            STA   CREA4+1
            LDA   Y1
            ASL
            TAX
            LDA   TABLE,X
            CLC               ; ON TRANSFORME DES CORDONNEES X1 ET Y1
CREA4       ADC   #$0000
            STA   CREA7+1
            STA   CREA9+1

            LDA   SVYI
            CMP   #$0001
            BEQ   CREA8

CREA6       LDA   TAB,Y       ; TAB
            SEC
CREA7       SBC   #$0000
            STA   TAB,Y
            RTS

CREA8       LDA   TAB1,Y      ; TAB1
            SEC
CREA9       SBC   #$0000
            STA   TAB1,Y
            RTS

*****************  TABLE LIGNE  *********************

X0          HEX   0000
Y0          HEX   0000
X1          HEX   0000
Y1          HEX   0000
DX          HEX   0000        ; ABS DX
DY          HEX   0000        ; ABS DY
X           HEX   0000
Y           HEX   0000
OF          HEX   0000        ; VARIABLE
OD          HEX   0000        ; VARIABLE

LI          HEX   0000        ; LIGNE INFO TAB
LI1         HEX   0000        ; LIGNE INFO TAB1
INV         HEX   0000        ; UTILISATION DE DIR
DIST        HEX   0000        ; DISTANCE^2
DIST2       HEX   0000        ; DISTANCE PARCOURUE PAR LA BOULE AVANT STOP
LACH        HEX   0000        ; BOULE LACHEE ?
TABCRE      HEX   0000        ; TABLE CREATION
SVY         HEX   0000        ; SAUVEGARDE Y TAB
SVY1        HEX   0000        ; SAUVEGARDE Y TAB 1
SVYI        HEX   0000        ; INDICATION SUR TAB OU TAB1
LEVEL       HEX   0000        ; NIVEAU ENTRE 0 ET 99
LEV1        HEX   0000        ; CHIFFRE DES DIZAINES
LEV2        HEX   0000        ; CHIFFRE DES UNITES
SCORE       HEX   0000        ; SCORE
SCR1        HEX   0000
SCR2        HEX   0000
SCR3        HEX   0000        ; SCORE
SCR4        HEX   0000
SCR5        HEX   0000
MINU        HEX   0900
TIME        HEX   0000        ; TEMPS
TIM1        HEX   0000
TIM2        HEX   0000
TIMEREG     HEX   0000        ; REGULATEUR TEMPS
PERDU       HEX   0000        ; PERDU ? = TEMPS ECOULE
BMPH        HEX   0000        ; BUMPER HORIZONTAL
BMPV        HEX   0000        ; BUMPER VERTICAL
GAGN        HEX   0000        ; GAGNE ?

LVBPA       HEX   00000000000000000000000000000000  ; BUMPERS EN COURS

*******************************************

TABLE       HEX   0000A0004001E00180022003C00360040005A0054006E00680072008C0086009000AA00A400BE00B
            HEX   800C200DC00D600E000FA00F4010E01080112012C01260130014A0144015E01580162017C0176018
            HEX   0019A019401AE01A801B201CC01C601D001EA01E401FE01F80202021C02160220023A0234024E024
            HEX   80252026C02660270028A0284029E029802A202BC02B602C002DA02D402EE02E802F2030C0306031
            HEX   0032A0324033E03380342035C03560360037A0374038E0388039203AC03A603B003CA03C403DE03D
            HEX   803E203FC03F60400041A0414042E04280432044C04460450046A0464047E04780482049C049604A
            HEX   004BA04B404CE04C804D204EC04E604F0050A0504051E05180522053C05360540055A0554056E056
            HEX   80572058C0586059005AA05A405BE05B805C205DC05D605E005FA05F4060E06080612062C0626063
            HEX   0064A0644065E06580662067C06760680069A069406AE06A806B206CC06C606D006EA06E406FE06F
            HEX   80702071C07160720073A0734074E07480752076C07660770078A0784079E079807A207BC07B607C

*********************************

MUTAB       HEX   0000010004000900100019002400310040005100640079009000A900C400E100
            HEX   00012101440169019001B901E401110240027102A402D902100349038403C103
            HEX   000441048404C90410055905A405F10540069106E40639079007E9074408A108
            HEX   00096109C409290A900AF90A640BD10B400CB10C240D990D100E890E040F810F
            HEX   0010811004118911101299122413B1134014D1146415F91590162917C4176118
            HEX   0019A119441AE91A901B391CE41C911D401EF11EA41F59201021C92184224123
            HEX   0024C124842549261027D927A4287129402A112BE42BB92C902D692E442F2130
            HEX   0031E131C432A933903479356436513740383139243A193B103C093D043E013F
            HEX   0040014104420943104419452446314740485149644A794B904CA94DC44EE14F

**********************************

TAB         HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000

**********************************

TAB1        HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0000000000000000000000000000000000000000000000000000000000000000

**********************************

CHI         HEX   D333D3D3D3D3D3D3D333
            HEX   DD3DD33DDD3DDD3DD333
            HEX   D333DDD3D333D3DDD333
            HEX   D333DDD3DD33DDD3D333
            HEX   D3D3D3D3D333DDD3DDD3
            HEX   D333D3DDD333DDD3D333
            HEX   D333D3DDD333D3D3D333
            HEX   D333DDD3DDD3DD3DDD3D
            HEX   D333D3D3D333D3D3D333
            HEX   D333D3D3D333DDD3D333

CHI1        HEX   D333D3D3D3D3D3D3D333

CHI3        HEX   D111D1D1D1D1D1D1D111

**********************************

LVL         HEX   0111110011001100110011000111
            HEX   1000110011001100110011001000
            HEX   0011111100110011001100111111
            HEX   0000000000000000000000001100
            HEX   0111110000000001001101101111
            HEX   1000110011001000000000001100
            HEX   0111110000000011000011000111
            HEX   1000110011001000110011001000
            HEX   1100110011001100111100000000
            HEX   0000110011001100110011001100
            HEX   1111110011110000000011000111
            HEX   1000000010001100110011001000
            HEX   0111110011111100110011000111
            HEX   1000000010001100110011001000
            HEX   1111000000010011001101100110
            HEX   1100110010000000000000000000
            HEX   0111110011000111110011000111
            HEX   1000110011001000110011001000
            HEX   0111110011001100011100000111
            HEX   1000110011001100110011001000

****************************

LVBP        HEX   51000000000000000000000000000000  ; BUMPERS LEVEL 0
            HEX   00000000000000000000000049000000  ;
            HEX   11000000000000000000000000000000
            HEX   00000000000061007600000000000000
            HEX   11000000000000000000000000001900
            HEX   00000000310000002100000000000000
            HEX   00000000190000000000000019000000
            HEX   61007600000000000000000000000000
            HEX   01000000000000000000000000004900
            HEX   00003100000000000100000061000000
            HEX   51000000310000005100000000000000  ; 10
            HEX   01000000000000000000000000006100
            HEX   00000000010000006100000000000000
            HEX   41000000000000000000000019000000
            HEX   00000000000000001100210000000000
            HEX   00000000000000000000000001006100
            HEX   01007600000000000000000000000000
            HEX   00002100000019000000000000000000
            HEX   00000000510000004900000000000000
            HEX   00000000000000000000310049000000
            HEX   00000000000061007C00000000000000  ; 20
            HEX   76002100000000005100000000000000
            HEX   00000000190000000000000001003500
            HEX   00003100000000000000010061000000
            HEX   00005100190000000000000049000000
            HEX   00002100000000000000710019000000
            HEX   00007600010000004100000000000000
            HEX   00002100000000003100000031000000
            HEX   00000000010019000000000005000000
            HEX   00005100000000003100410000000000
            HEX   00005100000031000000510000000000  ; 30
            HEX   76003100000000002100000031000000
            HEX   41000000610000007C00110000000000
            HEX   31004100000000003100410000000000
            HEX   00000000190031000000000019003100
            HEX   41002100000000001100000031000000
            HEX   00007C00610000006100760000000000
            HEX   00007C00000001000000110061000000
            HEX   11005100000000003100710000000000
            HEX   00005100000019004100000049000000
            HEX   00000000490000004100000019004900

            HEX   09004000030040000A00600005006000  ; BUMPERS LEVEL

