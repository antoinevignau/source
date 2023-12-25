*
* Kikekankoi : intro
*

	mx	%11
	org	$4000
	lst	off

*-----------------------------
* SOFTSWITCHES & FRIENDS
*-----------------------------

WNDTOP	=	$22	; top of text window 
WNDBTM	=	$23	; bottom+1 of text window 
CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord

maxY	=	191	; 0 to 191 = 192
nbLINES	=	200	; 200 lignes sur un CPC
deltaY	=	32

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010
VBL	=	$c019
VERTCNT	=	$c02e
SPKR	=	$c030
CYAREG	=	$C036
TXTCLR	=	$c050
TXTSET	=	$c051
MIXCLR	=	$c052
MIXSET	=	$c053
TXTPAGE1	=	$c054
TXTPAGE2	=	$c055
LORES	=	$c056
HIRES	=	$c057

*--- The firmware routines

HGR	=	$F3E2	; HGR
HPLOT	=	$F457	; HPLOT
HILIN	=	$F53A	; HPLOT TO
HCOLOR	=	$F6E9	; HCOLOR= (call+3)
INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
GETLN1	=	$FD6F
PRBYTE	=	$FDDA
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	ldx	#>]1
	ldy	#<]1
	jsr	drawPICTURE
	eom

*-----------------------------
* CODE
*-----------------------------

	jsr	HGR
	sta	MIXSET
	jsr	HOME
	
	jsr	printCSTRING
	
	@draw	#picFRAME

	lda	$ff
	jsr	showPIC
	jsr	RDKEY
	rts

*---

showPIC	asl
	tax
	lda	tblIMAGES,x
	sta	$fd
	lda	tblIMAGES+1,x
	sta	$fe
	ora	$fd
	bne	showPIC1
	rts

showPIC1	ldx	$fe
	ldy	$fd
	jsr	drawPICTURE
	rts

*-----------------------------
* MOTEUR
*-----------------------------

picFRAME	hex	42
	dfb	0,0
	hex	41
	dfb	0,149
	hex	41
	dfb	199,149
	hex	41
	dfb	199,0
	hex	41
	dfb	0,0
	hex	00

*----------------------
* drawPICTURE
*----------------------

drawPICTURE
	sty	drawREAD+1
	stx	drawREAD+2

drawLOOP	jsr	drawREAD
	cmp	#0
	bne	drawPIC1
	rts		; the end

drawPIC1	pha
	and	#%11_000000
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sta	theINK	; c'est PEN mais bon

	pla
	lsr
	bcs	doLINE
	lsr
	bcs	doPLOT

* fill

	jsr	drawREAD
	jsr	drawREAD
	jmp	drawLOOP

*----------------------------------- PLOT

doPLOT	jsr	drawREAD
	sta	theX
	jsr	drawREAD
	sta	theY
	
	lda	#nbLINES
	sec
	sbc	theY
	sta	theY
	jmp	drawLOOP

*----------------------------------- LINE ABS

doLINE	jsr	drawREAD
	sta	theX2

	jsr	drawREAD
	sta	theY2

	lda	#nbLINES
	sec
	sbc	theY2
	sta	theY2

*---------- Check height

	lda	theY
	cmp	#maxY
	bcc	doD1
	lda	#maxY
	sta	theY

doD1	lda	theY2
	cmp	#maxY
	bcc	doD2
	lda	#maxY
	sta	theY2
doD2
	
*---------- It is now time to draw as we have all variables

	ldy	theINK	; the ink color
	ldy	#0	; LOGO
	ldx	oric2hgr,y	; from the Oric to the Apple II
	jsr	HCOLOR+3	; to skip CHRGET 

	ldx	theX	; HPLOT x,y
	ldy	theX+1
	lda	theY
	sec
	sbc	#deltaY
	jsr	HPLOT

	ldy	theY2
	lda	theY2
	sec
	sbc	#deltaY
	tay
	lda	theX2	; TO x2,Y2
	ldx	theX2+1
	jsr	HILIN	; draw the line

	lda	X0L	; save the updated coords
	sta	theX
	lda	X0H
	sta	theX+1
	lda	Y0
	clc
	adc	#deltaY
	sta	theY
	jmp	drawLOOP

*-------- Read data
	
drawREAD	lda	$bdbd
	inc	drawREAD+1
	bne	drawREAD1
	inc	drawREAD+2
drawREAD1	rts
	
*----------------------
* Donnes du moteur
*----------------------

theX	dw	140	; milieu de l'cran par dfaut
theY	dw	96
theX2	ds	2
theY2	ds	2
theRADIUS	ds	1
theFB	ds	1
theINK	ds	1
thePAPER	ds	1

*	APPLE	ORIC
* 0	black1	black
* 1	green	red
* 2	blue	green
* 3	white1	yellow
* 4	black2	blue
* 5	-	magenta
* 6	-	cyan
* 7	white2	white

oric2hgr	hex	0705010602030400

*-----------------------------
* DONNEES
*-----------------------------

	put	common/images.s
*	put	fr/fr.s

*-----------------------------

printCSTRING
	lda	#0
	sta	CH
	lda	#20
	jsr	TABV
	
	lda	$ff
	jsr	PRBYTE
	
	lda	#" "
	jsr	COUT
	
	lda	$ff
	asl
	tax
	lda	tbl7000,x
	sta	pcs1+1
	lda	tbl7000+1,x
	sta	pcs1+2
	
pcs1	lda	$ffff
	beq	pcs3
	jsr	COUT	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
pcs3	rts

*---

tbl7000	da	$bdbd
	da	str8010,str8020,str8030,str8040,str8050,str8060,str8070,str8080,str8090
	da	str8100,str8110,str8120,str8130,str8140,str8150,str8160,str8170,str8180,str8190
	da	str8200,str8210,str8220,str8230,str8240,str8250,str8260,str8270,str8280,str8290
	da	str8300,str8310,str8320,str8330,str8340,str8350,str8360,str8370,str8380,str8390
	da	str8400,str8410,str8420,str8430,str8440,str8450,str8460,str8470,str8480,str8490
	da	str8500,str8510,str8520,str8530,str8540,str8550,str8560,str8570,str8580,str8590
	da	str8600

str8010	asc	"L"A7"antre du demon."8D
	asc	"Vous etes dans une grotte amenagee..."00
str8020	asc	"Le repere du chirurgien."8D
	asc	"Il y a une porte au sud, il y a plein de"
	asc	"photos chirurgicales sur les murs"00
str8030	asc	""00	; X la mort
str8040	asc	"L"A7"antre du sorcier."00
str8050	asc	"Au bord du lac."8D
	asc	"Vous etes au bord d"A7"un lac souterrain"00
str8060	asc	""00	; X gagne
str8070	asc	"Le repere du lecteur."00
str8080	asc	"Au nord, un banc de sable. Vous etes sur"
	asc	"le cote du lac, le seul chemin est au"8D
	asc	"nord sous la forme d"A7"un banc de sable"00
str8090	asc	"Le bout du lac."00
str8100	asc	"La salle mecanique."00
str8110	asc	"Une grotte vide."00
str8120	asc	"La trappe des enrages. Il y a une trappe"
	asc	"au sol, munie d"A7"une serrure."00
str8130	asc	"Il y a une porte au sud marquee EXIT."00
str8140	asc	"Il y a une porte au sud avec le jour qui"
	asc	"filtre en dessous"00
str8150	asc	"L"A7"antre du lecteur."00
str8160	asc	"Il y a trois marmites avec des soupes"8D
	asc	"rouge, verte et bleue"00
str8170	asc	"L"A7"atelier."00
str8180	asc	"Dans une frele esquive en scotch et bois"
	asc	"pourri, proche de la rive."00
str8190	asc	"La chambre des lumieres."00
str8200	asc	"Le refuge de l"A7"alchimiste."00
str8210	asc	"Le gite du fakir."8D
	asc	"Il y a un anneau fixe au mur"00
str8220	asc	"L"A7"antre de la verite."00
str8230	asc	"L"A7"antre du fou."00
str8240	asc	"L"A7"antre du maigre."00
str8250	asc	"Le repere de l"A7"embaumeur."00
str8260	asc	"Le gite du bricoleur."8D
	asc	"Il y a une ouverture au sud..."00
str8270	asc	"Le repere du fuyard. Il y a une trappe."00
str8280	asc	"Le refuge du montagnard."00
str8290	asc	"Le chemin des rongeurs."00
str8300	asc	"L"A7"antichambre de la mort."00
str8310	asc	"Du bruit a l"A7"est."8D
	asc	"Il y a une porte marquee DANGER au sud"00
str8320	asc	"De la lumiere au sud."8D
	asc	"Il y a au sud un passage d"A7"ou viennent"8D
	asc	"de droles de bruits"00
str8330	asc	"L"A7"antre du maniaque."00
str8340	asc	"Le repere des rats."8D
	asc	"Il y a des rats un peu partout..."00
str8350	asc	"La salle des survivants."00
str8360	asc	"La cremerie et le tailleur."00
str8370	asc	"Le tabac et la boulangerie."00
str8380	asc	"Le traiteur."00
str8390	asc	"Le medecin et le chausseur."00
str8400	asc	"Le coin nord-ouest de la ville."00
str8410	asc	"La fin de la ville !"00
str8420	asc	"Dans le tabac."8D
	asc	"Le vendeur dort sur le comptoir"00
str8430	asc	""00	; X rien
str8440	asc	"Chez le tailleur."8D
	asc	"Il y a plein d"A7"habits a vendre"00
str8450	asc	"Vous etes dans la cremerie."00
str8460	asc	"Vous etes chez le chausseur."8D
	asc	"La boutique est bien achalandee"00
str8470	asc	"Chez le medecin."8D
	asc	"Le medecin est parti"00
str8480	asc	"Vous etes face a la droguerie."00
str8490	asc	"Dans la droguerie."00
str8500	asc	"Le coin sud-est de la ville."00
str8510	asc	"Devant un monument..? Le fameux temple a"
	asc	"la gloire du GRAND KiKeKanKoi !"00
str8520	asc	"Que vendez-vous ?"00
str8530	asc	"La salle de la B.A."00
str8540	asc	"Le mausolee de l"A7"exterminateur."00
str8550	asc	"Le choeur du Temple."00
str8560	asc	"L"A7"antre du venere."8D
	asc	"Il y a une porte au sud"00
str8570	asc	"Le chemin des dipteres."00
str8580	asc	"L"A7"antre du victorieux."8D
	asc	"Vous etes dans un reduit dont les murs"8D
	asc	"sont faits de blocs de pierre."00
str8590	asc	""00
str8600	asc	""00