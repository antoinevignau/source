*
* Kontrabant 2
*
* (c) 1984, Radio Student
* (c) 2023, Tomaz Stih
* (c) 2024, Brutal Deluxe Software
*
* See the MIT license @ https://github.com/iskra-delta/idp-quill/blob/main/LICENSE
*

*------------------------------
* APPLE
*------------------------------

strLEFTP	asc	"("00
strSLASH	asc	"/"00
strRIGHTP	asc	")? "00
strCOMMANDE	asc	8D8D">"00
strCOMMASPACE	asc	", "00

*------------------------------
* EQUATES
*------------------------------

*-------------- COMMANDS

CMD_PARBIT	=	$C0	; bits for parameters
CMD_NOPARS	=	$00
CMD_1PAR	=	$40
CMD_2PARS	=	$80
CMD_ESC	=	$C0	; escape sequence

* is command condition or action?

CMD_TYPBIT	=	$20	; bits for command type
CMD_CND	=	$00
CMD_ACT	=	$20

CMD_FNBIT	=	$1F	; function bits

* function codes

FN_EOF	=	$00 + CMD_ESC	; end of function

* conditions

FN_AT	=	 1 + CMD_CND + CMD_1PAR	; at condition
FN_CARRIED	=	 2 + CMD_CND + CMD_1PAR
FN_NOTCARR	=	 3 + CMD_CND + CMD_1PAR
FN_LT	=	 4 + CMD_CND + CMD_2PARS
FN_GT	=	 5 + CMD_CND + CMD_2PARS
FN_EQ	=	 6 + CMD_CND + CMD_2PARS
FN_NOTAT	=	 7 + CMD_CND + CMD_1PAR
FN_ATLT	=	 8 + CMD_CND + CMD_1PAR
FN_WORN	=	 9 + CMD_CND + CMD_1PAR
FN_NOTWORN	=	10 + CMD_CND + CMD_1PAR
FN_PRESENT	=	11 + CMD_CND + CMD_1PAR
FN_ABSENT	=	12 + CMD_CND + CMD_1PAR
FN_ZERO	=	13 + CMD_CND + CMD_1PAR
FN_NOTZERO	=	14 + CMD_CND + CMD_1PAR
FN_CHANCE	=	15 + CMD_CND + CMD_1PAR

* actions

FN_GOTO	=	 1 + CMD_ACT + CMD_1PAR	; goto action
FN_DESC	=	 2 + CMD_ACT + CMD_NOPARS	; desc action
FN_QUIT	=	 3 + CMD_ACT + CMD_NOPARS	; quit game!
FN_BEEP	=	 4 + CMD_ACT + CMD_2PARS	; play sound
FN_SET	=	 5 + CMD_ACT + CMD_1PAR
FN_CLEAR	=	 6 + CMD_ACT + CMD_1PAR
FN_REMOVE	=	 7 + CMD_ACT + CMD_1PAR
FN_MESSAGE	=	 8 + CMD_ACT + CMD_1PAR
FN_DROP	=	 9 + CMD_ACT + CMD_1PAR
FN_WEAR	=	10 + CMD_ACT + CMD_1PAR
FN_PAUSE	=	11 + CMD_ACT + CMD_1PAR
FN_CREATE	=	12 + CMD_ACT + CMD_1PAR
FN_DESTROY	=	13 + CMD_ACT + CMD_1PAR
FN_SWAP	=	14 + CMD_ACT + CMD_2PARS
FN_PLUS	=	15 + CMD_ACT + CMD_2PARS
FN_MINUS	=	16 + CMD_ACT + CMD_2PARS
FN_LET	=	17 + CMD_ACT + CMD_2PARS
FN_OK	=	18 + CMD_ACT + CMD_NOPARS
FN_DONE	=	19 + CMD_ACT + CMD_NOPARS
FN_TURNS	=	20 + CMD_ACT + CMD_NOPARS
FN_INVEN	=	21 + CMD_ACT + CMD_NOPARS
FN_END	=	22 + CMD_ACT + CMD_NOPARS
FN_SAVE	=	23 + CMD_ACT + CMD_NOPARS
FN_LOAD	=	24 + CMD_ACT + CMD_NOPARS
FN_ANYKEY 	=	25 + CMD_ACT + CMD_NOPARS
FN_SCORE  	=	26 + CMD_ACT + CMD_NOPARS
FN_GET	=	27 + CMD_ACT + CMD_1PAR
FN_CASE	=	28 + CMD_ACT + CMD_NOPARS
FN_HOME	=	29 + CMD_ACT + CMD_NOPARS
FN_DEBUG	=	30 + CMD_ACT + CMD_NOPARS

* command type: connection, action or process

CMD_PROC	=	$00
CMD_CONN	=	$01
CMD_ACTI	=	$02

*-------------- ENGINE

MAX_INPUT_LEN	=	32	; 32 chars
MAX_FLAGS	=	33

FLG_DARK	=	0	; special flags
FLG_COUNT_CARR	=	1

FLG_DSC	=	2	; auto dec. flags
FLG_DSCD	=	3	; its dark
FLG_DSCDO0	=	4	; its dark and obj 0 not present

FLG_CMD0	=	5	; every command
FLG_CMD1	=	6
FLG_CMD2	=	7
FLG_CMD3	=	8
FLG_CMDD	=	9	; its dark
FLG_CMDDO0	=	10	; its dark and obj 0 not present

FLG_MINUTE	=	28	; kontrabant 2 special flag
FLG_SECOND	=	29

FLG_SCORE	=	30	; more special flags
FLG_TURNS_LO	=	31
FLG_TURNS_HI	=	32

FLG_CLEAR	=	0
FLG_SET	=	255

*-------------- FUNCTIONS

R_FAIL	=	0
R_SUCCESS	=	1

*-------------- IMAGES

NUMIMAGES	=	32
SIZEOF_IMAGES	=	4

*-------------- OBJECTS

O_NOTCRE	=	252
O_WORN	=	253
O_CARRIED	=	254

MAXCARR	=	10	; was originally 8 but as wearing = carrying
NUMOBJECTS	=	77	; it is better to increase the number of items

LIGHTOBJ	=	0

*-------------- PARSER

WORD_ABSENT	=	$00
WORD_UNKNOWN	=	$ff
SIZEOF_WORDS	=	5

*-------------- RULES

NUM_RULES	=	460
SIZEOF_RULES	=	5	; 1+2+2

*-------------- SYS_MESSAGES

SM_ITS_DARK	=	0
SM_I_ALSO_SEE	=	1
SM_WHATS_NEXT1	=	2
SM_WHATS_NEXT2	=	3
SM_WHATS_NEXT3	=	4
SM_WHATS_NEXT4	=	5
SM_DONT_UNDERSTAND =	6
SM_NO_DIRECTION	=	7
SM_CANT	=	8
SM_CARRYING	=	9
SM_WORN	=	10
SM_CARR_NOTHING	=	11
SM_WANNA_QUIT	=	12
SM_GOODBYE_RETRY =	13
SM_THEEND	=	14
SM_OK	=	15
SM_PRESS_ANY_KEY =	16
SM_YOU_HAVE_TAKEN =	17
SM_TURN	=	18
SM_TURNS_PLURAL	=	19
SM_DOT	=	20
SM_YOU_HAVE_SCORED =	21
SM_PERCENT	=	22
SM_NOT_WEARING	=	23
SM_HANDS_FULL	=	24	; from WORN to CARRY
SM_ALREADY_HAVE	=	25
SM_NOT_HERE	=	26 
SM_TOO_HEAVY	=	27	; too many objects
SM_DONT_HAVE	=	28
SM_ALREADY_WEARING =	29
SM_YES	=	30
SM_NO	=	31
SM_DIRECTIONS	=	32
SM_NO_WAY_OUT	=	33
SM_LOAD_SLOT	=	34	; ** new ** load from which slot
SM_SAVE_SLOT	=	35	; ** new ** save to which slot

*-------------- WORDS

NWORDS	=	199

*------------------------------
* IMAGES
*------------------------------

tblIMAGES	dfb	3	; available images
	dfb	4
	dfb	5
	dfb	7
	dfb	8
	dfb	12
	dfb	27
	dfb	33
	dfb	36
	dfb	37
	dfb	41
	dfb	42
	dfb	43
	dfb	45
	dfb	46
	dfb	48
	dfb	49
	dfb	50
	dfb	54
	dfb	56
	dfb	58
	dfb	60
	dfb	61
	dfb	66
	dfb	69
	dfb	70
	dfb	84
	dfb	85
	dfb	87
	dfb	89
	dfb	91
	dfb	98
	hex	ff

*------------------------------
* LOCATIONS
*------------------------------

*		123456789012345678901234567890123456789

strTOINET	dfb	14
	asc	"Kontrabant 2"8D8D
	dfb	9
	asc	"(c) 1984 Radio Student"8D
	dfb	10
	asc	"(c) 2022, Tomaz Stih"8D8D8D
	dfb	12
	asc	"Apple II version"8D8D
	dfb	7
	asc	"(c) 2025, Janez J. Starc &"8D
	dfb	9
	asc	"Brutal Deluxe Software"00
	
tblLOCATIONS
	asc	"Edini si pismen v svoji dezeli,"8D"ostali bi jasno isto hoteli."8D"Resiti iz dobe kamene jih-"8D"zelja velika,"8D
	ASC	"tebe junaka to delo zamika."8D"Ne cakaj oklevaj,"8D"ti le pohiti,"8D"brez tebe vsi bomo kmalu v ..."8D00
	asc	"Sam v hisi ti stojis,"8D"Mavrico v rokah drzis."00
	asc	"Si na kriziscu kamnitem,kjer"8D"KONTRABANT zivljenju da ritem."00
	asc	"Gozdovi temacni so hladni in"8D"mracni."00
	asc	"Jantar dobiti, to je tezko."8D"Vsak se sprasuje, hudica kako."00
	asc	"Bodi vztrajen in hodi na sever,"8D"stokrat ponovi ta tezki manever."8D"Prehod je odprt"8D"med pol in cetrt."00
	asc	"Mocvirje je vlazno,"8D"pobegniti je vazno."00
	asc	"Komarji te pikajo,"8D"ti tipke zatikajo,"8D"zelo je bolece,"8D"POBEGNI, tu zate ni srece."00
	asc	"Cudni ljudje tukaj zivijo,"8D"na reke bregovih si koce gradijo"00
	asc	"Si v hladni in vlazni votlini,"8D"mrzlo ti je, a nikar ne izgini."8D"Tu so krojaci, ki sivati znajo"8D"za lepo besedo pa igle ti dajo."00
	asc	"Sever in Vzhod te resita zmot."00
	asc	"Gledas in vprasas:"8D""A2"Kaj to je kolisce ?"A2""8D"Jalen ti pravi:"8D""A2"Ne vidis, mostisce !"A2""00
	asc	"Hecna je zver, ta jugozaver,"8D"kmalu od njega bo le se kadaver."00
	asc	"Mamut ogromen k tebi drvi,"8D"na vzhod in zahod zapira ti pot,"8D"hitro ukreni nekaj v resitev,"8D"ce ne ti ostane le se molitev."00
	asc	"V gozdu so ceste, zmrzali,"8D"tukaj zivijo nevarne zivali."00
	asc	"Vidi se skozi listja zaplate"8D"da v daljavi nekdo gleda vate."00
	asc	"Ob Savi in Donavi mesto lezi,"8D"napoved vremena brez rege molci."00
	asc	"Si sredi mracne goscave,"8D"uh kako tuli volk iz daljave."00
	asc	"Andersen deklico sem je poslal,"8D"na sever potem ji pot svetoval"8D""A2"Vzigalic prinesi hitro paketek,"8D"novih bo tock on zate zacetek."A2""00
	asc	"Gozzzddddd..."00
	asc	"Tople obleke se tu da dobiti,"8D"vendar pa nimajo nic za zasiti."00
	asc	"V delavnici NAGI izbira velika,"8D"vse kar tu vidis zelo te zamika."8D"Za tanko tencico so situl obrisi"8D"MEJDINHONGKONG na njih so napisi"00
	asc	"V vaski si novi tovarni,"8D"pravijo da SITULARNI."00
	asc	"Gozdovi so gosti, toda nevarni,"8D"nestvori v njih pa strasno"8D"nemarni."00
	asc	"Potke izhojene, stara drevesa,"8D"kaj se ti res ze mudi v nebesa."00
	asc	"Vsaka zival na plen svoj prezi,"8D"pazi popotnik da ne bos to ti."00
	asc	"Vse kar vidis so krosnje dreves,"8D"lepo ti zapirajo pot do nebes."00
	asc	"Pri SPARKU se vedno smolo imajo,"8D"a kamen zaviti licno ti znajo."00
	asc	"Hrib nad dolino se dviga visoko,"8D"cistega zraka vdihni globoko."00
	asc	"V skali zija luknja velika,"8D"vanjo vztopiti te jasno zamika."8D"Vstop vanjo le redko je prost,"8D"jamski je medved stalni tu gost."00
	asc	"Trgovci z novci tukaj zivijo,"8D"od tebe zakladov kupiti hlepijo."8D"Njihovih upov nikar ne porusi,"8D"le pri kupciji jih dobro osusi."00
	asc	"Nekoc bo tu stala lepa gostilna,"8D"pijaca bo dobra, hrana obilna."8D"Tu stanoval bo pisatelj brkati,"8D"o njem bomo morali spise pisati."00
	asc	"Tu v gozdu je naselje,"8D"v njem denar je in veselje."8D"Zdomci v njem zivijo,"8D"trnke prodajat ti hitijo."00
	asc	"Proteus ribica v tej jami zivi,a"8D"isto kot clovek ona le ni."00
	asc	"Ta kraj je nevaren zaradi zveri,"8D"ki zrejo rade ljudske stvari."8D"(na V,Z in J tu so poti)"00
	asc	"Revezi bedni na klancu zivijo,"8D"vsak po tri kamne"8D"na teden dobijo."00
	asc	"Na jezera robu Jazon te caka,"8D"vreme ga muci, noce ovcjaka."8D"Na drugi je strani pravi res raj"8D"za coln popravit nekaj mu daj."00
	asc	"Rim je lepo mesto vecno,"8D"v njem najde vsak vse,"8D"toda nori Neron misli resno,"8D"da ob mraku ga zazge."00
	asc	"Na rimski si cesti,"8D"ki pise se z malo,"8D"od nje bo skalovje,"8D"do danes ostalo."00
	asc	"Sam si na cesti,"8D"hoja ti skodi,"8D"gledas in gledas"8D"v neznano te vodi."00
	asc	"Na zemljo slovansko vodi ta most"8D"prehod na jug za prav vse ni"8D"prost."00
	asc	"Zrcala na stropu in stene rdece,"8D"vsak bi tu moski znorel od srece"00
	asc	"Pred zidom emonskim stojis,"8D"noter vstopiti se jasno bojis."00
	asc	"Atile Huna tu se bojijo,"8D"glavo njegovo na pladnju zelijo."00
	asc	"V rimskem mestu ti stojis,"8D"se zivljenja veselis."00
	asc	"Pod svobodni soncem Irena lezi,"8D"po hrbtu jo pece, da kar zari."8D"Ce kreme ji zmanjka ze zasmrdi."00
	asc	"Prisel si v bogato mesto,"8D"kipec zlat njegov ponos,"8D"preden gres naprej na cesto,"8D"pazljivo vtakni vanj svoj nos."00
	asc	"Si na trgu zdaj emonskem,"8D"hladna zemlja tu lezi,"8D"Ce v rokah drzis lopato,"8D"kaj zakoplji tudi ti."00
	asc	"Si pri rimskem akveduktu,"8D"vodo se od tu dobi,"8D"Ker pa gre prav vsa v mesta,"8D"je popit ne mores ti."00
	asc	"Veterc prihaja, sonce zahaja,"8D"nova ljubezen se v tebi poraja."00
	asc	"V Splitu znani so artisti,"8D"ki igrajo noc in dan,"8D"instrumentov primanjkuje,"8D"cesar isce jih zaman."00
	asc	"Pula mesto-pristanisce,"8D"ki areno svojo ima."8D"Vstopi in poisci srece,"8D"ce le dirkat' se ti da."00
	asc	"V areni velicastni,"8D"sredi steze ti stojis,"8D"tekmovalci so posastni,"8D"se zelo jih ti bojis."00
	asc	"Gozdic je grd in zanemarjen,"8D"to ti pade v oci,"8D"vse kar z drevja mu odpade,"8D"tam za vecno oblezi."00
	asc	"Tu smrdljivec brez manir"8D"je Mefisto-vrag-pastir."00
	asc	"Kmetje tu so vsi pijani,"8D"trta dobro jim rodi,"8D"ce dobiti vina hoces,"8D"orodje jim ponudi ti."00
	asc	"V daljavi kuzno mesto,"8D"crn dim se ven vali."8D"Kuga je posast nevarna,"8D"s koso naokrog mori."00
	asc	"Mesto je kuzno, pravo grobisce,"8D"tu nekje prides na pokopalisce."8D"Marsikaj groznega tam se dobi,"8D"carovnice vabi in veseli."00
	asc	"Kamen na kamen, pokopalisce,"8D"smrti tu najde, kdor jo le isce."00
	asc	"Kot kura na jajcih"8D"bel grad tu stoji."8D"Vina je zejnih"8D"gospodov kleti."00
	asc	"Letalisce je veliko,"8D"saj na hribu vse hrumi."8D"Turboti so iz prometa"8D"ljudske glave zrejo vsi."00
	asc	"Most cez vodo se razpenja,"8D"na vzhod gotovo zelis,"8D"ni zate tu nadaljevanja,"8D"ce za mitnino denar ne dobis."00
	asc	"Cesta bela je, siroka,"8D"ravno vodi te na jug."8D"To moci ti novih daje,"8D"le na delo zdaj, HORUK!"00
	asc	"Vstopil si v stajo veliko,"8D"vsak konja tu vzame na piko."8D"A da bi mogel zivalco dobiti,kar"8D"rekel nek Artur je moras storiti"00
	asc	"Dusan je car bogat bajeslovno,"8D"konje kupuje in menja masovno."00
	asc	"Car Lazar  mrtev je in spi,"8D"le ONA ga lahko zbudi."00
	asc	"Sultanov dvorec"8D"je nov in sodoben,"8D"zensk potrebuje,"8D"da bolj bo udoben."00
	asc	"V brigadi Marko vozi Karioillo,"8D"v njej se vozi z vilo Ravioilo."00
	asc	"Nizko grmovje, trava zelena,"8D"lepsa od tega ni zenska nobena,"8D"(nobena ocen bila bolj zazeljena"8D"..."00
	asc	"V daljavo pot se vije,"8D"tam na hribcku grad stoji."8D"Gor na gradu nekdo vpije,"8D"grascak ki se ga vsak boji."00
	asc	"Volkec hudi tu prebiva,"8D"Vucko njemu je ime,"8D"to olimpijsko je mesto,"8D"kjer se trgovati sme."00
	asc	"Carica Milica zala in lepa,"8D"nakita dobiti zal more ne zlepa."00
	asc	"Temne so jece,"8D"v strasnem tem gradu."8D"Ljudje v njih zivijo"8D"v vlagi in hladu."00
	asc	"Cudezi vedno se v bajkah godijo,"8D"njih pa junaki tukaj zivijo."00
	asc	"Mehmed Sokolovic tukaj je pasa,"8D"dobra se zelja spolnila bo vasa"00
	asc	"Na Kosovem polju reka se vije,"8D""A2"BIREKU ESTE I MIRE"A2","8D"prebivalec ti vpije."00
	asc	"Tu veliki so gozdovi,"8D"tulijo v njih volkovi."00
	asc	"Karadzic se pise Vuk,"8D"pise, dela on brez muk."00
	asc	"..."A2"svaka puska bit ce ubojita,u"8D"rukama Mandusica Vuka"A2" ..."00
	asc	"Srbija ni res velika,"8D"in sosede ona mika."8D"Vsak si jo srcno zeli,"8D"a napasti se boji."00
	asc	"Sultan Murat res bogat je,"8D"prav razkosen njegov dvor."00
	asc	"Bistro jezero globoko"8D"pred nogami ti lezi."8D"Biserov v njem prekrasnih,"8D"rad bi zdaj imel jih ti."00
	asc	"V Dubrovniski apoteki,"8D"za bisere dobijo se tableti."00
	asc	"Morje mokro je in slano,"8D"ker radi slano jemo hrano,"8D"sol mu kradejo na plano."00
	asc	"Ta dolina polna roz je,"8D"Bleiweis znani tu zivi."8D"Kranjske cbele obozuje,"8D"lipe ljubi in goji."00
	asc	"Ljubljana je mesto belo, sodobno"8D"vendar je v delu novem turobno."00
	asc	"Od nekdaj lepe so Kranjske"8D"slovele,"8D"al lepse od gore bilo ni nobene."8D"Nobene ocem bilo bilj zazeljene,"8D
	ASC	"v casu nje snega smucisca ne"8D"stene."00
	asc	"Gora Triglav je velika,"8D"kozorogov mrgoli,"8D"gor hoditi te zamika,"8D"to si vsak Slovenc zeli."00
	asc	"Cesta te na Dunaj pelje,"8D"le pohiti v veselje."00
	asc	"V Pratru hoce vsak igrati,"8D"dobri tam so avtomati."8D"Prvi Kontrabant igrajo,"8D""A2"dvojke"A2" zal se ne poznajo."00
	asc	"Marija pomocnica rada ti pomaga,"8D"po nje imeni cesta 5% ti ze vaga"00
	asc	"V lepem dvorcu Jozef se zivi,"8D"trebuh Francka kar prerad boli."00
	asc	"Nekdaj tu bila je lipa,"8D"danes nje vec ni."8D"Za cistoco ti je pipa,"8D"ce ne dela pa smrdi."00
	asc	"Zdaj se koncu priblizujes,"8D"se nagrada ti smeji,"8D"uporabi vse zdaj svoje znanje,"8D"zal poti nazaj vec ni."00
	asc	"Si v Ljubljani, mestu belem,"8D"nekaj tukaj pustil si,"8D"ce si se igral pravilno,"8D"pod nogami ti lezi."00
	asc	"Prazen tu stoji podstavek,"8D"nic na njem se ne stoji."8D"Le pazljivo placaj davek,"8D"gor postavi kaj kar ti."00
	asc	"Tu posast stoji pred tabo,"8D"ze ubiti te grozi,"8D"ima obliko paragrafa,"8D"prehiti jo ubij jo ti."00
	asc	"Soba pusta je in prazna,"8D"pot te vodi na zahod."8D"Presenecenja so blazna,"8D"in nevarnosti povsod."00
	asc	"Skoraj ti je ze uspelo,"8D"v zadnje leto priti zdaj,"8D"dobro res zdaj ti razmisli,"8D"pameten odgovor daj."00
	asc	"Igro si koncal uspesno,"8D"dober res si tu, ni kaj."8D"Sliko shrani na kaseto,"8D"hitro postarju jo daj."00
	asc	"Na samotnem ti otoku,"8D"v tihem morju zdaj stojis,"8D"ker govoril ti grdo si,"8D"nove sanse ne dobis."00
	asc	""00

*------------------------------
* MESSAGES
*------------------------------

tblMESSAGES
	asc	"Oblecen v runo zasmoljeno,"8D"prides v prihodnost ne nobeno."00
	asc	"Jazon hvalezno je smolo vzel,"8D"popravil si ladjo in s sabo te"8D"vzel."00
	asc	"Smola lepljiva cista res ni,"8D"Jazon je noce, ker to ga jezi."00
	asc	"V lepem je loku on odletel,"8D"mamuta tocno v srce je zadel."00
	asc	"Vrgel si trafo silno mocno,"8D"odletel je dalec, nazaj ga ne"8D"bo."00
	asc	"Medved pozresno med tvoj pograbi"8D"dalec se umakne, na tebe pozabi."8D""00
	asc	"Medved pred luknjo veliko sedi,"8D"noter nikogar zastonj ne pusti."00
	asc	"Ogenj zagorel, cebele prepodil,"8D"med v panju ti osvobodil."00
	asc	"Veter je mocen, ogenj gori, se"8D"enkrat zapiha - plamena vec ni."00
	asc	"Zver neumna ne ve kaj dela,"8D"proteusa si je vzela."00
	asc	"Resi uganko, potem se premakni,"8D"ce hoces ziveti, se hitro"8D"umakni."00
	asc	"Pohiti in hitro nekaj naredi, ce"8D"ne bo, prijatelj, kaj kmalu po"8D"tebi!"00
	asc	"Umreti je tukaj silno lahko, se"8D"malo pocakaj in ze te ne bo."00
	asc	"Svetel plamencek takoj se prizge"8D"malo gori se, nato pa zamre."00
	asc	"Njega ne mores z lahkoto ubiti,"8D"casa je malo, ti si pa v riti."00
	asc	"Zver nevarna je zelo, prelisicis"8D"jo tezko."00
	asc	"Jugozavra ne ubiti, silno redka"8D"je zival, ce bi ti to zdajle"8D"storil, kmalu bi bilo ti zal."00
	asc	"Nevarnost videle cebele, hitro"8D"stran so odletele."00
	asc	"Zdravo neumnez, Igra sem jaz,"8D"tebe ubogam, se smejem na glas."8D"Delas napake neumne, velike,"8D"padas na stare in nove trike."8D
	ASC	"Ce bos tako nadaljeval, igre ne"8D"bos nikoli koncal."00
	asc	"Ce navajen govoriti si od doma"8D"ti tako, potlej vedi, mali"8D"clovek, z mano sale tu ne bo."00
	asc	"Led je hladen in masiven, ga"8D"stopiti je tezko, vedi pa, da"8D"brez zvijace to uspelo ti ne bo."8D""00
	asc	"Jaz sem mislil, da se skrijem;"8D"naj z lopato ga ubijem ?!?"00
	asc	"Siten kot podrepna muha,"8D"nemogoce hoces ti, ker pa sitno"8D"res vztrajas - bum ! in Atile"8D"vec ni."00
	asc	"Namazal si se in lep si zelo,"8D"novo dobiti bo silno tezko."00
	asc	"Po hrbtu jo pece da stoka in"8D"joce, od tebe namazat' pustiti"8D"se noce."00
	asc	"Irena uziva, glasno vzdihuje,"8D"Iztok, njen ljubi to kmalu"8D"zacuje. Takoj mu je jasno, kaj"8D
	ASC	"je za tem, mec svoj izvlece in"8D"resi problem."00
	asc	"Mojster pac nisi, potrebe velike"8D"cudez ti rabis da resis razlike."8D""00
	asc	"Neron hvalezno sibice vzeme,"8D"na harfo pozabi,"8D"in Rim se ze vname."00
	asc	"Dioklecijan je nad harfo"8D"navdusen, ti prstan  pokloni in"8D"kamen obrusen."00
	asc	"S harfo ti slabo ravnas, malo ze"8D"na njo igras potlej struna poci,"8D"to je grozno, a za jok je ze"8D"prepozno."00
	asc	"Jahanje dobro ni tvoja vrlina,"8D"saj to je od groma tezka"8D"vescina. Konj kar naenkrat zacne"8D"rezgetat', s sebe te vrze in"8D
	ASC	"zlomi ti vrat."00
	asc	"Spet na sever si vrnil se ti,"8D"naj le povem ti : "A2"Poti nazaj"8D"ni !"A2""00
	asc	"Na konja vila je skocila, s tabo"8D"je naprej krenila."00
	asc	"Konja vila zdaj razjaha, malo"8D"stran gre in ti maha."00
	asc	"Kosovko devojko lepo si resil,"8D"se sreca da nisi pred njo se"8D"osmesil."00
	asc	"Kosavka carju spati ne da,"8D"skoz vrata odprta vrze te ta."00
	asc	"Devojka je res krepostna, se"8D"poljubcka ti ne da, da naredil"8D"bi, kar hoces, tega mi bonton ne"8D"da."00
	asc	"Kako njo podreti, tega ne ves,"8D"sicer pa tega tudi ne smes."00
	asc	"Slab si svercer,teleban,"8D"stokrat slabsi kot Krpan."00
	asc	"Kozoroga si ubil, kamen cudezni"8D"dobil."00
	asc	"Zaradi takih, kot si ti, izumrli"8D"so ze vsi."00
	asc	"Franc ozdravljen je in vlada,"8D"ker pa hvalezna ti je gnada,"8D"pot naprej ti podari."00
	asc	"Odkopal si zdaj Emonca, kip je"8D"lep, tu res ni kaj, pot te vodi"8D"prot' zahodu, zal ne mores vec"8D"nazaj."00
	asc	"Kip je lep, ljudje pa srecni,"8D"pet procentov dajo zanj, spet"8D"gres na zahod pocasi, je do"8D"konca vedno manj."00
	asc	"Paragraf posast je mrtva, velik"8D"si postal junak, tock, ki si do"8D"zdaj dobil jih, res ne more"8D"imeti vsak."00
	asc	"Plaz je bil zares ogromen, v"8D"njem pa hladen, hladen led, tebi"8D"zdaj ni vec resitve, zmrznil si"8D"za tisoc let."00
	asc	"Mamut je prisel do tebe, nisi se"8D"postavil v bran; rezultat je"8D"kratek, jasen : v mezgo si sedaj"8D"spestan."00
	asc	"Zela so ostra, vbodi boleci,"8D"piki cebel teh res so srbeci."00
	asc	"Da bi spustila iz tega te veka,"8D"zver krvolocna hoce cloveka."00
	asc	"Z micro si driveom na dirko"8D"prisel, zamah z zastavo, se boj"8D"je pricel ..."00
	asc	"Da si bil zadnji je kriva oprema"8D"a za tolazbo pripada ti krema."00
	asc	"Ze se slisijo koraki,"8D"hrabri Justi ze hiti."8D"Spusti jantar in pobegni,"8D"ta ga morda zadrzi."00
	asc	"Teodora ni poceni,"8D"jantar tu ti zdaj fali."8D"Noz potegne spod odeje,"8D"v prsih zdaj ti on tici."00
	asc	"Marko pride in gre s tabo, tega"8D"si lahko vesel, ce ga bos drzal"8D"ob sebi, dobro bos pomoc imel."00
	asc	"Skoraj si ze bil na koncu, te"8D"nesreca doleti, posast z zakoni"8D"te unici, cisto mrtev si zdaj ti"8D""00
	asc	"Spectrum greje se mocno,"8D"plaz je stopil on lahko."00
	asc	"ZX se je zdaj vkljucil,"8D"prav potiho on brni,"8D"da se skoraj ven kadi."00
	asc	"Ti gledal bi rad ko jaz bom"8D"umiral, a prav zato se ne bom"8D"resetiral."00
	asc	"Si idiot ?"00
	asc	"HELP !"00
	asc	"Kremo prinesel Ireni zeljeno,ona"8D"ponosna zdaj silno je nate, da"8D"potesi ti ljubezensko vnemo"8D"ti podarila carobne je gate."00
	asc	"Priti na jug zdaj je tezko, brez"8D"majhnega dragega kamna tu ne bo"8D"slo."00
	asc	"Eno zensko obdelal bi se,"8D"mnozice take pa ne."00
	asc	"Ker vila noce pes hoditi,"8D"poskusi vsaj konja dobiti."00
	asc	"Vino je sladko, rdece."00
	asc	"HIK ?!"00
	asc	"Brez dovoljenja ni vstopa."00
	asc	""00
	asc	"Dirk ni sezona, ceprav si v"8D"areni, sicer pa zmagas itak v"8D"nobeni."00
	asc	"Nisem tak trd, da hotel bi ti"8D"smrt."00
	asc	"Franca napades, on se boji,"8D"strazarje poklice, tebe vec ni."00
	asc	"PUFF ..."00
	asc	"Stara finta tukaj ne vzge,"8D"poskusi kaj novega se."00
	asc	"Biti moras lepo oblecen."00
	asc	"Grascaki vino so ti spili,"8D"v dar pa pismo podarili."00
	asc	"Vrag se ustrasi in zbezi,"8D"tebi vile prepusti."00
	asc	"Cesarici ob lipi se milo stori,"8D"Gregor dovoli da nosis soli."00
	asc	"Urednik ti zgodbe objavi,"8D"sadiko v zahvalo pristavi."00
	asc	"Vuk s pisanjem pohiti,"8D"pise prav kot govori."00
	asc	"Ciril Metoda ozdravi,"8D"v spomin AZBUKO podari."00
	asc	"Medoda zob boli,"8D"Ciril pri crki "A2"B"A2" visi."00
	asc	"Grascaki so vino zaplenili,"8D"tebi potovati dovolili."00
	asc	"Dobre zgodbe za "A2"NOVIZE"A2","8D"na Dunaju so boljse kot devize."00
	asc	"Metoda zob boli,"8D"Ciril pri crki "A2"B"A2" stoji."00
	asc	"Prisel si prepozno,"8D"saj to je res grozno."00
	asc	"Ura tece nic ne rece."00
	asc	"Plaz mrzel,leden te v pesti drzi"8D"na sever in jug te on ne pusti."00
	asc	"Pozrl si lobanjo in si upal"8D"vzeti mec."00
	asc	"Milica nakit zgrabila,"8D"na kraljesvo pozabila."8D""00

*------------------------------
* OBJECTS
*------------------------------

macOBJ	mac
	dfb	]1
	asc	]2
	dfb	0
	eom

tblOBJECTS
	macOBJ	O_NOTCRE;""
	macOBJ	O_CARRIED;"SINCLAIR ZX SPECTRUM"
	macOBJ	36;"zlato runo"
	macOBJ	O_NOTCRE;"zlati kip Emonca"
	macOBJ	60;"mec"
	macOBJ	83;"sol"
	macOBJ	97;"zlati kljuc v leto 2000"
	macOBJ	O_NOTCRE;"dovolilnico za tovorjenje soli"
	macOBJ	84;"lipovo sadiko"
	macOBJ	O_NOTCRE;"knjigo pripovedk"
	macOBJ	1;"ogledalo"
	macOBJ	78;"pusko"
	macOBJ	O_NOTCRE;"konja"
	macOBJ	O_NOTCRE;"kraljestvo"
	macOBJ	70;"zlati djerdan"
	macOBJ	66;"cuprijo"
	macOBJ	62;"zenske"
	macOBJ	58;"lobanjo"
	macOBJ	O_NOTCRE;"propustnico za kuzno mesto"
	macOBJ	55;"vino"
	macOBJ	O_NOTCRE;"vile"
	macOBJ	53;"sibo"
	macOBJ	8;"cuden kipec"
	macOBJ	6;"zeleno rego"
	macOBJ	32;"trnke"
	macOBJ	30;"ilirski kovanec"
	macOBJ	18;"skatlico vzigalic"
	macOBJ	O_NOTCRE;""
	macOBJ	O_NOTCRE;"harfo"
	macOBJ	O_NOTCRE;""
	macOBJ	27;"smolo"
	macOBJ	21;"situlo"
	macOBJ	O_NOTCRE;"obleko"
	macOBJ	9;"kosceno sivanko"
	macOBJ	O_CARRIED;"trafo za Spectruma"
	macOBJ	O_NOTCRE;"med"
	macOBJ	24;"les"
	macOBJ	4;"jantar"
	macOBJ	O_CARRIED;"Microdrive"
	macOBJ	O_NOTCRE;"kremo za soncenje"
	macOBJ	O_NOTCRE;"carobne Iztokove gate"
	macOBJ	16;"vremensko napoved"
	macOBJ	O_NOTCRE;"zasmoljeno runo"
	macOBJ	O_NOTCRE;"smolo v situli"
	macOBJ	14;"leden plaz"
	macOBJ	13;"hudobnega mamuta"
	macOBJ	29;"nevarnega medveda"
	macOBJ	34;"pozresno zver"
	macOBJ	33;"proteusa"
	macOBJ	O_NOTCRE;"prizgan Spectrum"
	macOBJ	28;"cebele"
	macOBJ	12;"jugozavra"
	macOBJ	44;"lopato"
	macOBJ	39;"Huna Atilo"
	macOBJ	O_NOTCRE;"Atilovo glavo"
	macOBJ	45;"lepo Ireno"
	macOBJ	41;"vabljivo Teodoro"
	macOBJ	O_NOTCRE;"harfo"
	macOBJ	50;"prstan"
	macOBJ	74;"sokola"
	macOBJ	38;"rimski kovanec"
	macOBJ	O_NOTCRE;"kraljestvo"
	macOBJ	73;"vilo Ravioilo"
	macOBJ	O_NOTCRE;"vilo na konju"
	macOBJ	O_NOTCRE;"kraljevica Marka"
	macOBJ	72;"Kosovko devojko"
	macOBJ	O_NOTCRE;"abecedo"
	macOBJ	82;"zdravilo"
	macOBJ	81;"biser"
	macOBJ	O_NOTCRE;"zdravilni kamen"
	macOBJ	80;"kavo "A2"Minas"A2
	macOBJ	79;"vreco pasulja"
	macOBJ	91;"Franca Jozefa"
	macOBJ	O_NOTCRE;"sol v glavi"
	macOBJ	20;"jelenje koze"
	macOBJ	41;"tesnilo"
	macOBJ	90;"fiting"8D
	hex	ff	; fin de table

*------------------------------
* RULES
*------------------------------

* typedef struct command_s {
*     uint8_t fcode;      /* +0 function code */
*     uint16_t wpair;     /* +1 word pair HI=word id 1, LO=word id 2*/
*     uint16_t codeloc;   /* +3 code location in the code table */
* } command_t;
* sizeof(command_t) = 5

macRUL	mac
	dfb	]1
	dw	]2
	dw	]3
	eom

tblRULES
	macRUL	CMD_PROC; $0000;     0
	macRUL	CMD_PROC; $0000;    13
	macRUL	CMD_PROC; $0000;    20
	macRUL	CMD_PROC; $0000;    27
	macRUL	CMD_PROC; $0000;    41
	macRUL	CMD_PROC; $0000;    51
	macRUL	CMD_PROC; $0000;    59
	macRUL	CMD_PROC; $0000;    66
	macRUL	CMD_PROC; $0000;    86
	macRUL	CMD_PROC; $0000;    95
	macRUL	CMD_PROC; $0000;   105
	macRUL	CMD_PROC; $0000;   113
	macRUL	CMD_PROC; $0000;   118
	macRUL	CMD_PROC; $0000;   125
	macRUL	CMD_PROC; $0000;   144
	macRUL	CMD_PROC; $0000;   156
	macRUL	CMD_PROC; $0000;   166
	macRUL	CMD_PROC; $0000;   179
	macRUL	CMD_PROC; $0000;   186
	macRUL	CMD_PROC; $0000;   193
	macRUL	CMD_CONN; $000B;   203	; VEN (1 --> 2) 
	macRUL	CMD_CONN; $000C;   209	; NOT (2 --> 1) 
	macRUL	CMD_CONN; $0003;   215	; V (2 --> 6) 
	macRUL	CMD_CONN; $0002;   221	; J (2 --> 3) 
	macRUL	CMD_CONN; $0004;   227	; Z (2 --> 24) 
	macRUL	CMD_CONN; $0006;   233	; SZ (2 --> 23) 
	macRUL	CMD_CONN; $0002;   239	; J (3 --> 34) 
	macRUL	CMD_CONN; $0008;   245	; JZ (3 --> 26) 
	macRUL	CMD_CONN; $0004;   251	; Z (3 --> 25) 
	macRUL	CMD_CONN; $0006;   257	; SZ (3 --> 24) 
	macRUL	CMD_CONN; $0004;   263	; Z (4 --> 2) 
	macRUL	CMD_CONN; $0003;   269	; V (5 --> 6) 
	macRUL	CMD_CONN; $0001;   275	; S (6 --> 5) 
	macRUL	CMD_CONN; $0002;   281	; J (6 --> 7) 
	macRUL	CMD_CONN; $0005;   287	; SV (7 --> 11) 
	macRUL	CMD_CONN; $0006;   293	; SZ (7 --> 2) 
	macRUL	CMD_CONN; $0003;   299	; V (7 --> 16) 
	macRUL	CMD_CONN; $0005;   305	; SV (8 --> 16) 
	macRUL	CMD_CONN; $0002;   311	; J (8 --> 12) 
	macRUL	CMD_CONN; $0004;   317	; Z (8 --> 26) 
	macRUL	CMD_CONN; $0006;   323	; SZ (8 --> 3) 
	macRUL	CMD_CONN; $0002;   329	; J (9 --> 10) 
	macRUL	CMD_CONN; $0008;   335	; JZ (9 --> 5) 
	macRUL	CMD_CONN; $0003;   341	; V (10 --> 15) 
	macRUL	CMD_CONN; $0004;   347	; Z (10 --> 11) 
	macRUL	CMD_CONN; $0001;   353	; S (11 --> 10) 
	macRUL	CMD_CONN; $0004;   359	; Z (11 --> 7) 
	macRUL	CMD_CONN; $0003;   365	; V (12 --> 17) 
	macRUL	CMD_CONN; $0004;   371	; Z (12 --> 8) 
	macRUL	CMD_CONN; $0002;   377	; J (15 --> 11) 
	macRUL	CMD_CONN; $0001;   383	; S (16 --> 18) 
	macRUL	CMD_CONN; $0003;   389	; V (16 --> 19) 
	macRUL	CMD_CONN; $0008;   395	; JZ (16 --> 12) 
	macRUL	CMD_CONN; $0006;   401	; SZ (16 --> 8) 
	macRUL	CMD_CONN; $0001;   407	; S (17 --> 16) 
	macRUL	CMD_CONN; $0005;   413	; SV (17 --> 19) 
	macRUL	CMD_CONN; $0007;   419	; JV (17 --> 20) 
	macRUL	CMD_CONN; $0002;   425	; J (17 --> 12) 
	macRUL	CMD_CONN; $0006;   431	; SZ (17 --> 7) 
	macRUL	CMD_CONN; $0004;   437	; Z (18 --> 15) 
	macRUL	CMD_CONN; $0002;   443	; J (18 --> 19) 
	macRUL	CMD_CONN; $0003;   449	; V (19 --> 18) 
	macRUL	CMD_CONN; $0007;   455	; JV (19 --> 20) 
	macRUL	CMD_CONN; $0001;   461	; S (20 --> 19) 
	macRUL	CMD_CONN; $0004;   467	; Z (20 --> 17) 
	macRUL	CMD_CONN; $000B;   473	; VEN (21 --> 22) 
	macRUL	CMD_CONN; $000C;   479	; NOT (22 --> 21) 
	macRUL	CMD_CONN; $0003;   485	; V (22 --> 23) 
	macRUL	CMD_CONN; $0004;   491	; Z (22 --> 27) 
	macRUL	CMD_CONN; $0001;   497	; S (23 --> 22) 
	macRUL	CMD_CONN; $0008;   503	; JZ (23 --> 28) 
	macRUL	CMD_CONN; $0004;   509	; Z (23 --> 27) 
	macRUL	CMD_CONN; $0002;   515	; J (23 --> 2) 
	macRUL	CMD_CONN; $0001;   521	; S (24 --> 28) 
	macRUL	CMD_CONN; $0001;   527	; S (25 --> 24) 
	macRUL	CMD_CONN; $0002;   533	; J (25 --> 26) 
	macRUL	CMD_CONN; $0004;   539	; Z (25 --> 29) 
	macRUL	CMD_CONN; $0005;   545	; SV (26 --> 25) 
	macRUL	CMD_CONN; $0004;   551	; Z (26 --> 30) 
	macRUL	CMD_CONN; $0003;   557	; V (27 --> 28) 
	macRUL	CMD_CONN; $0002;   563	; J (27 --> 32) 
	macRUL	CMD_CONN; $0006;   569	; SZ (28 --> 31) 
	macRUL	CMD_CONN; $0001;   575	; S (29 --> 24) 
	macRUL	CMD_CONN; $0002;   581	; J (29 --> 26) 
	macRUL	CMD_CONN; $0001;   587	; S (30 --> 32) 
	macRUL	CMD_CONN; $0005;   593	; SV (30 --> 25) 
	macRUL	CMD_CONN; $0002;   599	; J (30 --> 26) 
	macRUL	CMD_CONN; $0001;   605	; S (31 --> 22) 
	macRUL	CMD_CONN; $0002;   611	; J (31 --> 32) 
	macRUL	CMD_CONN; $0007;   617	; JV (32 --> 28) 
	macRUL	CMD_CONN; $000B;   623	; VEN (33 --> 29) 
	macRUL	CMD_CONN; $0006;   629	; SZ (35 --> 7) 
	macRUL	CMD_CONN; $0004;   635	; Z (36 --> 34) 
	macRUL	CMD_CONN; $0007;   641	; JV (36 --> 35) 
	macRUL	CMD_CONN; $0003;   647	; V (37 --> 38) 
	macRUL	CMD_CONN; $0002;   653	; J (37 --> 40) 
	macRUL	CMD_CONN; $0001;   659	; S (38 --> 37) 
	macRUL	CMD_CONN; $0002;   665	; J (38 --> 40) 
	macRUL	CMD_CONN; $0001;   671	; S (39 --> 39) 
	macRUL	CMD_CONN; $0002;   677	; J (39 --> 41) 
	macRUL	CMD_CONN; $0003;   683	; V (40 --> 38) 
	macRUL	CMD_CONN; $0007;   689	; JV (40 --> 50) 
	macRUL	CMD_CONN; $0006;   695	; SZ (40 --> 37) 
	macRUL	CMD_CONN; $0003;   701	; V (41 --> 42) 
	macRUL	CMD_CONN; $0004;   707	; Z (41 --> 39) 
	macRUL	CMD_CONN; $0001;   713	; S (42 --> 41) 
	macRUL	CMD_CONN; $0005;   719	; SV (42 --> 44) 
	macRUL	CMD_CONN; $000C;   725	; NOT (42 --> 46) 
	macRUL	CMD_CONN; $0003;   731	; V (43 --> 47) 
	macRUL	CMD_CONN; $0008;   737	; JZ (43 --> 46) 
	macRUL	CMD_CONN; $0002;   743	; J (44 --> 48) 
	macRUL	CMD_CONN; $0001;   749	; S (45 --> 41) 
	macRUL	CMD_CONN; $0005;   755	; SV (45 --> 41) 
	macRUL	CMD_CONN; $000B;   761	; VEN (46 --> 42) 
	macRUL	CMD_CONN; $0003;   767	; V (46 --> 47) 
	macRUL	CMD_CONN; $0001;   773	; S (47 --> 43) 
	macRUL	CMD_CONN; $0002;   779	; J (47 --> 46) 
	macRUL	CMD_CONN; $0001;   785	; S (48 --> 41) 
	macRUL	CMD_CONN; $0005;   791	; SV (48 --> 42) 
	macRUL	CMD_CONN; $0002;   797	; J (48 --> 50) 
	macRUL	CMD_CONN; $0008;   803	; JZ (48 --> 49) 
	macRUL	CMD_CONN; $0006;   809	; SZ (48 --> 45) 
	macRUL	CMD_CONN; $0001;   815	; S (49 --> 45) 
	macRUL	CMD_CONN; $0003;   821	; V (49 --> 48) 
	macRUL	CMD_CONN; $0002;   827	; J (49 --> 50) 
	macRUL	CMD_CONN; $0004;   833	; Z (49 --> 51) 
	macRUL	CMD_CONN; $0005;   839	; SV (50 --> 40) 
	macRUL	CMD_CONN; $0002;   845	; J (51 --> 50) 
	macRUL	CMD_CONN; $000C;   851	; NOT (51 --> 52) 
	macRUL	CMD_CONN; $000B;   857	; VEN (52 --> 51) 
	macRUL	CMD_CONN; $0001;   863	; S (53 --> 56) 
	macRUL	CMD_CONN; $0002;   869	; J (53 --> 54) 
	macRUL	CMD_CONN; $0003;   875	; V (54 --> 56) 
	macRUL	CMD_CONN; $0004;   881	; Z (54 --> 53) 
	macRUL	CMD_CONN; $0007;   887	; JV (55 --> 56) 
	macRUL	CMD_CONN; $0002;   893	; J (56 --> 57) 
	macRUL	CMD_CONN; $0004;   899	; Z (56 --> 55) 
	macRUL	CMD_CONN; $0005;   905	; SV (57 --> 59) 
	macRUL	CMD_CONN; $0005;   911	; SV (58 --> 59) 
	macRUL	CMD_CONN; $0003;   917	; V (58 --> 60) 
	macRUL	CMD_CONN; $0002;   923	; J (58 --> 57) 
	macRUL	CMD_CONN; $0004;   929	; Z (59 --> 56) 
	macRUL	CMD_CONN; $0005;   935	; SV (60 --> 61) 
	macRUL	CMD_CONN; $0004;   941	; Z (60 --> 54) 
	macRUL	CMD_CONN; $0001;   947	; S (61 --> 59) 
	macRUL	CMD_CONN; $0006;   953	; SZ (61 --> 56) 
	macRUL	CMD_CONN; $0003;   959	; V (62 --> 64) 
	macRUL	CMD_CONN; $0007;   965	; JV (62 --> 68) 
	macRUL	CMD_CONN; $000B;   971	; VEN (63 --> 64) 
	macRUL	CMD_CONN; $000C;   977	; NOT (64 --> 63) 
	macRUL	CMD_CONN; $0004;   983	; Z (64 --> 62) 
	macRUL	CMD_CONN; $0004;   989	; Z (65 --> 66) 
	macRUL	CMD_CONN; $0001;   995	; S (66 --> 65) 
	macRUL	CMD_CONN; $0002;  1001	; J (66 --> 67) 
	macRUL	CMD_CONN; $0003;  1007	; V (67 --> 66) 
	macRUL	CMD_CONN; $0002;  1013	; J (67 --> 70) 
	macRUL	CMD_CONN; $0004;  1019	; Z (67 --> 68) 
	macRUL	CMD_CONN; $0005;  1025	; SV (68 --> 66) 
	macRUL	CMD_CONN; $0003;  1031	; V (68 --> 67) 
	macRUL	CMD_CONN; $0002;  1037	; J (68 --> 69) 
	macRUL	CMD_CONN; $0004;  1043	; Z (68 --> 62) 
	macRUL	CMD_CONN; $0003;  1049	; V (69 --> 68) 
	macRUL	CMD_CONN; $0002;  1055	; J (69 --> 72) 
	macRUL	CMD_CONN; $0002;  1061	; J (70 --> 73) 
	macRUL	CMD_CONN; $0001;  1067	; S (71 --> 62) 
	macRUL	CMD_CONN; $0005;  1073	; SV (71 --> 68) 
	macRUL	CMD_CONN; $0005;  1079	; SV (72 --> 70) 
	macRUL	CMD_CONN; $0002;  1085	; J (72 --> 71) 
	macRUL	CMD_CONN; $0004;  1091	; Z (72 --> 69) 
	macRUL	CMD_CONN; $0005;  1097	; SV (73 --> 70) 
	macRUL	CMD_CONN; $0008;  1103	; JZ (73 --> 74) 
	macRUL	CMD_CONN; $0004;  1109	; Z (73 --> 72) 
	macRUL	CMD_CONN; $0003;  1115	; V (74 --> 73) 
	macRUL	CMD_CONN; $0004;  1121	; Z (74 --> 75) 
	macRUL	CMD_CONN; $0005;  1127	; SV (75 --> 72) 
	macRUL	CMD_CONN; $0002;  1133	; J (75 --> 74) 
	macRUL	CMD_CONN; $0003;  1139	; V (76 --> 77) 
	macRUL	CMD_CONN; $0002;  1145	; J (76 --> 78) 
	macRUL	CMD_CONN; $0001;  1151	; S (77 --> 76) 
	macRUL	CMD_CONN; $0002;  1157	; J (77 --> 79) 
	macRUL	CMD_CONN; $0008;  1163	; JZ (77 --> 78) 
	macRUL	CMD_CONN; $0002;  1169	; J (78 --> 79) 
	macRUL	CMD_CONN; $0004;  1175	; Z (78 --> 76) 
	macRUL	CMD_CONN; $0003;  1181	; V (79 --> 77) 
	macRUL	CMD_CONN; $0007;  1187	; JV (79 --> 80) 
	macRUL	CMD_CONN; $0008;  1193	; JZ (79 --> 81) 
	macRUL	CMD_CONN; $0006;  1199	; SZ (79 --> 78) 
	macRUL	CMD_CONN; $0005;  1205	; SV (80 --> 77) 
	macRUL	CMD_CONN; $0004;  1211	; Z (80 --> 79) 
	macRUL	CMD_CONN; $0001;  1217	; S (81 --> 79) 
	macRUL	CMD_CONN; $0003;  1223	; V (81 --> 80) 
	macRUL	CMD_CONN; $0004;  1229	; Z (81 --> 82) 
	macRUL	CMD_CONN; $0001;  1235	; S (82 --> 79) 
	macRUL	CMD_CONN; $0002;  1241	; J (82 --> 81) 
	macRUL	CMD_CONN; $0004;  1247	; Z (82 --> 83) 
	macRUL	CMD_CONN; $0001;  1253	; S (83 --> 84) 
	macRUL	CMD_CONN; $0005;  1259	; SV (83 --> 82) 
	macRUL	CMD_CONN; $0001;  1265	; S (84 --> 85) 
	macRUL	CMD_CONN; $0002;  1271	; J (84 --> 82) 
	macRUL	CMD_CONN; $0003;  1277	; V (85 --> 84) 
	macRUL	CMD_CONN; $0006;  1283	; SZ (85 --> 86) 
	macRUL	CMD_CONN; $0003;  1289	; V (86 --> 85) 
	macRUL	CMD_CONN; $0002;  1295	; J (86 --> 84) 
	macRUL	CMD_CONN; $0004;  1301	; Z (86 --> 87) 
	macRUL	CMD_CONN; $0002;  1307	; J (87 --> 86) 
	macRUL	CMD_CONN; $0004;  1313	; Z (87 --> 88) 
	macRUL	CMD_CONN; $0005;  1319	; SV (88 --> 89) 
	macRUL	CMD_CONN; $0003;  1325	; V (88 --> 87) 
	macRUL	CMD_CONN; $0001;  1331	; S (89 --> 88) 
	macRUL	CMD_CONN; $0005;  1337	; SV (89 --> 91) 
	macRUL	CMD_CONN; $0003;  1343	; V (89 --> 90) 
	macRUL	CMD_CONN; $0005;  1349	; SV (90 --> 91) 
	macRUL	CMD_CONN; $0002;  1355	; J (90 --> 89) 
	macRUL	CMD_CONN; $000C;  1361	; NOT (91 --> 92) 
	macRUL	CMD_CONN; $0002;  1367	; J (91 --> 90) 
	macRUL	CMD_CONN; $0004;  1373	; Z (91 --> 89) 
	macRUL	CMD_CONN; $000B;  1379	; VEN (92 --> 91) 
	macRUL	CMD_CONN; $0002;  1385	; J (92 --> 90) 
	macRUL	CMD_CONN; $0002;  1391	; J (93 --> 94) 
	macRUL	CMD_CONN; $0004;  1397	; Z (97 --> 98) 
	macRUL	CMD_ACTI; $0001;  1403
	macRUL	CMD_ACTI; $0001;  1414
	macRUL	CMD_ACTI; $0001;  1428
	macRUL	CMD_ACTI; $0001;  1435
	macRUL	CMD_ACTI; $0002;  1444
	macRUL	CMD_ACTI; $0002;  1452
	macRUL	CMD_ACTI; $0002;  1459
	macRUL	CMD_ACTI; $0002;  1467
	macRUL	CMD_ACTI; $0002;  1474
	macRUL	CMD_ACTI; $0002;  1484
	macRUL	CMD_ACTI; $0003;  1492
	macRUL	CMD_ACTI; $0003;  1503
	macRUL	CMD_ACTI; $0003;  1511
	macRUL	CMD_ACTI; $0003;  1518
	macRUL	CMD_ACTI; $0003;  1525
	macRUL	CMD_ACTI; $0003;  1535
	macRUL	CMD_ACTI; $0003;  1543
	macRUL	CMD_ACTI; $0004;  1550
	macRUL	CMD_ACTI; $0004;  1558
	macRUL	CMD_ACTI; $0004;  1566
	macRUL	CMD_ACTI; $0004;  1573
	macRUL	CMD_ACTI; $0005;  1580
	macRUL	CMD_ACTI; $000C;  1589
	macRUL	CMD_ACTI; $000C;  1597
	macRUL	CMD_ACTI; $1212;  1604
	macRUL	CMD_ACTI; $1212;  1615
	macRUL	CMD_ACTI; $7A14;  1629
	macRUL	CMD_ACTI; $1315;  1638
	macRUL	CMD_ACTI; $1315;  1644
	macRUL	CMD_ACTI; $1515;  1650
	macRUL	CMD_ACTI; $1615;  1656
	macRUL	CMD_ACTI; $3815;  1666
	macRUL	CMD_ACTI; $3E15;  1672
	macRUL	CMD_ACTI; $4315;  1678
	macRUL	CMD_ACTI; $5F15;  1684
	macRUL	CMD_ACTI; $1617;  1690
	macRUL	CMD_ACTI; $0E18;  1701
	macRUL	CMD_ACTI; $0F18;  1707
	macRUL	CMD_ACTI; $0F18;  1713
	macRUL	CMD_ACTI; $1018;  1719
	macRUL	CMD_ACTI; $1118;  1725
	macRUL	CMD_ACTI; $1118;  1733
	macRUL	CMD_ACTI; $1318;  1743
	macRUL	CMD_ACTI; $1318;  1749
	macRUL	CMD_ACTI; $1418;  1755
	macRUL	CMD_ACTI; $1518;  1761
	macRUL	CMD_ACTI; $1618;  1767
	macRUL	CMD_ACTI; $1718;  1773
	macRUL	CMD_ACTI; $1718;  1781
	macRUL	CMD_ACTI; $1718;  1789
	macRUL	CMD_ACTI; $1A18;  1806
	macRUL	CMD_ACTI; $1A18;  1812
	macRUL	CMD_ACTI; $1B18;  1818
	macRUL	CMD_ACTI; $1B18;  1832
	macRUL	CMD_ACTI; $1C18;  1841
	macRUL	CMD_ACTI; $1C18;  1852
	macRUL	CMD_ACTI; $1E18;  1860
	macRUL	CMD_ACTI; $1E18;  1871
	macRUL	CMD_ACTI; $2118;  1879
	macRUL	CMD_ACTI; $2118;  1887
	macRUL	CMD_ACTI; $2218;  1897
	macRUL	CMD_ACTI; $2318;  1903
	macRUL	CMD_ACTI; $3218;  1909
	macRUL	CMD_ACTI; $3218;  1917
	macRUL	CMD_ACTI; $3318;  1933
	macRUL	CMD_ACTI; $3418;  1939
	macRUL	CMD_ACTI; $3418;  1949
	macRUL	CMD_ACTI; $3818;  1957
	macRUL	CMD_ACTI; $3C18;  1963
	macRUL	CMD_ACTI; $3C18;  1971
	macRUL	CMD_ACTI; $3D18;  1988
	macRUL	CMD_ACTI; $3E18;  1994
	macRUL	CMD_ACTI; $4018;  2000
	macRUL	CMD_ACTI; $4118;  2006
	macRUL	CMD_ACTI; $4218;  2012
	macRUL	CMD_ACTI; $4318;  2018
	macRUL	CMD_ACTI; $4318;  2026
	macRUL	CMD_ACTI; $4418;  2038
	macRUL	CMD_ACTI; $4518;  2044
	macRUL	CMD_ACTI; $4618;  2050
	macRUL	CMD_ACTI; $4818;  2060
	macRUL	CMD_ACTI; $4E18;  2066
	macRUL	CMD_ACTI; $4F18;  2072
	macRUL	CMD_ACTI; $5018;  2078
	macRUL	CMD_ACTI; $5218;  2084
	macRUL	CMD_ACTI; $5318;  2090
	macRUL	CMD_ACTI; $5418;  2096
	macRUL	CMD_ACTI; $5518;  2102
	macRUL	CMD_ACTI; $5618;  2108
	macRUL	CMD_ACTI; $5718;  2114
	macRUL	CMD_ACTI; $5718;  2122
	macRUL	CMD_ACTI; $5818;  2131
	macRUL	CMD_ACTI; $5918;  2137
	macRUL	CMD_ACTI; $5B18;  2143
	macRUL	CMD_ACTI; $5E18;  2149
	macRUL	CMD_ACTI; $5F18;  2155
	macRUL	CMD_ACTI; $6018;  2161
	macRUL	CMD_ACTI; $6518;  2167
	macRUL	CMD_ACTI; $6F18;  2173
	macRUL	CMD_ACTI; $7218;  2179
	macRUL	CMD_ACTI; $7A18;  2185
	macRUL	CMD_ACTI; $1A19;  2191
	macRUL	CMD_ACTI; $1D19;  2199
	macRUL	CMD_ACTI; $1D19;  2214
	macRUL	CMD_ACTI; $2119;  2225
	macRUL	CMD_ACTI; $1A1F;  2230
	macRUL	CMD_ACTI; $0E20;  2237
	macRUL	CMD_ACTI; $0F20;  2243
	macRUL	CMD_ACTI; $0F20;  2251
	macRUL	CMD_ACTI; $1020;  2257
	macRUL	CMD_ACTI; $1220;  2265
	macRUL	CMD_ACTI; $1320;  2273
	macRUL	CMD_ACTI; $1320;  2281
	macRUL	CMD_ACTI; $1420;  2289
	macRUL	CMD_ACTI; $1520;  2295
	macRUL	CMD_ACTI; $1620;  2301
	macRUL	CMD_ACTI; $1720;  2309
	macRUL	CMD_ACTI; $1720;  2315
	macRUL	CMD_ACTI; $1A20;  2321
	macRUL	CMD_ACTI; $1A20;  2327
	macRUL	CMD_ACTI; $1B20;  2333
	macRUL	CMD_ACTI; $1C20;  2339
	macRUL	CMD_ACTI; $1E20;  2345
	macRUL	CMD_ACTI; $2120;  2351
	macRUL	CMD_ACTI; $2220;  2357
	macRUL	CMD_ACTI; $2320;  2363
	macRUL	CMD_ACTI; $3220;  2369
	macRUL	CMD_ACTI; $3320;  2375
	macRUL	CMD_ACTI; $3420;  2381
	macRUL	CMD_ACTI; $3820;  2387
	macRUL	CMD_ACTI; $3C20;  2393
	macRUL	CMD_ACTI; $3D20;  2399
	macRUL	CMD_ACTI; $3E20;  2405
	macRUL	CMD_ACTI; $4020;  2413
	macRUL	CMD_ACTI; $4120;  2419
	macRUL	CMD_ACTI; $4220;  2427
	macRUL	CMD_ACTI; $4320;  2435
	macRUL	CMD_ACTI; $4420;  2443
	macRUL	CMD_ACTI; $4520;  2449
	macRUL	CMD_ACTI; $4620;  2455
	macRUL	CMD_ACTI; $4620;  2467
	macRUL	CMD_ACTI; $4820;  2474
	macRUL	CMD_ACTI; $4E20;  2482
	macRUL	CMD_ACTI; $4F20;  2488
	macRUL	CMD_ACTI; $5020;  2494
	macRUL	CMD_ACTI; $5120;  2500
	macRUL	CMD_ACTI; $5220;  2506
	macRUL	CMD_ACTI; $5320;  2512
	macRUL	CMD_ACTI; $5320;  2520
	macRUL	CMD_ACTI; $5420;  2527
	macRUL	CMD_ACTI; $5520;  2533
	macRUL	CMD_ACTI; $5620;  2541
	macRUL	CMD_ACTI; $5720;  2549
	macRUL	CMD_ACTI; $5820;  2555
	macRUL	CMD_ACTI; $5920;  2561
	macRUL	CMD_ACTI; $5B20;  2567
	macRUL	CMD_ACTI; $5E20;  2573
	macRUL	CMD_ACTI; $5E20;  2581
	macRUL	CMD_ACTI; $5F20;  2591
	macRUL	CMD_ACTI; $6020;  2601
	macRUL	CMD_ACTI; $6520;  2607
	macRUL	CMD_ACTI; $6F20;  2613
	macRUL	CMD_ACTI; $7220;  2619
	macRUL	CMD_ACTI; $7A20;  2625
	macRUL	CMD_ACTI; $7E20;  2631
	macRUL	CMD_ACTI; $7F20;  2635
	macRUL	CMD_ACTI; $2524;  2639
	macRUL	CMD_ACTI; $2624;  2644
	macRUL	CMD_ACTI; $2724;  2649
	macRUL	CMD_ACTI; $2824;  2654
	macRUL	CMD_ACTI; $3124;  2659
	macRUL	CMD_ACTI; $3624;  2667
	macRUL	CMD_ACTI; $6124;  2670
	macRUL	CMD_ACTI; $6224;  2678
	macRUL	CMD_ACTI; $6624;  2695
	macRUL	CMD_ACTI; $0029;  2698
	macRUL	CMD_ACTI; $002A;  2700	; TOCKE (turns)
	macRUL	CMD_ACTI; $002C;  2702
	macRUL	CMD_ACTI; $002D;  2706
	macRUL	CMD_ACTI; $002F;  2714
	macRUL	CMD_ACTI; $2E30;  2720
	macRUL	CMD_ACTI; $3635;  2725
	macRUL	CMD_ACTI; $3735;  2732
	macRUL	CMD_ACTI; $3739;  2739
	macRUL	CMD_ACTI; $3A39;  2747
	macRUL	CMD_ACTI; $3A39;  2754
	macRUL	CMD_ACTI; $4039;  2761
	macRUL	CMD_ACTI; $4639;  2766
	macRUL	CMD_ACTI; $4839;  2771
	macRUL	CMD_ACTI; $4E39;  2776
	macRUL	CMD_ACTI; $6039;  2788
	macRUL	CMD_ACTI; $3C3B;  2792
	macRUL	CMD_ACTI; $3E3D;  2807
	macRUL	CMD_ACTI; $3D3F;  2815
	macRUL	CMD_ACTI; $4140;  2822
	macRUL	CMD_ACTI; $4241;  2832
	macRUL	CMD_ACTI; $4544;  2842
	macRUL	CMD_ACTI; $714A;  2854
	macRUL	CMD_ACTI; $454B;  2871
	macRUL	CMD_ACTI; $484C;  2879
	macRUL	CMD_ACTI; $5051;  2889
	macRUL	CMD_ACTI; $3253;  2899
	macRUL	CMD_ACTI; $5859;  2911
	macRUL	CMD_ACTI; $615A;  2920
	macRUL	CMD_ACTI; $7D5A;  2941
	macRUL	CMD_ACTI; $5D5C;  2960
	macRUL	CMD_ACTI; $5D5C;  2969
	macRUL	CMD_ACTI; $5E5F;  2982
	macRUL	CMD_ACTI; $5F60;  2994
	macRUL	CMD_ACTI; $5562;  3004
	macRUL	CMD_ACTI; $5562;  3017
	macRUL	CMD_ACTI; $3C63;  3023
	macRUL	CMD_ACTI; $7064;  3041
	macRUL	CMD_ACTI; $7064;  3062
	macRUL	CMD_ACTI; $7064;  3076
	macRUL	CMD_ACTI; $5067;  3087
	macRUL	CMD_ACTI; $0068;  3101	; LOOK
	macRUL	CMD_ACTI; $7369;  3103
	macRUL	CMD_ACTI; $0069;  3262	; SAVE (was 3106)
	macRUL	CMD_ACTI; $006B;  3113
	macRUL	CMD_ACTI; $006C;  3120	; LOAD
	macRUL	CMD_ACTI; $006C;  3122
	macRUL	CMD_ACTI; $006D;  3124
	macRUL	CMD_ACTI; $006D;  3129
	macRUL	CMD_ACTI; $136E;  3146
	macRUL	CMD_ACTI; $136E;  3152
	macRUL	CMD_ACTI; $156E;  3158
	macRUL	CMD_ACTI; $386E;  3164
	macRUL	CMD_ACTI; $3E6E;  3170
	macRUL	CMD_ACTI; $436E;  3176
	macRUL	CMD_ACTI; $5F6E;  3182
	macRUL	CMD_ACTI; $0073;  3188
	macRUL	CMD_ACTI; $0074;  3190
	macRUL	CMD_ACTI; $7475;  3195
	macRUL	CMD_ACTI; $7676;  3200
	macRUL	CMD_ACTI; $0E77;  3207
	macRUL	CMD_ACTI; $4277;  3217
	macRUL	CMD_ACTI; $1078;  3227
	macRUL	CMD_ACTI; $1179;  3237
	macRUL	CMD_ACTI; $7C7B;  3245
	macRUL	CMD_ACTI; $0080;  3256	; ** new ** CASE
	macRUL	CMD_ACTI; $0081;  3258	; ** new ** HOME
	macRUL	CMD_ACTI; $0082;  3260	; ** new ** DEBU(G)
	macRUL	CMD_ACTI; $002B;  3264	; ** new ** SCORE
	hex	ff	; fin de table

* All pauses of 100 (2s) are now 200 (4s)

tblFUNC
	db	FN_AT,0,FN_ANYKEY,FN_LET,25,1,FN_LET,26,1,FN_GOTO,1,FN_DESC,FN_EOF
	db	FN_AT,84,FN_ABSENT,9,FN_MESSAGE,82,FN_EOF
	db	FN_AT,28,FN_PRESENT,50,FN_MESSAGE,47,FN_EOF
	db	FN_AT,14,FN_CARRIED,49,FN_PRESENT,44,FN_DESTROY,44,FN_MESSAGE,55,FN_PLUS,30,5,FN_EOF
	db	FN_AT,14,FN_ZERO,5,FN_MESSAGE,45,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,14,FN_ABSENT,44,FN_LET,5,5,FN_EOF
	db	FN_AT,34,FN_PRESENT,47,FN_MESSAGE,48,FN_EOF
	db	FN_AT,52,FN_ZERO,15,FN_CARRIED,38,FN_MESSAGE,49,FN_PAUSE,200,FN_MESSAGE,50,FN_CREATE,39,FN_SET,15,FN_PAUSE,200,FN_DESC,FN_EOF
	db	FN_AT,52,FN_NOTZERO,15,FN_CARRIED,38,FN_MESSAGE,68,FN_EOF
	db	FN_AT,13,FN_ZERO,6,FN_MESSAGE,46,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,13,FN_ABSENT,45,FN_LET,6,5,FN_EOF
	db	FN_CHANCE,0,FN_MESSAGE,18,FN_EOF	; ** new ** AV: was 1 instead of 0
	db	FN_AT,14,FN_PRESENT,44,FN_MESSAGE,86,FN_EOF
	db	FN_AT,41,FN_NOTZERO,12,FN_CARRIED,37,FN_MESSAGE,51,FN_DESTROY,37,FN_PLUS,30,10,FN_PAUSE,250,FN_GOTO,53,FN_DESC,FN_EOF
	db	FN_AT,41,FN_NOTZERO,12,FN_NOTCARR,37,FN_MESSAGE,52,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,67,FN_CARRIED,63,FN_SWAP,63,64,FN_MESSAGE,53,FN_EOF
	db	FN_AT,59,FN_CARRIED,19,FN_SWAP,19,18,FN_MESSAGE,81,FN_PAUSE,200,FN_DESC,FN_EOF	; ** new ** AV: pause was 1s, now 4s
	db	FN_AT,81,FN_ZERO,24,FN_MESSAGE,83,FN_EOF
	db	FN_LT,29,58,FN_LET,25,0,FN_EOF
	db	FN_AT,96,FN_NOTCARR,4,FN_MESSAGE,54,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,1,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,1,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,6,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,3,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,23,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,34,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,25,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,4,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,5,FN_GOTO,6,FN_DESC,FN_EOF
	db	FN_AT,6,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,6,FN_GOTO,7,FN_DESC,FN_EOF
	db	FN_AT,7,FN_GOTO,11,FN_DESC,FN_EOF
	db	FN_AT,7,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,7,FN_GOTO,16,FN_DESC,FN_EOF
	db	FN_AT,8,FN_GOTO,16,FN_DESC,FN_EOF
	db	FN_AT,8,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,8,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,8,FN_GOTO,3,FN_DESC,FN_EOF
	db	FN_AT,9,FN_GOTO,10,FN_DESC,FN_EOF
	db	FN_AT,9,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,15,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,11,FN_DESC,FN_EOF
	db	FN_AT,11,FN_GOTO,10,FN_DESC,FN_EOF
	db	FN_AT,11,FN_GOTO,7,FN_DESC,FN_EOF
	db	FN_AT,12,FN_GOTO,17,FN_DESC,FN_EOF
	db	FN_AT,12,FN_GOTO,8,FN_DESC,FN_EOF
	db	FN_AT,15,FN_GOTO,11,FN_DESC,FN_EOF
	db	FN_AT,16,FN_GOTO,18,FN_DESC,FN_EOF
	db	FN_AT,16,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,16,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,16,FN_GOTO,8,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,16,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,20,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,7,FN_DESC,FN_EOF
	db	FN_AT,18,FN_GOTO,15,FN_DESC,FN_EOF
	db	FN_AT,18,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,19,FN_GOTO,18,FN_DESC,FN_EOF
	db	FN_AT,19,FN_GOTO,20,FN_DESC,FN_EOF
	db	FN_AT,20,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,20,FN_GOTO,17,FN_DESC,FN_EOF
	db	FN_AT,21,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,22,FN_GOTO,21,FN_DESC,FN_EOF
	db	FN_AT,22,FN_GOTO,23,FN_DESC,FN_EOF
	db	FN_AT,22,FN_GOTO,27,FN_DESC,FN_EOF
	db	FN_AT,23,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,23,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,23,FN_GOTO,27,FN_DESC,FN_EOF
	db	FN_AT,23,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,24,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,25,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,25,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,25,FN_GOTO,29,FN_DESC,FN_EOF
	db	FN_AT,26,FN_GOTO,25,FN_DESC,FN_EOF
	db	FN_AT,26,FN_GOTO,30,FN_DESC,FN_EOF
	db	FN_AT,27,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,27,FN_GOTO,32,FN_DESC,FN_EOF
	db	FN_AT,28,FN_GOTO,31,FN_DESC,FN_EOF
	db	FN_AT,29,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,29,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,30,FN_GOTO,32,FN_DESC,FN_EOF
	db	FN_AT,30,FN_GOTO,25,FN_DESC,FN_EOF
	db	FN_AT,30,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,31,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,31,FN_GOTO,32,FN_DESC,FN_EOF
	db	FN_AT,32,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,33,FN_GOTO,29,FN_DESC,FN_EOF
	db	FN_AT,35,FN_GOTO,7,FN_DESC,FN_EOF
	db	FN_AT,36,FN_GOTO,34,FN_DESC,FN_EOF
	db	FN_AT,36,FN_GOTO,35,FN_DESC,FN_EOF
	db	FN_AT,37,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,37,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,38,FN_GOTO,37,FN_DESC,FN_EOF
	db	FN_AT,38,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,39,FN_GOTO,39,FN_DESC,FN_EOF
	db	FN_AT,39,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,40,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,40,FN_GOTO,50,FN_DESC,FN_EOF
	db	FN_AT,40,FN_GOTO,37,FN_DESC,FN_EOF
	db	FN_AT,41,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,41,FN_GOTO,39,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,44,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,46,FN_DESC,FN_EOF
	db	FN_AT,43,FN_GOTO,47,FN_DESC,FN_EOF
	db	FN_AT,43,FN_GOTO,46,FN_DESC,FN_EOF
	db	FN_AT,44,FN_GOTO,48,FN_DESC,FN_EOF
	db	FN_AT,45,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,45,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,46,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,46,FN_GOTO,47,FN_DESC,FN_EOF
	db	FN_AT,47,FN_GOTO,43,FN_DESC,FN_EOF
	db	FN_AT,47,FN_GOTO,46,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,50,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,49,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,45,FN_DESC,FN_EOF
	db	FN_AT,49,FN_GOTO,45,FN_DESC,FN_EOF
	db	FN_AT,49,FN_GOTO,48,FN_DESC,FN_EOF
	db	FN_AT,49,FN_GOTO,50,FN_DESC,FN_EOF
	db	FN_AT,49,FN_GOTO,51,FN_DESC,FN_EOF
	db	FN_AT,50,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,51,FN_GOTO,50,FN_DESC,FN_EOF
	db	FN_AT,51,FN_GOTO,52,FN_DESC,FN_EOF
	db	FN_AT,52,FN_GOTO,51,FN_DESC,FN_EOF
	db	FN_AT,53,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,53,FN_GOTO,54,FN_DESC,FN_EOF
	db	FN_AT,54,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,54,FN_GOTO,53,FN_DESC,FN_EOF
	db	FN_AT,55,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,56,FN_GOTO,57,FN_DESC,FN_EOF
	db	FN_AT,56,FN_GOTO,55,FN_DESC,FN_EOF
	db	FN_AT,57,FN_GOTO,59,FN_DESC,FN_EOF
	db	FN_AT,58,FN_GOTO,59,FN_DESC,FN_EOF
	db	FN_AT,58,FN_GOTO,60,FN_DESC,FN_EOF
	db	FN_AT,58,FN_GOTO,57,FN_DESC,FN_EOF
	db	FN_AT,59,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,60,FN_GOTO,61,FN_DESC,FN_EOF
	db	FN_AT,60,FN_GOTO,54,FN_DESC,FN_EOF
	db	FN_AT,61,FN_GOTO,59,FN_DESC,FN_EOF
	db	FN_AT,61,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,62,FN_GOTO,64,FN_DESC,FN_EOF
	db	FN_AT,62,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,63,FN_GOTO,64,FN_DESC,FN_EOF
	db	FN_AT,64,FN_GOTO,63,FN_DESC,FN_EOF
	db	FN_AT,64,FN_GOTO,62,FN_DESC,FN_EOF
	db	FN_AT,65,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,66,FN_GOTO,65,FN_DESC,FN_EOF
	db	FN_AT,66,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,67,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,67,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,67,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,68,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,68,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,68,FN_GOTO,69,FN_DESC,FN_EOF
	db	FN_AT,68,FN_GOTO,62,FN_DESC,FN_EOF
	db	FN_AT,69,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,69,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,70,FN_GOTO,73,FN_DESC,FN_EOF
	db	FN_AT,71,FN_GOTO,62,FN_DESC,FN_EOF
	db	FN_AT,71,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,72,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,72,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,72,FN_GOTO,69,FN_DESC,FN_EOF
	db	FN_AT,73,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,73,FN_GOTO,74,FN_DESC,FN_EOF
	db	FN_AT,73,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,74,FN_GOTO,73,FN_DESC,FN_EOF
	db	FN_AT,74,FN_GOTO,75,FN_DESC,FN_EOF
	db	FN_AT,75,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,75,FN_GOTO,74,FN_DESC,FN_EOF
	db	FN_AT,76,FN_GOTO,77,FN_DESC,FN_EOF
	db	FN_AT,76,FN_GOTO,78,FN_DESC,FN_EOF
	db	FN_AT,77,FN_GOTO,76,FN_DESC,FN_EOF
	db	FN_AT,77,FN_GOTO,79,FN_DESC,FN_EOF
	db	FN_AT,77,FN_GOTO,78,FN_DESC,FN_EOF
	db	FN_AT,78,FN_GOTO,79,FN_DESC,FN_EOF
	db	FN_AT,78,FN_GOTO,76,FN_DESC,FN_EOF
	db	FN_AT,79,FN_GOTO,77,FN_DESC,FN_EOF
	db	FN_AT,79,FN_GOTO,80,FN_DESC,FN_EOF
	db	FN_AT,79,FN_GOTO,81,FN_DESC,FN_EOF
	db	FN_AT,79,FN_GOTO,78,FN_DESC,FN_EOF
	db	FN_AT,80,FN_GOTO,77,FN_DESC,FN_EOF
	db	FN_AT,80,FN_GOTO,79,FN_DESC,FN_EOF
	db	FN_AT,81,FN_GOTO,79,FN_DESC,FN_EOF
	db	FN_AT,81,FN_GOTO,80,FN_DESC,FN_EOF
	db	FN_AT,81,FN_GOTO,82,FN_DESC,FN_EOF
	db	FN_AT,82,FN_GOTO,79,FN_DESC,FN_EOF
	db	FN_AT,82,FN_GOTO,81,FN_DESC,FN_EOF
	db	FN_AT,82,FN_GOTO,83,FN_DESC,FN_EOF
	db	FN_AT,83,FN_GOTO,84,FN_DESC,FN_EOF
	db	FN_AT,83,FN_GOTO,82,FN_DESC,FN_EOF
	db	FN_AT,84,FN_GOTO,85,FN_DESC,FN_EOF
	db	FN_AT,84,FN_GOTO,82,FN_DESC,FN_EOF
	db	FN_AT,85,FN_GOTO,84,FN_DESC,FN_EOF
	db	FN_AT,85,FN_GOTO,86,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,85,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,84,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,87,FN_DESC,FN_EOF
	db	FN_AT,87,FN_GOTO,86,FN_DESC,FN_EOF
	db	FN_AT,87,FN_GOTO,88,FN_DESC,FN_EOF
	db	FN_AT,88,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,88,FN_GOTO,87,FN_DESC,FN_EOF
	db	FN_AT,89,FN_GOTO,88,FN_DESC,FN_EOF
	db	FN_AT,89,FN_GOTO,91,FN_DESC,FN_EOF
	db	FN_AT,89,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,90,FN_GOTO,91,FN_DESC,FN_EOF
	db	FN_AT,90,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,91,FN_GOTO,92,FN_DESC,FN_EOF
	db	FN_AT,91,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,91,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,92,FN_GOTO,91,FN_DESC,FN_EOF
	db	FN_AT,92,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,93,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,97,FN_GOTO,98,FN_DESC,FN_EOF
	db	FN_AT,14,FN_ABSENT,44,FN_GOTO,13,FN_LET,6,5,FN_DESC,FN_EOF
	db	FN_AT,5,FN_CHANCE,20,FN_GT,28,30,FN_LT,28,45,FN_GOTO,4,FN_DESC,FN_EOF
	db	FN_AT,14,FN_PRESENT,44,FN_MESSAGE,10,FN_EOF
	db	FN_AT,18,FN_LET,5,5,FN_GOTO,14,FN_DESC,FN_EOF
	db	FN_AT,14,FN_ABSENT,44,FN_GOTO,15,FN_DESC,FN_EOF
	db	FN_AT,14,FN_PRESENT,44,FN_MESSAGE,10,FN_EOF
	db	FN_AT,40,FN_WORN,58,FN_GOTO,39,FN_DESC,FN_EOF
	db	FN_AT,40,FN_NOTWORN,58,FN_MESSAGE,61,FN_EOF
	db	FN_AT,62,FN_MESSAGE,31,FN_PAUSE,250,FN_GOTO,61,FN_DESC,FN_EOF
	db	FN_AT,34,FN_ABSENT,47,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,13,FN_ABSENT,45,FN_GOTO,14,FN_LET,5,5,FN_DESC,FN_EOF
	db	FN_AT,34,FN_ABSENT,47,FN_GOTO,35,FN_DESC,FN_EOF
	db	FN_AT,13,FN_PRESENT,45,FN_MESSAGE,11,FN_EOF
	db	FN_AT,34,FN_PRESENT,47,FN_MESSAGE,12,FN_EOF
	db	FN_AT,61,FN_CARRIED,60,FN_GOTO,62,FN_DESTROY,60,FN_DESC,FN_EOF
	db	FN_AT,57,FN_CARRIED,18,FN_GOTO,58,FN_DESC,FN_EOF
	db	FN_AT,57,FN_NOTCARR,18,FN_MESSAGE,66,FN_EOF
	db	FN_AT,13,FN_ABSENT,45,FN_GOTO,9,FN_DESC,FN_EOF
	db	FN_AT,34,FN_ABSENT,47,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,13,FN_PRESENT,45,FN_MESSAGE,11,FN_EOF
	db	FN_AT,34,FN_PRESENT,47,FN_MESSAGE,12,FN_EOF
	db	FN_AT,10,FN_LET,5,5,FN_GOTO,14,FN_DESC,FN_EOF
	db	FN_AT,29,FN_ABSENT,46,FN_GOTO,33,FN_DESC,FN_EOF
	db	FN_AT,29,FN_PRESENT,46,FN_MESSAGE,6,FN_EOF
	db	FN_AT,36,FN_CARRIED,41,FN_CARRIED,30,FN_SWAP,41,42,FN_OK,FN_EOF
	db	FN_AT,36,FN_CARRIED,41,FN_NOTCARR,30,FN_SWAP,41,2,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_CARRIED,33,FN_PRESENT,74,FN_SWAP,74,32,FN_OK,FN_EOF
	db	FN_CARRIED,2,FN_WEAR,2,FN_OK,FN_EOF
	db	FN_CARRIED,42,FN_WEAR,42,FN_OK,FN_EOF
	db	FN_CARRIED,32,FN_WEAR,32,FN_OK,FN_EOF
	db	FN_AT,21,FN_CARRIED,32,FN_DESTROY,32,FN_GET,31,FN_OK,FN_EOF
	db	FN_CARRIED,40,FN_WEAR,40,FN_OK,FN_EOF
	db	FN_CARRIED,58,FN_WEAR,58,FN_OK,FN_EOF
	db	FN_CARRIED,14,FN_WEAR,14,FN_OK,FN_EOF
	db	FN_CARRIED,70,FN_WEAR,70,FN_OK,FN_EOF
	db	FN_CARRIED,30,FN_CARRIED,31,FN_DESTROY,30,FN_SWAP,31,43,FN_OK,FN_EOF
	db	FN_CARRIED,22,FN_DROP,22,FN_OK,FN_EOF
	db	FN_CARRIED,25,FN_DROP,25,FN_OK,FN_EOF
	db	FN_CARRIED,60,FN_DROP,60,FN_OK,FN_EOF
	db	FN_CARRIED,24,FN_DROP,24,FN_OK,FN_EOF
	db	FN_NOTAT,16,FN_CARRIED,23,FN_DROP,23,FN_OK,FN_EOF
	db	FN_AT,16,FN_CARRIED,23,FN_DESTROY,23,FN_GET,41,FN_INVEN,FN_EOF
	db	FN_CARRIED,2,FN_DROP,2,FN_OK,FN_EOF
	db	FN_CARRIED,42,FN_DROP,42,FN_OK,FN_EOF
	db	FN_CARRIED,33,FN_DROP,33,FN_OK,FN_EOF
	db	FN_CARRIED,32,FN_DROP,32,FN_OK,FN_EOF
	db	FN_CARRIED,31,FN_DROP,31,FN_OK,FN_EOF
	db	FN_NOTAT,36,FN_CARRIED,30,FN_DROP,30,FN_OK,FN_EOF
	db	FN_NOTAT,36,FN_CARRIED,43,FN_DROP,43,FN_OK,FN_EOF
	db	FN_AT,36,FN_CARRIED,43,FN_MESSAGE,1,FN_PLUS,30,5,FN_PAUSE,250,FN_GOTO,37,FN_DESTROY,43,FN_DESC,FN_EOF
	db	FN_CARRIED,1,FN_DROP,1,FN_OK,FN_EOF
	db	FN_CARRIED,49,FN_DROP,49,FN_OK,FN_EOF
	db	FN_PRESENT,45,FN_CARRIED,34,FN_DESTROY,45,FN_DESTROY,34,FN_MESSAGE,3,FN_PLUS,30,5,FN_EOF
	db	FN_ABSENT,45,FN_CARRIED,34,FN_DESTROY,34,FN_MESSAGE,4,FN_EOF
	db	FN_PRESENT,46,FN_CARRIED,35,FN_DESTROY,46,FN_DESTROY,35,FN_MESSAGE,5,FN_EOF
	db	FN_ABSENT,46,FN_CARRIED,35,FN_DROP,35,FN_OK,FN_EOF
	db	FN_PRESENT,47,FN_CARRIED,48,FN_DESTROY,47,FN_DESTROY,48,FN_MESSAGE,9,FN_EOF
	db	FN_ABSENT,47,FN_CARRIED,48,FN_DROP,48,FN_OK,FN_EOF
	db	FN_NOTAT,37,FN_CARRIED,26,FN_DROP,26,FN_OK,FN_EOF
	db	FN_AT,37,FN_CARRIED,26,FN_SWAP,26,57,FN_MESSAGE,27,FN_EOF
	db	FN_CARRIED,37,FN_DROP,37,FN_OK,FN_EOF
	db	FN_CARRIED,38,FN_DROP,38,FN_OK,FN_EOF
	db	FN_NOTAT,43,FN_CARRIED,54,FN_DROP,54,FN_OK,FN_EOF
	db	FN_AT,43,FN_CARRIED,54,FN_DESTROY,54,FN_CREATE,3,FN_PLUS,30,5,FN_OK,FN_PAUSE,200,FN_DESC,FN_EOF
	db	FN_CARRIED,52,FN_DROP,52,FN_OK,FN_EOF
	db	FN_PRESENT,55,FN_CARRIED,39,FN_SWAP,39,40,FN_MESSAGE,60,FN_EOF
	db	FN_ABSENT,55,FN_CARRIED,39,FN_DROP,39,FN_OK,FN_EOF
	db	FN_CARRIED,40,FN_DROP,40,FN_OK,FN_EOF
	db	FN_NOTAT,95,FN_CARRIED,3,FN_DROP,3,FN_OK,FN_EOF
	db	FN_AT,95,FN_CARRIED,3,FN_DESTROY,3,FN_MESSAGE,43,FN_PAUSE,250,FN_PLUS,30,5,FN_GOTO,96,FN_DESC,FN_EOF
	db	FN_CARRIED,57,FN_DROP,57,FN_OK,FN_EOF
	db	FN_CARRIED,58,FN_DROP,58,FN_OK,FN_EOF
	db	FN_CARRIED,16,FN_DROP,16,FN_OK,FN_EOF
	db	FN_CARRIED,15,FN_DROP,15,FN_OK,FN_EOF
	db	FN_CARRIED,59,FN_DROP,59,FN_OK,FN_EOF
	db	FN_NOTAT,71,FN_CARRIED,14,FN_DROP,14,FN_OK,FN_EOF
	db	FN_AT,71,FN_DESTROY,14,FN_CREATE,61,FN_MESSAGE,88,FN_PAUSE,200,FN_DESC,FN_EOF
	db	FN_CARRIED,61,FN_DROP,61,FN_OK,FN_EOF
	db	FN_CARRIED,12,FN_DROP,12,FN_OK,FN_EOF
	db	FN_CARRIED,63,FN_SWAP,63,12,FN_CREATE,62,FN_MESSAGE,33,FN_EOF
	db	FN_CARRIED,65,FN_DROP,65,FN_OK,FN_EOF
	db	FN_CARRIED,17,FN_DROP,17,FN_OK,FN_EOF
	db	FN_CARRIED,18,FN_DROP,18,FN_OK,FN_EOF
	db	FN_CARRIED,19,FN_DROP,19,FN_OK,FN_EOF
	db	FN_CARRIED,21,FN_DROP,21,FN_OK,FN_EOF
	db	FN_CARRIED,5,FN_DROP,5,FN_OK,FN_EOF
	db	FN_CARRIED,7,FN_DROP,7,FN_OK,FN_EOF
	db	FN_CARRIED,8,FN_DROP,8,FN_OK,FN_EOF
	db	FN_CARRIED,9,FN_DROP,9,FN_OK,FN_EOF
	db	FN_NOTAT,77,FN_CARRIED,66,FN_DROP,66,FN_OK,FN_EOF
	db	FN_AT,77,FN_CREATE,9,FN_DESTROY,66,FN_MESSAGE,78,FN_EOF
	db	FN_CARRIED,67,FN_DROP,67,FN_OK,FN_EOF
	db	FN_CARRIED,68,FN_DROP,68,FN_OK,FN_EOF
	db	FN_CARRIED,69,FN_DROP,69,FN_OK,FN_EOF
	db	FN_CARRIED,11,FN_DROP,11,FN_OK,FN_EOF
	db	FN_CARRIED,70,FN_DROP,70,FN_OK,FN_EOF
	db	FN_CARRIED,71,FN_DROP,71,FN_OK,FN_EOF
	db	FN_CARRIED,6,FN_DROP,6,FN_OK,FN_EOF
	db	FN_CARRIED,36,FN_DROP,36,FN_OK,FN_EOF
	db	FN_CARRIED,10,FN_DROP,10,FN_OK,FN_EOF
	db	FN_CARRIED,74,FN_DROP,74,FN_OK,FN_EOF
	db	FN_CARRIED,1,FN_SWAP,1,49,FN_MESSAGE,56,FN_EOF
	db	FN_PRESENT,50,FN_CARRIED,36,FN_CARRIED,26,FN_MESSAGE,7,FN_DESTROY,36,FN_DESTROY,50,FN_CREATE,35,FN_EOF
	db	FN_ABSENT,50,FN_CARRIED,36,FN_CARRIED,26,FN_DESTROY,36,FN_MESSAGE,8,FN_EOF
	db	FN_CARRIED,26,FN_MESSAGE,13,FN_EOF
	db	FN_CARRIED,49,FN_SWAP,49,1,FN_OK,FN_EOF
	db	FN_PRESENT,22,FN_GET,22,FN_OK,FN_EOF
	db	FN_NOTAT,30,FN_PRESENT,25,FN_GET,25,FN_OK,FN_EOF
	db	FN_PRESENT,60,FN_GET,60,FN_OK,FN_EOF
	db	FN_NOTAT,32,FN_PRESENT,24,FN_GET,24,FN_OK,FN_EOF
	db	FN_NOTAT,16,FN_PRESENT,41,FN_GET,41,FN_OK,FN_EOF
	db	FN_NOTAT,36,FN_PRESENT,2,FN_GET,2,FN_OK,FN_EOF
	db	FN_NOTAT,36,FN_PRESENT,42,FN_GET,42,FN_OK,FN_EOF
	db	FN_PRESENT,33,FN_GET,33,FN_OK,FN_EOF
	db	FN_PRESENT,32,FN_GET,32,FN_OK,FN_EOF
	db	FN_NOTAT,21,FN_PRESENT,31,FN_GET,31,FN_OK,FN_EOF
	db	FN_PRESENT,30,FN_GET,30,FN_OK,FN_EOF
	db	FN_PRESENT,43,FN_GET,43,FN_OK,FN_EOF
	db	FN_PRESENT,1,FN_GET,1,FN_OK,FN_EOF
	db	FN_PRESENT,49,FN_GET,49,FN_OK,FN_EOF
	db	FN_PRESENT,34,FN_GET,34,FN_OK,FN_EOF
	db	FN_PRESENT,35,FN_GET,35,FN_OK,FN_EOF
	db	FN_PRESENT,48,FN_GET,48,FN_OK,FN_EOF
	db	FN_PRESENT,26,FN_GET,26,FN_OK,FN_EOF
	db	FN_PRESENT,37,FN_GET,37,FN_OK,FN_EOF
	db	FN_PRESENT,38,FN_GET,38,FN_OK,FN_EOF
	db	FN_PRESENT,54,FN_GET,54,FN_OK,FN_EOF
	db	FN_PRESENT,52,FN_GET,52,FN_OK,FN_EOF
	db	FN_PRESENT,39,FN_GET,39,FN_OK,FN_EOF
	db	FN_PRESENT,40,FN_GET,40,FN_OK,FN_EOF
	db	FN_PRESENT,3,FN_GET,3,FN_OK,FN_EOF
	db	FN_PRESENT,57,FN_GET,57,FN_OK,FN_EOF
	db	FN_NOTAT,50,FN_PRESENT,58,FN_GET,58,FN_OK,FN_EOF
	db	FN_PRESENT,16,FN_GET,16,FN_OK,FN_EOF
	db	FN_NOTAT,66,FN_PRESENT,15,FN_GET,15,FN_OK,FN_EOF
	db	FN_NOTAT,74,FN_PRESENT,59,FN_GET,59,FN_OK,FN_EOF
	db	FN_NOTAT,70,FN_PRESENT,14,FN_GET,14,FN_OK,FN_EOF
	db	FN_PRESENT,61,FN_GET,61,FN_OK,FN_EOF
	db	FN_PRESENT,12,FN_GET,12,FN_OK,FN_EOF
	db	FN_CARRIED,12,FN_PRESENT,62,FN_SWAP,12,63,FN_DESTROY,62,FN_MESSAGE,32,FN_EOF
	db	FN_NOTCARR,12,FN_PRESENT,62,FN_MESSAGE,63,FN_EOF
	db	FN_NOTAT,72,FN_PRESENT,65,FN_GET,65,FN_OK,FN_EOF
	db	FN_PRESENT,17,FN_GET,17,FN_OK,FN_EOF
	db	FN_PRESENT,18,FN_GET,18,FN_OK,FN_EOF
	db	FN_NOTAT,55,FN_GET,19,FN_OK,FN_EOF
	db	FN_PRESENT,20,FN_GET,20,FN_OK,FN_EOF
	db	FN_PRESENT,21,FN_GET,21,FN_OK,FN_EOF
	db	FN_PRESENT,5,FN_CARRIED,7,FN_GET,5,FN_OK,FN_EOF
	db	FN_PRESENT,5,FN_NOTCARR,7,FN_MESSAGE,38,FN_EOF
	db	FN_PRESENT,7,FN_GET,7,FN_OK,FN_EOF
	db	FN_PRESENT,9,FN_NOTCARR,9,FN_GET,8,FN_OK,FN_EOF
	db	FN_NOTAT,84,FN_PRESENT,9,FN_GET,9,FN_OK,FN_EOF
	db	FN_PRESENT,66,FN_GET,66,FN_OK,FN_EOF
	db	FN_PRESENT,67,FN_GET,67,FN_OK,FN_EOF
	db	FN_PRESENT,68,FN_GET,68,FN_OK,FN_EOF
	db	FN_PRESENT,69,FN_GET,69,FN_OK,FN_EOF
	db	FN_NOTAT,78,FN_PRESENT,11,FN_GET,11,FN_OK,FN_EOF
	db	FN_AT,78,FN_PRESENT,70,FN_NOTCARR,70,FN_GET,11,FN_OK,FN_EOF
	db	FN_NOTAT,78,FN_NOTAT,80,FN_PRESENT,70,FN_GET,70,FN_OK,FN_EOF
	db	FN_PRESENT,71,FN_GET,71,FN_OK,FN_EOF
	db	FN_PRESENT,6,FN_GET,6,FN_OK,FN_EOF
	db	FN_PRESENT,36,FN_GET,36,FN_OK,FN_EOF
	db	FN_PRESENT,10,FN_GET,10,FN_OK,FN_EOF
	db	FN_PRESENT,74,FN_GET,74,FN_OK,FN_EOF
	db	FN_GET,75,FN_OK,FN_EOF
	db	FN_GET,76,FN_OK,FN_EOF
	db	FN_PRESENT,45,FN_MESSAGE,14,FN_EOF
	db	FN_PRESENT,50,FN_MESSAGE,17,FN_EOF
	db	FN_PRESENT,47,FN_MESSAGE,15,FN_EOF
	db	FN_PRESENT,51,FN_MESSAGE,16,FN_EOF
	db	FN_PRESENT,53,FN_MESSAGE,21,FN_LET,7,2,FN_EOF
	db	FN_MESSAGE,57,FN_EOF
	db	FN_AT,91,FN_MESSAGE,70,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,96,FN_CARRIED,4,FN_DESTROY,4,FN_MESSAGE,44,FN_PLUS,30,5,FN_PAUSE,250,FN_GOTO,97,FN_DESC,FN_EOF
	db	FN_MESSAGE,69,FN_EOF
	db	FN_INVEN,FN_EOF
	db	FN_TURNS,FN_EOF
	db	FN_TURNS,FN_SCORE,FN_END,FN_EOF	; ** new ** was FN_TURNS,FN_QUIT,FN_END,FN_EOF
	db	FN_MESSAGE,19,FN_PAUSE,200,FN_GOTO,100,FN_DESC,FN_EOF
	db	FN_MESSAGE,58,FN_LET,8,2,FN_EOF
	db	FN_PRESENT,44,FN_MESSAGE,20,FN_EOF
	db	FN_CARRIED,39,FN_MESSAGE,23,FN_DESTROY,39,FN_EOF
	db	FN_PRESENT,55,FN_CARRIED,39,FN_MESSAGE,24,FN_EOF
	db	FN_PRESENT,55,FN_MESSAGE,25,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_PRESENT,56,FN_WORN,40,FN_SET,12,FN_EOF
	db	FN_PRESENT,56,FN_NOTWORN,40,FN_MESSAGE,26,FN_EOF
	db	FN_CARRIED,16,FN_MESSAGE,62,FN_EOF
	db	FN_PRESENT,62,FN_MESSAGE,37,FN_EOF
	db	FN_PRESENT,65,FN_MESSAGE,36,FN_EOF
	db	FN_AT,60,FN_CARRIED,17,FN_DESTROY,17,FN_GET,4,FN_PLUS,30,5,FN_EOF
	db	FN_DESTROY,71,FN_OK,FN_EOF
	db	FN_AT,47,FN_CARRIED,52,FN_CARRIED,3,FN_DESTROY,3,FN_SET,13,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,50,FN_DESTROY,57,FN_GET,58,FN_OK,FN_EOF
	db	FN_CARRIED,57,FN_MESSAGE,29,FN_DESTROY,57,FN_EOF
	db	FN_AT,66,FN_CARRIED,16,FN_DESTROY,16,FN_GET,15,FN_OK,FN_EOF
	db	FN_AT,74,FN_CARRIED,15,FN_DESTROY,15,FN_GET,59,FN_OK,FN_EOF
	db	FN_AT,63,FN_CARRIED,61,FN_SWAP,61,12,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,65,FN_PRESENT,65,FN_MESSAGE,35,FN_PAUSE,250,FN_DESTROY,65,FN_GOTO,76,FN_PLUS,30,5,FN_DESC,FN_EOF
	db	FN_CARRIED,12,FN_MESSAGE,30,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,72,FN_CARRIED,64,FN_SWAP,64,65,FN_MESSAGE,34,FN_EOF
	db	FN_AT,55,FN_CARRIED,20,FN_DESTROY,20,FN_GET,19,FN_OK,FN_EOF
	db	FN_AT,93,FN_CARRIED,5,FN_SWAP,5,73,FN_PLUS,30,15,FN_OK,FN_EOF
	db	FN_AT,82,FN_CARRIED,68,FN_SWAP,68,67,FN_OK,FN_EOF
	db	FN_AT,91,FN_CARRIED,69,FN_NOTCARR,76,FN_NOTCARR,75,FN_MESSAGE,41,FN_DESTROY,69,FN_PLUS,30,5,FN_PAUSE,250,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,81,FN_ZERO,24,FN_CARRIED,67,FN_CREATE,66,FN_DROP,67,FN_LET,24,1,FN_PLUS,30,5,FN_MESSAGE,79,FN_EOF
	db	FN_CARRIED,11,FN_AT,87,FN_NOTZERO,14,FN_MESSAGE,40,FN_EOF
	db	FN_CARRIED,11,FN_AT,87,FN_ZERO,14,FN_MESSAGE,39,FN_CREATE,69,FN_SET,14,FN_EOF
	db	FN_AT,78,FN_CARRIED,70,FN_DESTROY,70,FN_GET,11,FN_MESSAGE,80,FN_OK,FN_EOF
	db	FN_AT,80,FN_CARRIED,71,FN_DESTROY,71,FN_GET,70,FN_OK,FN_EOF
	db	FN_AT,92,FN_CARRIED,8,FN_CREATE,7,FN_DROP,8,FN_GET,7,FN_MESSAGE,76,FN_EOF
	db	FN_NOTAT,92,FN_DROP,8,FN_OK,FN_EOF
	db	FN_AT,94,FN_CARRIED,52,FN_NOTZERO,13,FN_CREATE,3,FN_GET,3,FN_MESSAGE,42,FN_PAUSE,250,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,98,FN_CARRIED,6,FN_CARRIED,73,FN_WORN,2,FN_GT,29,57,FN_DESTROY,6,FN_ANYKEY,FN_PLUS,30,5,FN_GOTO,99,FN_DESC,FN_EOF
	db	FN_AT,98,FN_CARRIED,6,FN_WORN,42,FN_MESSAGE,0,FN_PAUSE,250,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,98,FN_CARRIED,6,FN_NOTWORN,2,FN_NOTWORN,42,FN_MESSAGE,73,FN_EOF
	db	FN_CARRIED,19,FN_MESSAGE,64,FN_PAUSE,200,FN_MESSAGE,65,FN_DESTROY,19,FN_LET,25,0,FN_EOF
	db	FN_DESC,FN_EOF			; DESC ($0068)
	db	FN_SCORE,FN_OK,FN_EOF		; SAVE LAZA ($7369)
	db	FN_ATLT,93,FN_LT,28,30,FN_SAVE,FN_EOF	; SAVE ($0069)
	db	FN_MESSAGE,71,FN_PAUSE,150,FN_MESSAGE,72,FN_EOF	; CIRA/SEDI
	db	FN_LOAD,FN_EOF			; LOAD ($006C)
	db	FN_LOAD,FN_EOF			; LOAD ($006C)
	db	FN_NOTZERO,8,FN_MESSAGE,59,FN_EOF
	db	FN_NOTZERO,7,FN_PRESENT,53,FN_MESSAGE,22,FN_DESTROY,53,FN_CREATE,54,FN_PLUS,30,5,FN_PAUSE,200,FN_DESC,FN_EOF
	db	FN_WORN,2,FN_REMOVE,2,FN_OK,FN_EOF
	db	FN_WORN,42,FN_REMOVE,42,FN_OK,FN_EOF
	db	FN_WORN,32,FN_REMOVE,32,FN_OK,FN_EOF
	db	FN_WORN,40,FN_REMOVE,40,FN_OK,FN_EOF
	db	FN_WORN,58,FN_REMOVE,58,FN_OK,FN_EOF
	db	FN_WORN,14,FN_REMOVE,14,FN_OK,FN_EOF
	db	FN_WORN,70,FN_REMOVE,70,FN_OK,FN_EOF
	db	FN_SCORE,FN_EOF
	db	FN_LET,26,1,FN_OK,FN_EOF
	db	FN_LET,26,0,FN_OK,FN_EOF
	db	FN_LT,29,60,FN_LET,25,0,FN_EOF
	db	FN_AT,30,FN_CARRIED,22,FN_DESTROY,22,FN_GET,25,FN_OK,FN_EOF
	db	FN_AT,70,FN_CARRIED,59,FN_DESTROY,59,FN_GET,14,FN_DESC,FN_EOF
	db	FN_AT,32,FN_PRESENT,25,FN_DESTROY,25,FN_GET,24,FN_OK,FN_EOF
	db	FN_CARRIED,24,FN_PRESENT,23,FN_GET,23,FN_OK,FN_EOF
	db	FN_AT,54,FN_CARRIED,21,FN_DESTROY,21,FN_CREATE,20,FN_MESSAGE,75,FN_EOF
	db	FN_CASE,FN_EOF	; ** new ** CASE
	db	FN_HOME,FN_EOF	; ** new ** HOME
	db	FN_DEBUG,FN_EOF	; ** new ** DEBU(G)
	db	FN_SAVE,FN_EOF	; ** new ** easier SAVE
	db	FN_SCORE,FN_EOF	; ** new ** easier SCORE
	
*------------------------------
* SYS_MESSAGES
*------------------------------

tblSYSMESSAGES
	asc	8D"Temno je."00
	asc	8D"Vidim tudi:"00
	asc	8D"Ukazuj, o gospodar!"00
	asc	8D"Kaj naj storim?"00
	asc	8D"Pohiti z ukazom."00
	asc	8D"Kako naprej?"00
	asc	8D"Za to nisem programiran."00
	asc	8D"V to smer ne morem."00
	asc	8D"Tega niti Iskra Delta Triglav"8D"ne bi zmogel."00
	asc	8D"Prenasam "00
	asc	" (oblecen)"00
	asc	"ne nicesar."00	; Prenesam + ne nicesar.
	asc	8D"Kaj si res obupal "00
	asc	8D"Bi morda ponovno poskusil sreco "00
	asc	8D"Strahopetec!"00
	asc	8D"OK."00
	asc	8D"Potlaci neko radirko,"8D"pa bova nadaljevala."00
	asc	8D"Dal si ukazov: "00	; ** new ** Simplify plural management (c) Janez
**	asc	8D"Dal si "00
	asc	" ukaz"00
	asc	"ov"00	; plural
	asc	". "00
	asc	8D"Nabral si "00
	asc	"%"00
	asc	8D"Tega sploh ne prenasam."00
	asc	8D"Obe roki imam polni."00
	asc	8D"To ze imam!"00
	asc	8D"Tega ne vidim tukaj."00
	asc	8D"Pretezko je!"00
	asc	8D"Tega nimam v rokah."00
	asc	8D"To pa ze imam na sebi!"00
	asc	"D"00
	asc	"N"00
	asc	8D"Poti vodijo na: "00
	asc	8D"Ne vidim nobene poti."00
	asc	8D"Nalozi igro (predal 1-9)? "00	; ** new ** load game (slot 1-9)?
	asc	8D"Shrani igro (predal 1-9)? "00	; ** new ** save game (slot 1-9)?

*------------------------------
* WORDS
*------------------------------

* typedef struct word_s {
*     uint8_t id; +0
*     char *word; +1..+4
* } word_t;
* 

macWORD	mac
	dfb	]1
	str	]2
	eom

tblWORDS
	macWORD	1;"S"
	macWORD	1;"SEVE"
	macWORD	2;"J"
	macWORD	2;"JUG"
	macWORD	3;"V"
	macWORD	3;"VZHO"
	macWORD	4;"Z"
	macWORD	4;"ZAHO"
	macWORD	5;"SV"
	macWORD	6;"SZ"
	macWORD	7;"JV"
	macWORD	8;"JZ"
	macWORD	9;"G"
	macWORD	9;"GOR"
	macWORD	10;"D"
	macWORD	10;"DOL"
	macWORD	11;"VEN"
	macWORD	11;"IZST"
	macWORD	12;"NOT"
	macWORD	12;"NOTE"
	macWORD	12;"VSTO"
	macWORD	13;"L"
	macWORD	13;"LEVO"
	macWORD	13;"DESN"
	macWORD	14;"KIP" 
	macWORD	14;"KIPE"
	macWORD	15;"KOVA"
	macWORD	15;"DENA"
	macWORD	16;"TRNK"
	macWORD	17;"REGO"
	macWORD	17;"ZABO"
	macWORD	18;"NAPO"
	macWORD	18;"VREM"
	macWORD	19;"RUNO"
	macWORD	20;"IGLO"
	macWORD	20;"SIVA"
	macWORD	21;"OBLE"	; DRESS
	macWORD	21;"NATA"
	macWORD	22;"SITU"
	macWORD	22;"POSO"
	macWORD	23;"SMOL"
	macWORD	23;"ZASM"
	macWORD	24;"DAJ" 
	macWORD	24;"VRZI"
	macWORD	24;"SPUS"
	macWORD	24;"ODLO"
	macWORD	25;"PRIZ"
	macWORD	25;"VKLJ"
	macWORD	26;"ZX"
	macWORD	26;"SPEC"
	macWORD	26;"SINC"
	macWORD	26;"RACU"
	macWORD	27;"TRAF"
	macWORD	27;"TRAN"
	macWORD	28;"MED" 
	macWORD	29;"OGEN"
	macWORD	30;"PROT"
	macWORD	30;"CLOV"
	macWORD	31;"UGAS"
	macWORD	31;"IZKL"
	macWORD	32;"VZEM"	; TAKE
	macWORD	32;"POBE"
	macWORD	32;"UKRA"
	macWORD	33;"VZIG"
	macWORD	33;"SIBI"
	macWORD	34;"JANT"
	macWORD	35;"MCD" 
	macWORD	35;"MICR"
	macWORD	35;"MIKR"
	macWORD	36;"UBIJ"
	macWORD	36;"NAPA"
	macWORD	37;"MAMU"
	macWORD	38;"CEBE"
	macWORD	39;"ZVER"
	macWORD	40;"JUGO"
	macWORD	41;"I"	; INVENTORY
	macWORD	41;"INVE"
	macWORD	254;"CAS"	; TIME was 43
	macWORD	42;"KORA"	; TURN was 43
	macWORD	42;"UKAZ"	; TURN was 43
	macWORD	43;"REZU"	; SCORE
	macWORD	43;"TOCK"	; SCORE
	macWORD	44;"KONE"	; QUIT
	macWORD	45;"FUK" 
	macWORD	45;"JEBI"
	macWORD	45;"KURA"
	macWORD	45;"KURC"
	macWORD	45;"PIZD"
	macWORD	46;"LED" 
	macWORD	46;"PLAZ"
	macWORD	47;"SOS" 
	macWORD	47;"POMA"
	macWORD	47;"POMO"
	macWORD	48;"STAL"
	macWORD	49;"ATIL"
	macWORD	50;"GLAV"
	macWORD	51;"LOPA"
	macWORD	52;"KREM"
	macWORD	53;"NAMA"
	macWORD	54;"SE"
	macWORD	55;"IREN"
	macWORD	56;"GATE"
	macWORD	56;"SPOD"
	macWORD	57;"PODR"
	macWORD	57;"POFU"
	macWORD	57;"POKA"
	macWORD	57;"POJE".
	macWORD	57;"POLJ"
	macWORD	58;"TEOD"
	macWORD	59;"ZAKO"
	macWORD	60;"EMON"
	macWORD	61;"HARF"
	macWORD	62;"PRST"
	macWORD	63;"ZAIG"
	macWORD	64;"ZENS"
	macWORD	64;"ZENE"
	macWORD	65;"CUPR"
	macWORD	65;"GRAD"
	macWORD	66;"SOKO"
	macWORD	66;"PTIC"
	macWORD	67;"DJER"
	macWORD	67;"NAKI"
	macWORD	68;"KRAL"
	macWORD	69;"KONJ"
	macWORD	70;"VILO"
	macWORD	71;"MARK"
	macWORD	72;"DEVO"
	macWORD	73;"CARJ"
	macWORD	74;"ZBUD"
	macWORD	75;"ZAJA"
	macWORD	75;"JAHA"
	macWORD	76;"RESI"
	macWORD	77;"MEC" 
	macWORD	78;"LOBA"
	macWORD	79;"PROP"
	macWORD	80;"VINO"
	macWORD	81;"VILE"
	macWORD	82;"SIBO"
	macWORD	83;"SOL" 
	macWORD	83;"NACL"
	macWORD	84;"DOVO"
	macWORD	85;"LIPO"
	macWORD	85;"DREV"
	macWORD	86;"PRIP"
	macWORD	87;"ABEC"
	macWORD	87;"AZBU"
	macWORD	88;"LADJ"
	macWORD	88;"ZDRA"
	macWORD	89;"BISE"
	macWORD	90;"OZDR"
	macWORD	90;"POZD"
	macWORD	91;"KAME"
	macWORD	92;"USTR"
	macWORD	93;"KOZO"
	macWORD	94;"PUSK"
	macWORD	95;"KAVO"
	macWORD	96;"PASU"
	macWORD	96;"VREC"
	macWORD	97;"FRAN"
	macWORD	98;"POSA"
	macWORD	99;"ODKO"
	macWORD	100;"ODKL"
	macWORD	101;"KLJU"
	macWORD	102;"ME"
	macWORD	103;"PIJ" 
	macWORD	103;"POPI"
	macWORD	104;"OPIS"
	macWORD	104;"GLEJ"
	macWORD	104;"POGL"	; LOOK
	macWORD	105;"SAVE"	; SAVE
	macWORD	107;"CIRA"
	macWORD	107;"SEDI"
	macWORD	108;"LOAD"	; LOAD
	macWORD	109;"DA"
	macWORD	110;"SLEC"
	macWORD	110;"SNEM"
	macWORD	111;"LES" 
	macWORD	112;"VRAT"
	macWORD	113;"LAZA"
	macWORD	114;"OGLE"
	macWORD	115;"SCRE"
	macWORD	115;"EKRA"
	macWORD	116;"RISI"
	macWORD	117;"NE"
	macWORD	118;"KAJ" 
	macWORD	118;"KDO" 
	macWORD	118;"KAKO"
	macWORD	118;"ZAKA"
	macWORD	118;"KOGA"
	macWORD	119;"PROD"
	macWORD	120;"KUPI"
	macWORD	121;"UJEM"
	macWORD	122;"KOZE"
	macWORD	123;"UDAR"
	macWORD	124;"VRAG"
	macWORD	125;"METO"
	macWORD	126;"TESN"
	macWORD	127;"FITI"
	macWORD	128;"CASE"	; ** new ** upper/lower case
	macWORD	129;"HOME"	; ** new ** top of screen on new location
	macWORD	130;"DEBU"	; ** new ** debug on/off
	macWORD	255;"_"
