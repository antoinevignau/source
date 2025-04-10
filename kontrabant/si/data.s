*
* Kontrabant
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
FN_TRANSLATE	=	31 + CMD_ACT + CMD_NOPARS

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

*-------------- OBJECTS

O_NOTCRE	=	252
O_WORN	=	253
O_CARRIED	=	254

MAXCARR	=	10	; was originally 6
NUMOBJECTS	=	56

LIGHTOBJ	=	0

*-------------- PARSER

WORD_ABSENT	=	$00
WORD_UNKNOWN	=	$ff
SIZEOF_WORDS	=	5

*-------------- RULES

NUM_RULES	=	759
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

NWORDS	=	152

*------------------------------
* LOCATIONS
*------------------------------

*		123456789012345678901234567890123456789

strTOINET	dfb	15
	asc	"Kontrabant"8D8D
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

*	dfb	64,91,92,93,94,96,123,124,125,126
*	asc	"@[\]^`{|}~"

tblLOCATIONS
	asc	"DOBRODO[LI V PRVI SLOVENSKI"8D"PUSTOLOV[^INI !!!"8D8D"Cilj igre vam je znan."8D"Ra~unalnik vas bo vodil po"8D"znanih in neznanih krajih, vi pa"8D"mu v preprosti sloven{~ini"8D"svetujte,kaj naj dela."8D
	ASC	"Ne obupajte prehitro, tudi midva"8D"potrebujeva nekaj ur, da re~"8D"kon~ava, in to ob zemljevidu"8D"in scenariju."8D"Vse,kar se zgodi,ima svoj namen."8D8D"^im dalj{o zabavo Vam `elita:"8D8D
	ASC	"Turk @iga  in"8D"Kmet Matev`"8D8D"P.S. Najbolj{e ~akajo nagrade!"00
	asc	"@ivljenje postaja v letih"8D"suhih krav vedno bolj"8D"dolgo~asno."8D"Televizija ponavja stare filme,"8D"na radiju sama `alost,"8D"da o novicah v ~asopisih niti"8D"ne govorimo."8D8D
	ASC	"EDINA RE[ITEV JE,DA SI TUDI TI"8D"NAJDE[ TV, KASETOFON in"8D"MIKRORA^UNALNIK."8D8D"EDINA pot vodi VEN v {irni svet."00
	asc	"Stoji{ na Evropsko znanem"8D"kri`i{~u nekje na sredi"8D"Ljubljane.V vse smeri vodijo"8D"{iroke moderne {estpasovnice."8D"Pribli`a se ti starej{i mo`."00
	asc	"Si na hribu.Tam je tudi prijetna"8D"gostilnica,pred katero sedi"8D"~lovek z velikimi brki"8D"in te prosi za kozar~ek ruma."8D"Poti vodijo na V,S in SZ."00
	asc	"Vstopil si v osmo barako"8D"velikega kontracepcijskega"8D"tabori{~a.Vse naokrog je polno"8D"{tudentov,izhodi pa vodijo na"8D"SV,J in DOL."00
	asc	"Do kolen ti sega smrdljiva"8D"mo~virnata voda,zelo te zebe v"8D"noge,zato bi rad ~imprej u{el"8D"od tod.V daljavi vidi{ veliko"8D"belo stavbo,na kateri pi{e:"8D"....... PA@ARNA ABRAMBA"8D"Poti vodijo na S,J,V in JZ."00
	asc	"Si v veliki tovarni,kjer smrdi"8D"po kremah za ~evlje,{amponih in"8D"parafinu."00
	asc	"V somraku vidi{ veliko"8D"zapu{~enih nagrobnikov,eden od"8D"njih le`i celo na tleh.Vzdu{je"8D"je zelo grozljivo.Pe{~ene potke"8D"vodijo na S,Z in JZ."00
	asc	"Okoli tebe so velika polja.Kmet,"8D"ki orje z ra~unalni{ko vodenim"8D"plugom,ti pravi:"8D"Hg + Au = amalgam za plombe"8D"Kolovoza vodita na S in V."00
	asc	"Stoji{ pred sodobno tovarno,"8D"okrog katere se igrajo veseli"8D"dojen~ki.Varnostnik ti poka`e"8D"poti,ki vodita na S in J."00
	asc	"Pred neko hiso sedi Turek,"8D"zasvojen z LSD-jem,in mrmra"8D"predse: VEM PA NE POVEM,VEM PA"8D"NE POVEM ... Ozke ulice vodijo"8D"na J,Z,S in JV."00
	asc	"Zavita v skrivnostno meglico"8D"se pred tabo dviga slavna"8D"tovarna SPARK. V njej pravkar"8D"razvijajo nov mikrora~unalnik-"8D"HR 1884. Pomagaj jim,pa dobi{"8D"enega! Poti vodijo na V in JV."00
	asc	"Si v smrtnem kranju na{ega"8D"velikega pesnika,ki ves pre{eren"8D"hodi okrog tebe in ti govori :"8DA2"[e me bo{ rabil!"A2"Slabe ceste"8D"vodijo na V,Z in JV."00
	asc	"Mesto,v katerem si,je slavnostno"8D"okra{eno,saj se `eni `upanova"8D"Micka z nekim Mati~kom.V neki"8D"stavbi je seminar za"8D"ra~unalni{ke programerje."8D"Vsi so silno pametni, zato je"8D
	ASC	"najbolje, da se odstranis na JZ"8D"ali V."00
	asc	"Pri{el si v svetovno znano"8D"letovi{~e,kjer se lahko"8D"odpo~ije{.V smeri proti Z vidi{"8D"oto~ek sredi jezera.Izhodi so na"8D"SV,S in SZ."00
	asc	"Si na oto~ku.Tam je cerkvica,ki"8D"so jo v~asih oskrbovale nune."8D"Mnogo povesti se dogaja na tem"8D"oto~ku. Vidi{ tudi zvon `elja."00
	asc	"Pred tabo je izposojevalnica"8D"~olnov.Pred njo trdno spi debeli"8D"paznik.Izhodi so na J,JV in SV"8D"(iz SV vidis v daljavi nekaj"8D"svetlega,vendar to ni"8D"prihodnost)."00
	asc	"Blesk iz tovarne,kjer delajo z"8D"velikim ELANom te zaslepi."8D"Travniki se razprostirajo na V,"8D"J in JZ."00
	asc	"Si v sredi{~u kranjske"8D"kontrabantarske obrti. ^evlje"8D"znajo delati sami,ostalo pa"8DA2"U GOR KOPLEJO"A2".Gorske poti"8D"vodijo na J,S,Z."00
	asc	"V silovitem hrupu vzletajo pred"8D"tvojimi o~mi letala z letali{~a,"8D"ki je drugo najve~je na svetu za"8D"mariborskim."00
	asc	"Si v slovenskem velemestu"8D"Skalniku.Delavec v tamkaj{nji"8D"tovarni [PAGASVIL ti pravi:"8DA2"Kravata ni copata;kravata je za"8D"okrog vrata!"A28D"^e ho~e{ stran,pojdi na V ali Z."00
	asc	"V nosnice ti prodira prijeten"8D"vonj po starih mastnih krofih."8D"Pun~ka pa re~e:"A2"Peter mi je"8D"reku,da to vsak dan je za"8D"ve~erjo"A2".^e ti smrdijo,pojdi"8D"na V ali Z."00
	asc	"Pred tabo se razprostirajo"8D"velika polja zelenega zlata.Iz"8D"njega pridobivajo najbolj{a piva"8D"pri nas.Poljske poti vodijo na"8D"V,Z in J."00
	asc	"Si na celjskem gradu,kjer zrak"8D"zaradi vi{ine niti ni tako slab."8D"V sobi stoji velik oklep.Ozke,"8D"strme steze vodijo na Z in DOL."00
	asc	"Pri{el si v Celje,mesto zlatarn."8D"Zrak je mo~no onesna`en,zato"8D"pazi!^istej{i zrak je na S,SV,V"8D"in zGORaj."00
	asc	"Vidi{ veliko tovarno,ki je vsa v"8D"dolgovih.V tovarni imajo {e"8D"nekaj licen~nih televizorjev,"8D"vendar pa ho~ejo za njih"8D"~ekovno knji`ico.Odide{ lahko"8D"le na J."00
	asc	"Si v ponosu Malboro-ja, v"8D"Mariboru."8D"Po vo`nji z metrojem pride{ na"8D"kviz,kjer te vpra{ajo:"8DA2"Kaj je hkrati RDE^E in ^RNO ?"A2""00
	asc	"Si v majhnem mestecu na vzhodu."8D"Tam je ~lovek,ki ima mnogo"8D"sorodnikov.Zato se tudi pohvali:"8DA2"Strici so mi povedali,da je"8D"treba brade negovati !"A2""00
	asc	"Pred tabo stoji slavna utrdba"8D"dr. Roglja,kjer se zdravijo"8D"ra~unalni{ki zasvojenci in tisti"8D"s celulozo jeter.Tudi Kovi"8D"Jani~i~ gre gor na ...Urejene"8D"stezice vodijo na S,V,JZ,JV in"8D"Z."00
	asc	"Si v studijih velikega radia,"8D"kjer vsak dan oddajajo mleko."8D"V studiu le`i nekaj zapitih"8D"tehnikov: Ciril in Metod ter"8D"Miki Mi{ko. Tu gre vse bolj na"8D"CIRA CARA.Pobegne{ lahko le GOR"8D"po stopnicah."00
	asc	"Pred seboj vidi{ znani klanec"8D"siromakov.Na vrhu klanca sedi"8D"mati in v roki dr`i skodelico"8D"kave,ki jo {verca nek Martin"8D"Razrite makadamske ceste"8D"vodijo na SV,JZ in V."00
	asc	"Si pred vhodom v tehni~ni muzej."8D"Da ne bo{ kaj pokvaril,pojdi"8D"na S,V in Z."00
	asc	"Pri{el si do carinarnice na"8D"Ljubelju.Takoj za zapornico je"8D"dolg,temen tunel.^e no~e{ iti"8D"tja,gre{ lahko {e na J."00
	asc	"Povsod iz tal brizga vrela voda,"8D"kjer pa te ni,je nasajena vinska"8D"trta.Klima je ugodna in primerna"8D"za po~itek.Izhodi so na S in J."00
	asc	"Prispel si do znanega"8D"tekstilnega sredi{~a,kjer"8D"izdelujejo sodobna obla~ila `e"8D"od starej{e kamene dobe naprej."8D"Cesta vodi v smeri S-J."00
	asc	"V jederski elektrarni je sli{ati"8D"le tiho {umenje strojev in"8D"preklapljanje relejev.Kar"8D"naenkrat pa zasli{i{ alarm.Na"8D"kontrolni mizi pred tabo se"8D"zasveti 7 gumbov.Katerega bo{"8D
	ASC	"pritisnil???"8D"1   2   3   4   5   6   7"8D"oo  oo  oo  oo  oo  oo  oo"8D"oo  oo  oo  oo  oo  oo  oo"00
	asc	"Si v slovenskem New Yorku.Vidi{"8D"zara{~enega umetnika,ki izdeluje"8D"slike. Pravi,da bi se mu"8D"prilegel po`irek hladnega piva."8D"Poti peljejo na V,Z,S in J."00
	asc	"V mestu,ki ima prvo jedersko"8D"elektrarno pri nas,nima{ kaj"8D"po~eti,zato pojdi na S,V ali Z."00
	asc	"Si v Zabregu na Velesajmu."8D"Prinesi ra~unalnik,"8D"pa dobi{ sesalnik."8D"Odide{ lahko na S,J,V,SV in Z."00
	asc	"Mesto,v katerem si,se pona{a z"8D"ogromno tovarno lesenih pali~ic"8D"z rde~imi glavicami.Nad vhodom v"8D"tovarno je napis:"8D"TREBAT ^E[ NAS !!!"8D"Asfaltirane ceste peljejo proti"8D"J,V in Z."00
	asc	"Si v belem mestu,prestolnici"8D"na{e domovine.Na S je veliko"8D"poslopje paragrafov.Povej"8D"pravo valuto in vstopi ali pa"8D"pojdi na Z,S ali J."00
	asc	"@e od dale~ vidi{ Vu~ka,ki pazi"8D"na{e edino (zaenkrat)"8D"olimpijsko mesto."8D"Skoraj neprehodne"8D"potke vodijo na S,JV,J in V."00
	asc	"Si v mestu,kjer nikoli ne"8D"zmanjka Morave."8D"Vsi v mestu poslu{ajo"8D"(brrrr) eno,ki pravi, da je zelo"8D"lepa."8D"Ulice gredo v smeri S,J,Z in"8D"NOTER v ???"00
	asc	"Si pred prijetno kafano."8D"Vsi v njej so nori na kavo in jo"8D"na veliko menjajo za kasetarje."8D"Vrne{ se lahko le VEN."00
	asc	"Pri{el si v znano"8D"sla{~i~arsko sredi{~e."8D"Iz Z prijetno di{i."8D"Izhodi so {e na S,SZ in J."00
	asc	"Povsod okrog tebe so same ~rne"8D"gore."8D"Poti vodijo na V in S."00
	asc	"Si v mestu,skozi katerega te~e"8D"izredno ~ista reka.Smrad te bo"8D"slej ali prej pregnal na S ali"8D"SZ."00
	asc	"Stoji{ sredi mra~nega gozda.Od"8D"dale~ se sli{i tuljenje volkov"8D"in medvedov.Tvoje mo`nosti za"8D"re{itev so minimalne.Potke med"8D"drevesi vodijo na J in Z."00
	asc	"Mestece,v katerem si,slovi po"8D"suhi robi.Najbolj{i so njihovi"8D"sodi.Urban ti pravi:"8DA2"Dam ti izdelek za surovino!"A28D"Ceste gredo proti V,JV in SZ."00
	asc	"Vse okrog tebe di{i po pra`enem"8D"je~menu,saj je v mestu ena od"8D"najbolj{ih pivovarn na svetu."8D"Odide{ lahko na S in J."00
	asc	"Na majhni vzpetinici stoji"8D"spomenik znanemu tihotapcu"8D"knjig.[e danes se da tu dobiti"8D"marsikaj zanimivega,saj"8D"tukaj{nji ljudje za~asno delajo"8D"v tujini.Kolovozi vodijo na SZ"8D"in JV."00
	asc	"Na pragu rojstne hi{e sedi"8D"Desnstik in ti pravi:"8DA2"Pojdi od Litije do ^ate`a,pa"8D"bo{ do`ivel mnogo zanimivega!"A28D"Kri`i{~e po diagonalah."00
	asc	"Bajka pravi,da so na hribu,kjer"8D"stoji{ nekdaj zborovale"8D"~arovnice.Od njih je tu ostal"8D"le kamen,na katerem so v~asih"8D"ubijale svoje sovra`nike."8D"Gozdna pot vodi DOL."00
	asc	"Si na {irokem kra{kem polju.Nad"8D"tabo se dviga Slivnica,potka pa"8D"pelje na S."00
	asc	"Si v Keltski bistrici,vmesni"8D"postaji med Reko in Postojno."8D"Po lepih cestah gre{ lahko na SZ"8D"in JV."00
	asc	"Si v velikem pristani{kem mestu,"8D"ki je polno sumljivih tipov s"8D"celega sveta.Pazi se jih!"8D"Poti po kopnem vodijo na S,Z in"8D"SZ."00
	asc	"Si v rojstnem kraju na{ega"8D"slavnega bombanderja Pateja"8D"Marlowa.Tu je tudi pekarna, v"8D"katerem je Pate za~el svojo pot."8D"Cesti gresta na S in SV."00
	asc	"Si v jugoslovanski Silicon"8D"Valley,kjer izdelujejo znane"8D"ra~unske stroje DIGITRON.Poti"8D"vodijo na S in J."00
	asc	"Si v pristani{~u ro`,kjer je vse"8D"polno izletnikov.Na nekem zidu"8D"pi{e z velikimi ~rkami:"8D"NE MI DIHAT ZA OVRATNIK !"8D"Lahko gre{ na S ali J."00
	asc	"Pred tabo galopirajo lepe bele"8D"kobilice,kakr{ne uporabljajo vsi"8D"tihotapci.V ozadju je upravna"8D"stavba,kjer vpisujejo vrstni red"8D"zanje. Hlepijo tudi po gostih,"8D"ki dobro pla~ajo."8D"Pot vodi iz S na J."00
	asc	"Si pred vhodom v veliko,temno"8D"jamo,ki le`i na S.^e nisi jamar,"8D"pojdi na SV,JV ali JZ."00
	asc	"Si v kraju, ki je krog in krog"8D"obdan z gozdovi. Iz starih ~asov"8D"se je ohranila navada,da tu"8D"popotnike ropajo."8D"Pobegne{ pa lahko na SV,Z in"8D"JZ."00
	asc	"Staro rudarsko mestece te"8D"pozdravlja in ti ponuja vsa"8D"svoja bogastva.Spomni se na neko"8D"sporo~ilo in ne vzemi,kar rabi{."8D"Pot gre na V in JZ."00
	asc	"Dokler se bo{ tako izra`al ti ne"8D"mislim pomagati. Zaradi mene"8D"lahko doktorira{ na tej"8D"lokaciji. Kam vodijo poti,pa kar"8D"sam ugotovi."00
	asc	"Opazujejo te;napa~en premik je"8D"lahko usoden."00
	asc	"Opazujejo te;napa~en premik je"8D"lahko usoden."00
	asc	"Vro~e je. Prava beseda te na tem"8D"mestu re{i, napa~na pogubi."00
	asc	"Si na vhodu v podzemno jamo.S"8D"stropa kaplja ledenomrzla voda,"8D"nekje v globini bu~i reka.Ozki"8D"hodniki vodijo na S,J in Z."00
	asc	"Si v jami.Zelo je hladno.Na"8D"steni pi{e z ogljem:"8D"NE HODI NAPREJ !"8D"Vla`ne poti vodijo naJ in JZ."00
	asc	"Si v jami.Vidi{ bolj malo.Poti"8D"vodijo na J in Z."00
	asc	"Si v jami;vidi{ bolj malo.Poti"8D"vodijo na S in V."00
	asc	"Si v jami;vidi{ bolj malo.Poti"8D"vodijo na J,Z in SV."00
	asc	"Si v jami;vidi{ bolj malo.Poti"8D"vodijo na V in Z."00
	asc	"Postaja svetleje-si v gozdni"8D"jami.Poti vodijo na J,V,z in SZ."00
	asc	"Si v gozdu.Potki vodita na S in"8D"V."00
	asc	"Si v temnem starem gozdu.Poti"8D"vodijo na S,SV,V in Z."00
	asc	"Si v temnem starem gozdu.Poti"8D"vodijo na Z in JV."00
	asc	"Si v temnem starem gozdu.Poti"8D"vodijo na S in V."00
	asc	"Si v temnem starem gozdu.Poti"8D"vodijo na J,V in Z."00
	asc	"Stoji{ v modri sobi skritega"8D"gradu.Velika sobana je na Z."00
	asc	"Si v Predjamskem gradu in"8D"stoji{ v njegovi rde~i sobi."8D"Izhodi so na S,V in JZ."00
	asc	"Si v vijoli~asti sobi."00
	asc	"Si v zeleni sobi.Preproge gredo"8D"proti SV in Z."00
	asc	"Si v rumeni sobi."00
	asc	"Si v beli sobi.Edina vrata so na"8D"Z,stopnice pa vodijo DOL. Na"8D"steni je telefon,v imeniku pa"8D"pi{e:"8D"klic v du{evni stiski:061-313715"00
	asc	"Si v vijoli~asti sobi."00
	asc	"Stoji{ med samimi ~udnimi kamni."8D"Kraj di{i po smrti.Iz S sli{i{"8D"smeh.Ceste vodijo na Z,SV,J,JV."00
	asc	"Pred teboj je jezero na njem pa"8D"lesena vikendica na koleh."8D"Bober Janez ve kje je ~oln."8D"Na drugi strani jezera vidis"8D"SVETO TROJICO."00
	asc	"Pravi kaveljc (korenina) si !"8D"Plavaj naprej na jug."00
	asc	"Si v tunelu.Okrog tebe je tema,a"8D"ni se ti treba bati,saj sva dva."00
	asc	"Si v tunelu,ki nas povezuje z"8D"AU.. strici in AU.. tetami."8D"Prebij se skozenj !"00
	asc	"[e vedno si v tunelu.Pohiti,saj"8D"je zrak zelo slab in `e te`ko"8D"diha{."00
	asc	"Si na odmikali{~u v velikem"8D"tunelu.Ne ~akaj,ampak ~imprej"8D"odidi!"00
	asc	"[e vedno hodi{ po tunelu.Od"8D"nekod prihaja pi{ sve`ega zraka,"8D"zato ne obupaj."00
	asc	"Si v avstrijskem delu tunela."8D"Izberi dr`avo,v katero bi rad"8D"{el in to tudi stori."00
	asc	"Si na avstrijskem vhodu v tunel."8D"Na zidu pi{e s sprejem:"8D"Hier wird Deutsch gesprochen!"00
	asc	"Si na avstrijski carinarnici."8D"Vpra{ajo te za Sliwowitz,in da"8D"ne bi bil v sku{njavah,te stvari"8D"sploh ni v igri."00
	asc	"Si v gorah.Sli{i{ ~redo ovac in"8D"jodlanje njihovega pastirja,ki"8D"pozna vse grani~arje.Ozka potka"8D"vodi na V."00
	asc	"CAMBIO-WECHSELSTUBE-EXCHANGE"8D"Stoji{ pred slovenskim"8D"nakupovalnim centrom VELIKE."8D"Njihovo geslo je:"8D"PRIDI,VIDI,KUPI,IDI"8D"Po nakupih gra{ lahko na S,J in"8D"SV."00
	asc	"Si pri kne`jem kamnu."8D"Z malo domi{ljije si lahko"8D"PRI^ARA[ podobe preteklosti."00
	asc	"Du stehst vor einem Kasino neben"8D"Worther See.Um einzutreten"8D"mus man eine Krawatte haben."8D"Strasen fuhren nach Ost,West"8D"und Sud."00
	asc	"Du bist im Klagenfurt.Hier gibt"8D"es viele Sachen,aber du hast"8D"nicht genug Zeit und Geld.Gassen"8D"fuhren nach Nord,West und"8D"Nordwest."00
	asc	"Du bist an einem See.Man sagt,"8D"das hier einmal auch ein Held,"8D"Tzchrthomyr genannt lebte.Du"8D"kannst zum Nordwest gehen."00
	asc	"In Wein trinken alle Leute Wien."8D"Aber du must die Reise"8D"fortsetzen.Grose Strassen gehenn"8D"ach Ost und Sudost."00
	asc	"Jetzt bist du im Munchen.Hier"8D"kann man gute Computer und Bier"8D"kaufen.Winklige Strassen fuhrenn"8D"ach Ost,West und Sud."00
	asc	"Du kommst in eine Bierstube,wo"8D"man gutes Bier trinken kann.Aber"8D"das Bier schadet der Gesundheit"8D"und du must nach Nord,West"8D"oder Nordost gehen."00
	asc	"Jetzt bist du in einem grosen"8D"Geschaft fur Computer.Du"8D"siehst viele Computer,aber"8D"welcher ist der beste?Ist das"8D"der CBM oder **zx** ?"00
	asc	"Du bist in einer den"8D"Sehenswurdigkeiten Munchens-"8D"SexShop.Die Bilder an den"8D"Wanden locken aber..."00
	asc	"Du bist im Kasino.Grose"8D"Ruletten und Spielautomaten"8D"nehmen und geben das Geld den"8D"Leuten."00
	asc	"Si v labirintu paragrafov.Poti"8D"vodijo v vse smeri,pazi pa na"8D"luknje v zakonu."00
	asc	"Si v labirintu paragrafov.Poti"8D"vodijo v vse smeri,pazi pa na"8D"luknje v zakonu."00
	asc	"Si v labirintu paragrafov.Poti"8D"vodijo v vse smeri,pazi pa na"8D"luknje v zakonu."00
	asc	"Si v labirintu paragrafov.Poti"8D"vodijo v vse smeri,pazi pa na"8D"luknje v zakonu."00
	asc	"Si v labirintu paragrafov."8D"Tu je tudi Jernej, ki i{~e"8D"dovoljenje za uvoz"8D"mikrora~unalnika."00
	asc	"Si v zakladnici."8D"V steni je trezor,"8D"ki ga odpre le ~arobna beseda,ki"8D"je z debelim ~rnim flomastrom"8D"napisana na zadnji strani enega"8D"od kioskov pri Figovcu."00
	asc	"Na dobri poti si,le naprej na J."00
	asc	"Stoji{ ob nekem tujem jezeru,"8D"kjer prebiva junak Tzchrtomyr,ki"8D"rabi `ensko dru`bo."00
	asc	"Stoji{ visoko v gorah.Okrog tebe"8D"je polno ovc,prihaja pa tudi"8D"njihov pastir,ki rad gleda"8D"slike."00
	asc	"Po planinskem pa{niku skaklja"8D"veseli K.... in prepeva pesmi o"8D"svojih juna{kih dejanjih."00
	asc	"K tebi je pri{la Fehta,ki te"8D"pehta za kos kruha.Daj ji kaj,da"8D"te ne po`re!"00
	asc	"Si na majhnem oto~ku sredi"8D"jezera.Na le`alniku se sredi nun"8D"son~i njihova varovanka"8D"Vragumila.V mislih je pri"8D"svojem dragem,a ne more tja."00
	asc	"Si v majhni vasi.Tako je mraz,da"8D"si popolnoma pobohinjil."00
	asc	"Si pri Bedancu.Ni kaj videti,saj"8D"je vse bedno."00
	asc	"Mala p{eni~na deklica varuje"8D"moko.Kar se ti~e ro` je"8D"popolnoma nepote{ena."00
	asc	"Si na sestanku keglja{kega kluba"8D"Navje.Ker so boji zanimivi,je"8D"tam polno kamnov,na katerih se"8D"da sedeti."00
	asc	"Okrog tebe je rajon tolpe"8D"Nogovnja~ev.Pazi na nevarnosti."00
	asc	"Si v celeiskem gradu.U`ivaj,saj"8D"to obstaja le {e danes in nikoli"8D"ve~."00
	asc	"Si v mestu treh zvezd."8D"^e ve{ ~arobno besedo,gre{ lahko"8D"v goro Peco,vendar pazi,saj so"8D"stvari zelo delikatesne."00
	asc	"Za mizo sedi kralj Matja`."8D"Dolga umazana brada je zavita"8D"okrog mize. Tu se da dobiti me~."00
	asc	"Si v dvorcu,kjer prebivajo sami"8D"fini ljudje,ki se jih spla~a"8D"ugrabiti."00
	asc	"Na plesi{~u ~aka Ur{ka fante iz"8D"Dru{tva za raziskovanje rek."8D"Pusti vse,~esar ne rabi{,saj se"8D"tu ple{e."00
	asc	"Pod tabo vidi{ mesto,ki ga pazi"8D"zeleni zmaj.Na grajskem stolpu"8D"pi{e:"8D"POZOR,SVE@E PLESKANO !!!"00
	asc	"Vse dehti od omamnega vonja ro`."8D"Vendar so ro`e bole~e bode~e,"8D"zato rabi{ rokavice."00
	asc	"Si na Vrhu pri Sveti dvojici.Tu"8D"je glasnotapec kave, ki pa `al"8D"ne more delati."00
	asc	"Si ob presihajo~em jezeru.Od"8D"nekod se sli{i smeh ~arovnic."00
	asc	"Stoji{ ob morju.Tam stoji tudi"8D"grda Vida,ki ne zmore ve~"8D"vsakodnevnega pranja plenic."8D"Od mo`a ima tudi vso potrebno"8D"potaplja{ko opremo."00
	asc	"Si na jasi sredi gozda.Potke"8D"gredo proti J,V,Z in SZ."00
	asc	"Si v gradu,kjer prebiva"8D"Friderik,ki si `eli le {e"8D"Veroniko.Pomagaj mu,pa te bo"8D"nagradil!"00
	asc	"Si `e ob Kolpi."8D"Ljudje tu so silno mo~ni,neki"8D"Klepec Tepec ruva kar cela"8D"drevesa,~e le pojekako sla{~ico."00
	asc	"Si na vrhu gore.Tam je tudi"8D"`rtveni oder ~arovnic.Prosim,"8D"pojdiva stran,ker me je strah."00
	asc	"Si v obcestni kr~mi,kjer imajo"8D"zelo lepe dvoposteljne sobe."00
	asc	"Sama jama in tama."00
	asc	"Sama jama in tama."00
	asc	"Sama jama in tama."00
	asc	"Sama jama in tama."00
	asc	"Sama jama in tama."00
	asc	"Sama jama in tama."00
	asc	"Gost gozd."00
	asc	"Gost gozd."00
	asc	"Gost gozd."00
	asc	"Gost gozd."00
	asc	"Gost gozd."00
	asc	"Si v gozdni jami.Le tako naprej-"8D"NAJJA^I OSTAJU!"00
	asc	"Si v vite{ki sobi."00
	asc	"Si v gradu,kjer stanuje Predjam"8D"Erazemski."00
	asc	"Si v sobi za dvoboje."00
	asc	"Si v plesni sobi."00
	asc	"Si v obednici."00
	asc	"Si v knji`nici."00
	asc	"Si v kleti.Tla so hladna,saj so"8D"narejena iz teptane zemlje."00
	asc	"Stoji{ pod Predjamskim gradom. S"8D"treljajo nate saj se bojijo, da"8D"bo{ ukradel zaklad. Pot  vodi"8D"GOR v grad, Z in J v gozd."00
	asc	"Si na dvi`nem mostu, ki pa se"8D"prav nesramno zapre."8D"Iz gradu pride sluga s"8D"smeti{nico."00
	asc	"Si v stanovanju.Vidi{ le mizo in"8D"stol."00
	asc	"Si v de`eli maka."8D"Vro~e je,zato se vrni na sever."00
	asc	"Okrog in okrog sama `itna polja."8D"Ravne ceste vodijo na V in J."00

*------------------------------
* MESSAGES
*------------------------------

tblMESSAGES
	asc	"Nag si.Veronika zardeva."00
	asc	"[e `al ti bo !"00
	asc	"Si v Sloveniji,zato govori z"8D"mano v sloven{~ini,tepec!"00
	asc	"Kleper Tepec vzame krof in"8D"ti da v zahvalo nekaj odli~nih"8D"hrastovih desk."00
	asc	"S ~im pa naj bi po tvoje to"8D"storil ?"00
	asc	"Uh!Tole se mi bo pa prav"8D"prileglo,saj `e dolgo hodiva."00
	asc	8D"Tako.Spo~it sem,zato pojdiva"8D"naprej."00
	asc	"Igre je konec,"8D"bil divji je ples,"00
	asc	"Hvale`no Korenje ti da uvo`en TV"8D"aparat iz opu{~enega programa."00
	asc	"@are~i Friderik vzame"8D"Veroniko,v zahvalo pa ti da"8D"lonec denarja."00
	asc	"PUFFF ..."00
	asc	"Frideriku izraz na Veronikinem"8D"licu ni v{e~.Izdere me~ in ga"8D"zarine med tvoja reberca."8D"Kako divji ~asi !!!!"00
	asc	"Izbir~na Veronika te ne {mirgla!"8D00
	asc	A2"Pojdiva dragi,"A2" se ona odlo~i,"8D"potlej pa hitro v naro~je ti"8D"sko~i."00
	asc	"Veronika se je `e izlu{~ila"8D"iz tesnih kavbojk in te"8D"zapeljivo vabi k sebi."00
	asc	"Prima`e ti klofuto."8D"Uf,kako mo~na so dekleta iz"8D"pravljic. Zbudi{ se."00
	asc	"[krip...{krip...{krip...(5 to~k)"8D00
	asc	"Herman Celjski (ki more {e danes"8D"in nikoli ve~)ti vzame Veroniko."8D00
	asc	"Herman `eli obdr`ati Veroniko,"8D"toda tvoj me~ mu ne da blizu."00
	asc	"Matej ti od blizu poka`e"8D"rokavico...~iv..~iv..~iv"00
	asc	"Dajo ti vajenca Mateja,ki"8D"zajaha {tupo ramo ..."00
	asc	"V zameno za dragega gosta"8D"ima{ protekcijo za vrstni red."00
	asc	"Vpisan si pod {t. 1921212,"8D"PLEASE ALLOW US UP TO 28 DAYS"8D"FOR DELIVERY"00
	asc	"Mo` ti na prsi pripne zna~ko"8D"in ti `eli mnogo sre~e."00
	asc	"HVALA !"00
	asc	"Levo oko je vijoli~asto"00
	asc	A2"Mmm,che buono!"A2"pravi Tepec in"8D"odlo`i lepe hrestove deske,ki"8D"jih dr`i."00
	asc	"Urban ti da sode reko~:"8DA2"Take suode so rajnk o~a za"8D"ta neprauga fajmo{tra delal."A200
	asc	"Trubar:"8DA2"Jest sm zhe prestar za shverc"8D"inu kontrabant.U sot dej maurco"8D"pa bo.Bukva je pa zhe stara."A200
	asc	"Ne obupaj,sedaj pa bo !"00
	asc	"Ku ku,sem `e tu...(tastatura, sa"8D"j za cel HR ni dovolj zakaladov"8D"v tej igri)."00
	asc	"TI[INA,DELAMO !"00
	asc	"MATR,TAK SESALC MED NOGAM JE PA"8D"VSE KEJ DRUZGA KT METLA,ZA TO"8D"SE PA SPLA^A ^ARATI."00
	asc	"V tleh vidi{ veliko luknjo."00
	asc	"Napadejo te,oklep zdr`i."00
	asc	"Pohlep brez oklepa je hudo"8D"`alostna stvar."00
	asc	"Zaklad je zakopan."8D"(zakaj to dela{, meni je bil"8D"v{e~)"00
	asc	"Odkopal si zaklad."00
	asc	"Vse zastonj,uni~il si lopato."00
	asc	"Lune se zatopijo v sladkosti"8D"joysticka,Bogumila pa ti plane v"8D"objem."00
	asc	"^rtomir ti je zaplenil SPECTRUMA"8D"in pravi,da ti ga bo dal le za"8D"svojo drago."00
	asc	"Kekec ti re~e: Bedancu s pu{ko"8D"ute~e{."00
	asc	"Bogomilo vrnil si mi-hvala,"8D"sama bova zdaj ostala,"8D"tebi pa Sinclaira dala."00
	asc	"Daj no!Saj nisi dojen~ek!"00
	asc	"Ro`le se v slike zatopi,"8D"tebi frulo prepusti."00
	asc	"Nosi Svilanit kravate-"8D"to te re{i iz zagate."00
	asc	"Ur{ka te polije z vodo.Zbudi{"8D"se v svoji sobi,mo~no zaspan."00
	asc	"Za~etnik,ostani doma !"00
	asc	"Klik..."00
	asc	"VSAK JE SAM SVOJE GLAVE MESAR !"00
	asc	"Za skrivanje potrebujem sod."00
	asc	"Carinik ne nasede:"8D"Stara finta, skrivati stvari v"8D"sodih."00
	asc	"Bedan~ev strel iz daljave je"8D"tik pred koncem podrl pogumnega"8D"a neoboro`enega avanturista."00
	asc	"Imeti mora{ veljaven"8D"potni list in izvoziti nekaj"8D"visoke tehnologije, pa pride{"8D"~ez !"00
	asc	"Oskubili so te do zadnjega !"00
	asc	"Bravo!!!"8D"Tajno geslo je:"8D"oluja"00
	asc	"Plavam,plavam,plavam,plavam kot"8D"zamorc."00
	asc	"Lepa Ur{ka ni hvale`na,ampak te"8D"polije s {kafom ledeno mrzle"8D"vode...."8D"Po~asi prihaja{ k sebi."00
	asc	"@al lahko tu kupuje{ le s"8D"konvertibilnimi valutami."00
	asc	"S ~im pa,ko pa nima{ denarja???"00
	asc	"Buuuum..."00
	asc	"^rtomir se ti zahvali,pet"8D"procentov ti pristavi."00
	asc	"Lepa Vida je pri morju stala,"8D"za plenice ti je masko dala."00
	asc	"Ne vidim ni~ posebnega."00
	asc	"Bravo!Odgovor je pravilen,zato"8D"si dobil kolekcijo Attache!"8D""00

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
	macOBJ	O_NOTCRE;"televizor"
	macOBJ	O_NOTCRE;"~ekovno knji`ico"
	macOBJ	O_NOTCRE;"lonec, poln zlatnikov"
	macOBJ	O_NOTCRE;"kolekcijo Attache"
	macOBJ	O_NOTCRE;"kasetofon"
	macOBJ	O_NOTCRE;"kavo"  
	macOBJ	O_NOTCRE;"ajdovo moko"
	macOBJ	155;"bajni zaklad"
	macOBJ	132;"Blagajev vol~in"
	macOBJ	29;"rokavice"
	macOBJ	O_NOTCRE;"Tastaturo za HR 1884"
	macOBJ	O_NOTCRE;"knjigo Microcomputer-Do It"8D"Yourself"
	macOBJ	O_NOTCRE;"sod z dvojnim dnom"
	macOBJ	O_NOTCRE;"hrastove deske"
	macOBJ	21;"krof"  
	macOBJ	O_NOTCRE;"marke" 
	macOBJ	O_NOTCRE;"~arobni oklep"
	macOBJ	O_NOTCRE;"turbo sesalec"
	macOBJ	O_NOTCRE;"pi{~alko"
	macOBJ	132;"planiko"
	macOBJ	41;"alpinisti~no opremo"
	macOBJ	98;"pu{ko" 
	macOBJ	107;"porno revije"
	macOBJ	107;"joystick"
	macOBJ	20;"kravato"
	macOBJ	O_NOTCRE;"ZX SPECTRUM"
	macOBJ	O_NOTCRE;"me~ kralja Matja`a"
	macOBJ	9;"plenice"
	macOBJ	6;"sve~o" 
	macOBJ	39;"v`igalice"
	macOBJ	40;"baterijsko svetilko"
	macOBJ	O_NOTCRE;"`ivo srebro"
	macOBJ	3;"rum za pogum"
	macOBJ	16;"~oln"	; 34 COLN
	macOBJ	22;"hmelj" 
	macOBJ	O_NOTCRE;"pivce za `ivce"
	macOBJ	114;"potni list"
	macOBJ	O_NOTCRE;"pri`gano sve~o"
	macOBJ	O_NOTCRE;"pri`gano baterijo"
	macOBJ	2;"znacko na kateri pise:"8D"POZOR AVANTURIST ZACETNIK"
	macOBJ	34;"obleko visoke evropske mode"
	macOBJ	129;"lepo Veroniko"
	macOBJ	O_NOTCRE;"vrstni red za kobilico"
	macOBJ	O_NOTCRE;"Mateja"
	macOBJ	O_NOTCRE;"{op dinarjev"
	macOBJ	31;"oklep" 
	macOBJ	45;"lopato"
	macOBJ	120;"hrepene~o Bogomilo"
	macOBJ	O_NOTCRE;"svojo sliko (matr si fejst)"
	macOBJ	O_NOTCRE;"veljaven potni list"
	macOBJ	O_NOTCRE;"SPECTRUM skrit v sodu"
	macOBJ	O_NOTCRE;"veliko vre~o oglja"
	macOBJ	O_NOTCRE;"potaplja{ko masko"
	macOBJ	O_NOTCRE;"ZX SPECTRUM"
	macOBJ	O_NOTCRE;"SPECTRUM skrit v sodu"8D
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
	macRUL	CMD_PROC; $0000;    69
	macRUL	CMD_PROC; $0000;   138
	macRUL	CMD_PROC; $0000;   207
	macRUL	CMD_PROC; $0000;   250
	macRUL	CMD_PROC; $0000;   264
	macRUL	CMD_PROC; $0000;   339
	macRUL	CMD_PROC; $0000;   344
	macRUL	CMD_PROC; $0000;   349
	macRUL	CMD_PROC; $0000;   420
	macRUL	CMD_PROC; $0000;   491
	macRUL	CMD_PROC; $0000;   526
	macRUL	CMD_PROC; $0000;   539
	macRUL	CMD_PROC; $0000;   552
	macRUL	CMD_PROC; $0000;   569
	macRUL	CMD_PROC; $0000;   586
	macRUL	CMD_PROC; $0000;   595
	macRUL	CMD_PROC; $0000;   608
	macRUL	CMD_PROC; $0000;   627
	macRUL	CMD_PROC; $0000;   641
	macRUL	CMD_PROC; $0000;   656
	macRUL	CMD_PROC; $0000;   661
	macRUL	CMD_PROC; $0000;   712
	macRUL	CMD_PROC; $0000;   796
	macRUL	CMD_PROC; $0000;   850
	macRUL	CMD_PROC; $0000;   889
	macRUL	CMD_PROC; $0000;   916
	macRUL	CMD_PROC; $0000;   943
	macRUL	CMD_PROC; $0000;   991
	macRUL	CMD_PROC; $0000;  1072
	macRUL	CMD_PROC; $0000;  1086
	macRUL	CMD_PROC; $0000;  1103
	macRUL	CMD_PROC; $0000;  1115
	macRUL	CMD_PROC; $0000;  1125
	macRUL	CMD_PROC; $0000;  1136
	macRUL	CMD_PROC; $0000;  1147
	macRUL	CMD_PROC; $0000;  1201
	macRUL	CMD_PROC; $0000;  1258
	macRUL	CMD_PROC; $0000;  1271
	macRUL	CMD_PROC; $0000;  1283
	macRUL	CMD_PROC; $0000;  1295
	macRUL	CMD_PROC; $0000;  1306
	macRUL	CMD_PROC; $0000;  1315
	macRUL	CMD_PROC; $0000;  1326
	macRUL	CMD_PROC; $0000;  1333
	macRUL	CMD_PROC; $0000;  1347
	macRUL	CMD_PROC; $0000;  1354
	macRUL	CMD_PROC; $0000;  1366
	macRUL	CMD_PROC; $0000;  1380
	macRUL	CMD_PROC; $0000;  1394
	macRUL	CMD_PROC; $0000;  1402
	macRUL	CMD_PROC; $0000;  1415
	macRUL	CMD_PROC; $0000;  1425
	macRUL	CMD_PROC; $0000;  1438
	macRUL	CMD_PROC; $0000;  1446	;
	macRUL	CMD_CONN; $0003;  1454	; V (0 --> 1) 
	macRUL	CMD_CONN; $000C;  1460	; VEN (1 --> 2) 
	macRUL	CMD_CONN; $0009;  1466	; G (2 --> 1) 
	macRUL	CMD_CONN; $0005;  1472	; SV (2 --> 7) 
	macRUL	CMD_CONN; $0003;  1478	; V (2 --> 28) 
	macRUL	CMD_CONN; $0007;  1484	; JV (2 --> 6) 
	macRUL	CMD_CONN; $0002;  1490	; J (2 --> 5) 
	macRUL	CMD_CONN; $0008;  1496	; JZ (2 --> 4) 
	macRUL	CMD_CONN; $0004;  1502	; Z (2 --> 3) 
	macRUL	CMD_CONN; $0006;  1508	; SZ (2 --> 10) 
	macRUL	CMD_CONN; $0003;  1514	; V (3 --> 2) 
	macRUL	CMD_CONN; $0001;  1520	; S (3 --> 10) 
	macRUL	CMD_CONN; $0006;  1526	; SZ (3 --> 11) 
	macRUL	CMD_CONN; $0005;  1532	; SV (4 --> 2) 
	macRUL	CMD_CONN; $0002;  1538	; J (4 --> 8) 
	macRUL	CMD_CONN; $000A;  1544	; D (4 --> 29) 
	macRUL	CMD_CONN; $0001;  1550	; S (5 --> 2) 
	macRUL	CMD_CONN; $0004;  1556	; Z (5 --> 8) 
	macRUL	CMD_CONN; $0008;  1562	; JZ (5 --> 30) 
	macRUL	CMD_CONN; $0002;  1568	; J (5 --> 31) 
	macRUL	CMD_CONN; $0003;  1574	; V (5 --> 28) 
	macRUL	CMD_CONN; $0006;  1580	; SZ (6 --> 2) 
	macRUL	CMD_CONN; $0008;  1586	; JZ (7 --> 2) 
	macRUL	CMD_CONN; $0004;  1592	; Z (7 --> 20) 
	macRUL	CMD_CONN; $0001;  1598	; S (7 --> 9) 
	macRUL	CMD_CONN; $0001;  1604	; S (8 --> 4) 
	macRUL	CMD_CONN; $0003;  1610	; V (8 --> 5) 
	macRUL	CMD_CONN; $0001;  1616	; S (9 --> 20) 
	macRUL	CMD_CONN; $0002;  1622	; J (9 --> 7) 
	macRUL	CMD_CONN; $0004;  1628	; Z (10 --> 11) 
	macRUL	CMD_CONN; $0002;  1634	; J (10 --> 3) 
	macRUL	CMD_CONN; $0007;  1640	; JV (10 --> 2) 
	macRUL	CMD_CONN; $0006;  1646	; SZ (10 --> 12) 
	macRUL	CMD_CONN; $0001;  1652	; S (10 --> 19) 
	macRUL	CMD_CONN; $0003;  1658	; V (11 --> 10) 
	macRUL	CMD_CONN; $0007;  1664	; JV (11 --> 3) 
	macRUL	CMD_CONN; $0001;  1670	; S (12 --> 18) 
	macRUL	CMD_CONN; $0003;  1676	; V (12 --> 19) 
	macRUL	CMD_CONN; $0007;  1682	; JV (12 --> 10) 
	macRUL	CMD_CONN; $0004;  1688	; Z (12 --> 13) 
	macRUL	CMD_CONN; $0003;  1694	; V (13 --> 12) 
	macRUL	CMD_CONN; $0008;  1700	; JZ (13 --> 14) 
	macRUL	CMD_CONN; $0005;  1706	; SV (14 --> 13) 
	macRUL	CMD_CONN; $0001;  1712	; S (14 --> 17) 
	macRUL	CMD_CONN; $0006;  1718	; SZ (14 --> 16) 
	macRUL	CMD_CONN; $0005;  1724	; SV (16 --> 17) 
	macRUL	CMD_CONN; $0007;  1730	; JV (16 --> 14) 
	macRUL	CMD_CONN; $0003;  1736	; V (17 --> 18) 
	macRUL	CMD_CONN; $0002;  1742	; J (17 --> 14) 
	macRUL	CMD_CONN; $0008;  1748	; JZ (17 --> 16) 
	macRUL	CMD_CONN; $0002;  1754	; J (18 --> 12) 
	macRUL	CMD_CONN; $0004;  1760	; Z (18 --> 17) 
	macRUL	CMD_CONN; $0001;  1766	; S (18 --> 32) 
	macRUL	CMD_CONN; $0004;  1772	; Z (19 --> 12) 
	macRUL	CMD_CONN; $0003;  1778	; V (19 --> 20) 
	macRUL	CMD_CONN; $0004;  1784	; Z (20 --> 19) 
	macRUL	CMD_CONN; $0003;  1790	; V (20 --> 21) 
	macRUL	CMD_CONN; $0002;  1796	; J (20 --> 9) 
	macRUL	CMD_CONN; $0004;  1802	; Z (21 --> 20) 
	macRUL	CMD_CONN; $0003;  1808	; V (21 --> 22) 
	macRUL	CMD_CONN; $0003;  1814	; V (22 --> 23) 
	macRUL	CMD_CONN; $0002;  1820	; J (22 --> 33) 
	macRUL	CMD_CONN; $0004;  1826	; Z (22 --> 21) 
	macRUL	CMD_CONN; $0004;  1832	; Z (23 --> 22) 
	macRUL	CMD_CONN; $000A;  1838	; D (23 --> 24) 
	macRUL	CMD_CONN; $0009;  1844	; G (24 --> 23) 
	macRUL	CMD_CONN; $0005;  1850	; SV (24 --> 26) 
	macRUL	CMD_CONN; $0001;  1856	; S (24 --> 25) 
	macRUL	CMD_CONN; $0004;  1862	; Z (24 --> 22) 
	macRUL	CMD_CONN; $0003;  1868	; V (24 --> 34) 
	macRUL	CMD_CONN; $0002;  1874	; J (25 --> 24) 
	macRUL	CMD_CONN; $0008;  1880	; JZ (26 --> 24) 
	macRUL	CMD_CONN; $0002;  1886	; J (26 --> 34) 
	macRUL	CMD_CONN; $0005;  1892	; SV (26 --> 27) 
	macRUL	CMD_CONN; $0008;  1898	; JZ (27 --> 26) 
	macRUL	CMD_CONN; $0003;  1904	; V (28 --> 36) 
	macRUL	CMD_CONN; $0007;  1910	; JV (28 --> 51) 
	macRUL	CMD_CONN; $0008;  1916	; JZ (28 --> 31) 
	macRUL	CMD_CONN; $0004;  1922	; Z (28 --> 5) 
	macRUL	CMD_CONN; $0001;  1928	; S (28 --> 2) 
	macRUL	CMD_CONN; $0009;  1934	; G (29 --> 4) 
	macRUL	CMD_CONN; $0005;  1940	; SV (30 --> 5) 
	macRUL	CMD_CONN; $0003;  1946	; V (30 --> 31) 
	macRUL	CMD_CONN; $0008;  1952	; JZ (30 --> 61) 
	macRUL	CMD_CONN; $0003;  1958	; V (31 --> 28) 
	macRUL	CMD_CONN; $0004;  1964	; Z (31 --> 30) 
	macRUL	CMD_CONN; $0001;  1970	; S (31 --> 5) 
	macRUL	CMD_CONN; $0002;  1976	; J (32 --> 18) 
	macRUL	CMD_CONN; $0001;  1982	; S (33 --> 22) 
	macRUL	CMD_CONN; $0002;  1988	; J (33 --> 36) 
	macRUL	CMD_CONN; $0001;  1994	; S (34 --> 26) 
	macRUL	CMD_CONN; $0002;  2000	; J (34 --> 38) 
	macRUL	CMD_CONN; $000C;  2006	; VEN (35 --> 37) 
	macRUL	CMD_CONN; $0001;  2012	; S (36 --> 33) 
	macRUL	CMD_CONN; $0002;  2018	; J (36 --> 47) 
	macRUL	CMD_CONN; $0003;  2024	; V (36 --> 37) 
	macRUL	CMD_CONN; $0004;  2030	; Z (36 --> 28) 
	macRUL	CMD_CONN; $000B;  2036	; NOTE (37 --> 35) 
	macRUL	CMD_CONN; $0003;  2042	; V (37 --> 38) 
	macRUL	CMD_CONN; $0004;  2048	; Z (37 --> 36) 
	macRUL	CMD_CONN; $0004;  2054	; Z (38 --> 37) 
	macRUL	CMD_CONN; $0003;  2060	; V (38 --> 39) 
	macRUL	CMD_CONN; $0002;  2066	; J (38 --> 49) 
	macRUL	CMD_CONN; $0005;  2072	; SV (38 --> 164) 
	macRUL	CMD_CONN; $0003;  2078	; V (39 --> 40) 
	macRUL	CMD_CONN; $0004;  2084	; Z (39 --> 38) 
	macRUL	CMD_CONN; $0002;  2090	; J (39 --> 41) 
	macRUL	CMD_CONN; $0002;  2096	; J (40 --> 42) 
	macRUL	CMD_CONN; $0004;  2102	; Z (40 --> 39) 
	macRUL	CMD_CONN; $0001;  2108	; S (41 --> 39) 
	macRUL	CMD_CONN; $0003;  2114	; V (41 --> 42) 
	macRUL	CMD_CONN; $0007;  2120	; JV (41 --> 44) 
	macRUL	CMD_CONN; $0002;  2126	; J (41 --> 45) 
	macRUL	CMD_CONN; $0001;  2132	; S (42 --> 40) 
	macRUL	CMD_CONN; $0002;  2138	; J (42 --> 44) 
	macRUL	CMD_CONN; $000B;  2144	; NOTE (42 --> 43) 
	macRUL	CMD_CONN; $0004;  2150	; Z (42 --> 41) 
	macRUL	CMD_CONN; $000C;  2156	; VEN (43 --> 42) 
	macRUL	CMD_CONN; $0001;  2162	; S (44 --> 42) 
	macRUL	CMD_CONN; $0006;  2168	; SZ (44 --> 41) 
	macRUL	CMD_CONN; $0004;  2174	; Z (44 --> 45) 
	macRUL	CMD_CONN; $0002;  2180	; J (44 --> 163) 
	macRUL	CMD_CONN; $0001;  2186	; S (45 --> 44) 
	macRUL	CMD_CONN; $0004;  2192	; Z (45 --> 41) 
	macRUL	CMD_CONN; $0001;  2198	; S (46 --> 47) 
	macRUL	CMD_CONN; $0006;  2204	; SZ (46 --> 48) 
	macRUL	CMD_CONN; $0003;  2210	; V (46 --> 36) 
	macRUL	CMD_CONN; $0002;  2216	; J (47 --> 46) 
	macRUL	CMD_CONN; $0004;  2222	; Z (47 --> 48) 
	macRUL	CMD_CONN; $0003;  2228	; V (48 --> 47) 
	macRUL	CMD_CONN; $0007;  2234	; JV (48 --> 46) 
	macRUL	CMD_CONN; $0006;  2240	; SZ (48 --> 50) 
	macRUL	CMD_CONN; $0001;  2246	; S (49 --> 38) 
	macRUL	CMD_CONN; $0002;  2252	; J (49 --> 55) 
	macRUL	CMD_CONN; $0006;  2258	; SZ (50 --> 51) 
	macRUL	CMD_CONN; $0007;  2264	; JV (50 --> 48) 
	macRUL	CMD_CONN; $0008;  2270	; JZ (51 --> 53) 
	macRUL	CMD_CONN; $0007;  2276	; JV (51 --> 50) 
	macRUL	CMD_CONN; $0006;  2282	; SZ (51 --> 28) 
	macRUL	CMD_CONN; $0005;  2288	; SV (51 --> 36) 
	macRUL	CMD_CONN; $000A;  2294	; D (52 --> 53) 
	macRUL	CMD_CONN; $0009;  2300	; G (53 --> 52) 
	macRUL	CMD_CONN; $0001;  2306	; S (53 --> 51) 
	macRUL	CMD_CONN; $0006;  2312	; SZ (54 --> 60) 
	macRUL	CMD_CONN; $0007;  2318	; JV (54 --> 55) 
	macRUL	CMD_CONN; $0001;  2324	; S (55 --> 49) 
	macRUL	CMD_CONN; $0006;  2330	; SZ (55 --> 54) 
	macRUL	CMD_CONN; $0004;  2336	; Z (55 --> 56) 
	macRUL	CMD_CONN; $0001;  2342	; S (56 --> 57) 
	macRUL	CMD_CONN; $0005;  2348	; SV (56 --> 55) 
	macRUL	CMD_CONN; $0001;  2354	; S (57 --> 58) 
	macRUL	CMD_CONN; $0002;  2360	; J (57 --> 56) 
	macRUL	CMD_CONN; $0001;  2366	; S (58 --> 59) 
	macRUL	CMD_CONN; $0002;  2372	; J (58 --> 57) 
	macRUL	CMD_CONN; $0002;  2378	; J (59 --> 58) 
	macRUL	CMD_CONN; $0001;  2384	; S (59 --> 60) 
	macRUL	CMD_CONN; $0008;  2390	; JZ (60 --> 59) 
	macRUL	CMD_CONN; $0007;  2396	; JV (60 --> 54) 
	macRUL	CMD_CONN; $0005;  2402	; SV (60 --> 61) 
	macRUL	CMD_CONN; $0008;  2408	; JZ (61 --> 60) 
	macRUL	CMD_CONN; $0005;  2414	; SV (61 --> 30) 
	macRUL	CMD_CONN; $0004;  2420	; Z (61 --> 62) 
	macRUL	CMD_CONN; $0003;  2426	; V (62 --> 61) 
	macRUL	CMD_CONN; $0008;  2432	; JZ (62 --> 75) 
	macRUL	CMD_CONN; $0003;  2438	; V (63 --> 64) 
	macRUL	CMD_CONN; $0003;  2444	; V (64 --> 64) 
	macRUL	CMD_CONN; $0007;  2450	; JV (64 --> 65) 
	macRUL	CMD_CONN; $0002;  2456	; J (64 --> 65) 
	macRUL	CMD_CONN; $0008;  2462	; JZ (64 --> 66) 
	macRUL	CMD_CONN; $0005;  2468	; SV (65 --> 64) 
	macRUL	CMD_CONN; $0007;  2474	; JV (65 --> 65) 
	macRUL	CMD_CONN; $0004;  2480	; Z (65 --> 66) 
	macRUL	CMD_CONN; $0004;  2486	; Z (66 --> 66) 
	macRUL	CMD_CONN; $0001;  2492	; S (66 --> 66) 
	macRUL	CMD_CONN; $0005;  2498	; SV (66 --> 64) 
	macRUL	CMD_CONN; $0002;  2504	; J (73 --> 80) 
	macRUL	CMD_CONN; $0004;  2510	; Z (73 --> 78) 
	macRUL	CMD_CONN; $0006;  2516	; SZ (73 --> 76) 
	macRUL	CMD_CONN; $0001;  2522	; S (74 --> 74) 
	macRUL	CMD_CONN; $0005;  2528	; SV (75 --> 62) 
	macRUL	CMD_CONN; $0001;  2534	; S (75 --> 78) 
	macRUL	CMD_CONN; $0004;  2540	; Z (75 --> 77) 
	macRUL	CMD_CONN; $0004;  2546	; Z (76 --> 77) 
	macRUL	CMD_CONN; $0007;  2552	; JV (76 --> 73) 
	macRUL	CMD_CONN; $0001;  2558	; S (77 --> 75) 
	macRUL	CMD_CONN; $0003;  2564	; V (77 --> 76) 
	macRUL	CMD_CONN; $0002;  2570	; J (78 --> 78) 
	macRUL	CMD_CONN; $0003;  2576	; V (78 --> 73) 
	macRUL	CMD_CONN; $0004;  2582	; Z (78 --> 75) 
	macRUL	CMD_CONN; $0004;  2588	; Z (79 --> 82) 
	macRUL	CMD_CONN; $0003;  2594	; V (80 --> 81) 
	macRUL	CMD_CONN; $0008;  2600	; JZ (80 --> 82) 
	macRUL	CMD_CONN; $0001;  2606	; S (80 --> 73) 
	macRUL	CMD_CONN; $0003;  2612	; V (81 --> 81) 
	macRUL	CMD_CONN; $0004;  2618	; Z (81 --> 80) 
	macRUL	CMD_CONN; $0004;  2624	; Z (82 --> 81) 
	macRUL	CMD_CONN; $0005;  2630	; SV (82 --> 80) 
	macRUL	CMD_CONN; $0003;  2636	; V (83 --> 84) 
	macRUL	CMD_CONN; $0008;  2642	; JZ (83 --> 85) 
	macRUL	CMD_CONN; $0004;  2648	; Z (84 --> 83) 
	macRUL	CMD_CONN; $000A;  2654	; D (84 --> 84) 
	macRUL	CMD_CONN; $0004;  2660	; Z (85 --> 85) 
	macRUL	CMD_CONN; $0005;  2666	; SV (85 --> 83) 
	macRUL	CMD_CONN; $0002;  2672	; J (86 --> 87) 
	macRUL	CMD_CONN; $0001;  2678	; S (86 --> 124) 
	macRUL	CMD_CONN; $0006;  2684	; SZ (86 --> 123) 
	macRUL	CMD_CONN; $0009;  2690	; G (86 --> 131) 
	macRUL	CMD_CONN; $0002;  2696	; J (87 --> 88) 
	macRUL	CMD_CONN; $0004;  2702	; Z (87 --> 132) 
	macRUL	CMD_CONN; $0005;  2708	; SV (87 --> 86) 
	macRUL	CMD_CONN; $0002;  2714	; J (88 --> 133) 
	macRUL	CMD_CONN; $0001;  2720	; S (96 --> 98) 
	macRUL	CMD_CONN; $0003;  2726	; V (97 --> 96) 
	macRUL	CMD_CONN; $0001;  2732	; S (98 --> 100) 
	macRUL	CMD_CONN; $0002;  2738	; J (98 --> 96) 
	macRUL	CMD_CONN; $0005;  2744	; SV (98 --> 101) 
	macRUL	CMD_CONN; $0003;  2750	; V (99 --> 100) 
	macRUL	CMD_CONN; $0004;  2756	; Z (100 --> 99) 
	macRUL	CMD_CONN; $0003;  2762	; V (100 --> 101) 
	macRUL	CMD_CONN; $0002;  2768	; J (100 --> 98) 
	macRUL	CMD_CONN; $0004;  2774	; Z (101 --> 100) 
	macRUL	CMD_CONN; $0008;  2780	; JZ (101 --> 98) 
	macRUL	CMD_CONN; $0006;  2786	; SZ (101 --> 103) 
	macRUL	CMD_CONN; $0001;  2792	; S (101 --> 104) 
	macRUL	CMD_CONN; $0006;  2798	; SZ (102 --> 104) 
	macRUL	CMD_CONN; $0003;  2804	; V (103 --> 104) 
	macRUL	CMD_CONN; $0007;  2810	; JV (103 --> 101) 
	macRUL	CMD_CONN; $0002;  2816	; J (104 --> 101) 
	macRUL	CMD_CONN; $0004;  2822	; Z (104 --> 103) 
	macRUL	CMD_CONN; $0003;  2828	; V (104 --> 105) 
	macRUL	CMD_CONN; $0005;  2834	; SV (104 --> 106) 
	macRUL	CMD_CONN; $0007;  2840	; JV (104 --> 102) 
	macRUL	CMD_CONN; $0004;  2846	; Z (105 --> 104) 
	macRUL	CMD_CONN; $0001;  2852	; S (105 --> 106) 
	macRUL	CMD_CONN; $0005;  2858	; SV (105 --> 107) 
	macRUL	CMD_CONN; $0002;  2864	; J (106 --> 105) 
	macRUL	CMD_CONN; $0008;  2870	; JZ (106 --> 104) 
	macRUL	CMD_CONN; $0003;  2876	; V (106 --> 107) 
	macRUL	CMD_CONN; $0004;  2882	; Z (107 --> 106) 
	macRUL	CMD_CONN; $0008;  2888	; JZ (107 --> 105) 
	macRUL	CMD_CONN; $000C;  2894	; VEN (108 --> 100) 
	macRUL	CMD_CONN; $0002;  2900	; J (115 --> 117) 
	macRUL	CMD_CONN; $0004;  2906	; Z (116 --> 115) 
	macRUL	CMD_CONN; $0002;  2912	; J (116 --> 119) 
	macRUL	CMD_CONN; $0001;  2918	; S (117 --> 115) 
	macRUL	CMD_CONN; $0003;  2924	; V (117 --> 118) 
	macRUL	CMD_CONN; $0002;  2930	; J (118 --> 121) 
	macRUL	CMD_CONN; $0004;  2936	; Z (118 --> 117) 
	macRUL	CMD_CONN; $0002;  2942	; J (119 --> 122) 
	macRUL	CMD_CONN; $0001;  2948	; S (119 --> 116) 
	macRUL	CMD_CONN; $0003;  2954	; V (120 --> 121) 
	macRUL	CMD_CONN; $0004;  2960	; Z (121 --> 120) 
	macRUL	CMD_CONN; $0002;  2966	; J (121 --> 123) 
	macRUL	CMD_CONN; $0003;  2972	; V (121 --> 122) 
	macRUL	CMD_CONN; $0005;  2978	; SV (121 --> 118) 
	macRUL	CMD_CONN; $0007;  2984	; JV (121 --> 130) 
	macRUL	CMD_CONN; $0004;  2990	; Z (122 --> 121) 
	macRUL	CMD_CONN; $0003;  2996	; V (122 --> 119) 
	macRUL	CMD_CONN; $0001;  3002	; S (123 --> 121) 
	macRUL	CMD_CONN; $0002;  3008	; J (123 --> 132) 
	macRUL	CMD_CONN; $0003;  3014	; V (123 --> 124) 
	macRUL	CMD_CONN; $0007;  3020	; JV (123 --> 86) 
	macRUL	CMD_CONN; $0002;  3026	; J (124 --> 86) 
	macRUL	CMD_CONN; $0003;  3032	; V (124 --> 125) 
	macRUL	CMD_CONN; $0004;  3038	; Z (124 --> 123) 
	macRUL	CMD_CONN; $0004;  3044	; Z (125 --> 124) 
	macRUL	CMD_CONN; $0003;  3050	; V (125 --> 126) 
	macRUL	CMD_CONN; $0004;  3056	; Z (126 --> 125) 
	macRUL	CMD_CONN; $0003;  3062	; V (126 --> 127) 
	macRUL	CMD_CONN; $0004;  3068	; Z (127 --> 126) 
	macRUL	CMD_CONN; $0007;  3074	; JV (127 --> 129) 
	macRUL	CMD_CONN; $000C;  3080	; VEN (128 --> 127) 
	macRUL	CMD_CONN; $0006;  3086	; SZ (129 --> 127) 
	macRUL	CMD_CONN; $0008;  3092	; JZ (129 --> 140) 
	macRUL	CMD_CONN; $0001;  3098	; S (130 --> 121) 
	macRUL	CMD_CONN; $000A;  3104	; D (131 --> 86) 
	macRUL	CMD_CONN; $0002;  3110	; J (131 --> 133) 
	macRUL	CMD_CONN; $0001;  3116	; S (132 --> 123) 
	macRUL	CMD_CONN; $0003;  3122	; V (132 --> 87) 
	macRUL	CMD_CONN; $0005;  3128	; SV (133 --> 131) 
	macRUL	CMD_CONN; $0002;  3134	; J (133 --> 134) 
	macRUL	CMD_CONN; $0001;  3140	; S (134 --> 133) 
	macRUL	CMD_CONN; $0008;  3146	; JZ (134 --> 136) 
	macRUL	CMD_CONN; $0009;  3152	; G (134 --> 139) 
	macRUL	CMD_CONN; $0003;  3158	; V (135 --> 136) 
	macRUL	CMD_CONN; $0004;  3164	; Z (136 --> 135) 
	macRUL	CMD_CONN; $0006;  3170	; SZ (136 --> 134) 
	macRUL	CMD_CONN; $0002;  3176	; J (136 --> 138) 
	macRUL	CMD_CONN; $0003;  3182	; V (136 --> 137) 
	macRUL	CMD_CONN; $0005;  3188	; SV (136 --> 160) 
	macRUL	CMD_CONN; $0002;  3194	; J (137 --> 138) 
	macRUL	CMD_CONN; $0003;  3200	; V (137 --> 140) 
	macRUL	CMD_CONN; $0004;  3206	; Z (137 --> 136) 
	macRUL	CMD_CONN; $0001;  3212	; S (138 --> 136) 
	macRUL	CMD_CONN; $000A;  3218	; D (139 --> 134) 
	macRUL	CMD_CONN; $0002;  3224	; J (139 --> 137) 
	macRUL	CMD_CONN; $0002;  3230	; J (140 --> 137) 
	macRUL	CMD_CONN; $0005;  3236	; SV (140 --> 129) 
	macRUL	CMD_CONN; $0002;  3242	; J (147 --> 149) 
	macRUL	CMD_CONN; $0001;  3248	; S (148 --> 147) 
	macRUL	CMD_CONN; $0003;  3254	; V (148 --> 149) 
	macRUL	CMD_CONN; $0002;  3260	; J (148 --> 154) 
	macRUL	CMD_CONN; $0004;  3266	; Z (149 --> 148) 
	macRUL	CMD_CONN; $0007;  3272	; JV (149 --> 152) 
	macRUL	CMD_CONN; $0001;  3278	; S (149 --> 149) 
	macRUL	CMD_CONN; $0002;  3284	; J (149 --> 149) 
	macRUL	CMD_CONN; $0002;  3290	; J (150 --> 151) 
	macRUL	CMD_CONN; $0006;  3296	; SZ (150 --> 149) 
	macRUL	CMD_CONN; $0008;  3302	; JZ (151 --> 153) 
	macRUL	CMD_CONN; $0006;  3308	; SZ (151 --> 148) 
	macRUL	CMD_CONN; $0006;  3314	; SZ (152 --> 149) 
	macRUL	CMD_CONN; $0002;  3320	; J (152 --> 152) 
	macRUL	CMD_CONN; $0004;  3326	; Z (152 --> 152) 
	macRUL	CMD_CONN; $0007;  3332	; JV (152 --> 136) 
	macRUL	CMD_CONN; $0005;  3338	; SV (153 --> 151) 
	macRUL	CMD_CONN; $0006;  3344	; SZ (153 --> 153) 
	macRUL	CMD_CONN; $0002;  3350	; J (153 --> 159) 
	macRUL	CMD_CONN; $0005;  3356	; SV (154 --> 152) 
	macRUL	CMD_CONN; $0003;  3362	; V (154 --> 155) 
	macRUL	CMD_CONN; $0002;  3368	; J (154 --> 157) 
	macRUL	CMD_CONN; $000A;  3374	; D (155 --> 158) 
	macRUL	CMD_CONN; $0001;  3380	; S (156 --> 153) 
	macRUL	CMD_CONN; $0004;  3386	; Z (156 --> 156) 
	macRUL	CMD_CONN; $0004;  3392	; Z (157 --> 156) 
	macRUL	CMD_CONN; $0005;  3398	; SV (157 --> 155) 
	macRUL	CMD_CONN; $0008;  3404	; JZ (158 --> 157) 
	macRUL	CMD_CONN; $0004;  3410	; Z (160 --> 150) 
	macRUL	CMD_CONN; $0009;  3416	; G (160 --> 161) 
	macRUL	CMD_CONN; $0002;  3422	; J (160 --> 136) 
	macRUL	CMD_CONN; $0001;  3428	; S (163 --> 44) 
	macRUL	CMD_CONN; $0006;  3434	; SZ (163 --> 45) 
	macRUL	CMD_CONN; $0003;  3440	; V (164 --> 38) 
	macRUL	CMD_CONN; $0002;  3446	; J (164 --> 40) 
	macRUL	CMD_ACTI; $0001;  3452
	macRUL	CMD_ACTI; $0001;  3464
	macRUL	CMD_ACTI; $0001;  3474
	macRUL	CMD_ACTI; $0001;  3484
	macRUL	CMD_ACTI; $0001;  3496
	macRUL	CMD_ACTI; $0001;  3506
	macRUL	CMD_ACTI; $0001;  3516
	macRUL	CMD_ACTI; $0001;  3528
	macRUL	CMD_ACTI; $0001;  3538
	macRUL	CMD_ACTI; $0001;  3548
	macRUL	CMD_ACTI; $0001;  3560
	macRUL	CMD_ACTI; $0001;  3570
	macRUL	CMD_ACTI; $0001;  3580
	macRUL	CMD_ACTI; $0001;  3592
	macRUL	CMD_ACTI; $0001;  3602
	macRUL	CMD_ACTI; $0001;  3612
	macRUL	CMD_ACTI; $0001;  3624
	macRUL	CMD_ACTI; $0001;  3634
	macRUL	CMD_ACTI; $0001;  3644
	macRUL	CMD_ACTI; $0001;  3656
	macRUL	CMD_ACTI; $0001;  3666
	macRUL	CMD_ACTI; $0001;  3676
	macRUL	CMD_ACTI; $0001;  3688
	macRUL	CMD_ACTI; $0001;  3698
	macRUL	CMD_ACTI; $0002;  3708
	macRUL	CMD_ACTI; $0002;  3720
	macRUL	CMD_ACTI; $0002;  3730
	macRUL	CMD_ACTI; $0002;  3740
	macRUL	CMD_ACTI; $0002;  3752
	macRUL	CMD_ACTI; $0002;  3762
	macRUL	CMD_ACTI; $0002;  3772
	macRUL	CMD_ACTI; $0002;  3784
	macRUL	CMD_ACTI; $0002;  3794
	macRUL	CMD_ACTI; $0002;  3804
	macRUL	CMD_ACTI; $0002;  3816
	macRUL	CMD_ACTI; $0002;  3826
	macRUL	CMD_ACTI; $0002;  3836
	macRUL	CMD_ACTI; $0002;  3848
	macRUL	CMD_ACTI; $0002;  3858
	macRUL	CMD_ACTI; $0002;  3868
	macRUL	CMD_ACTI; $0002;  3880
	macRUL	CMD_ACTI; $0002;  3890
	macRUL	CMD_ACTI; $0002;  3900
	macRUL	CMD_ACTI; $0002;  3912
	macRUL	CMD_ACTI; $0002;  3922
	macRUL	CMD_ACTI; $0002;  3932
	macRUL	CMD_ACTI; $0002;  3944
	macRUL	CMD_ACTI; $0002;  3954
	macRUL	CMD_ACTI; $0002;  3964
	macRUL	CMD_ACTI; $0002;  3976
	macRUL	CMD_ACTI; $0002;  3986
	macRUL	CMD_ACTI; $0002;  3996
	macRUL	CMD_ACTI; $0002;  4004
	macRUL	CMD_ACTI; $0002;  4012
	macRUL	CMD_ACTI; $0003;  4024
	macRUL	CMD_ACTI; $0003;  4036
	macRUL	CMD_ACTI; $0003;  4046
	macRUL	CMD_ACTI; $0003;  4056
	macRUL	CMD_ACTI; $0003;  4068
	macRUL	CMD_ACTI; $0003;  4078
	macRUL	CMD_ACTI; $0003;  4088
	macRUL	CMD_ACTI; $0003;  4100
	macRUL	CMD_ACTI; $0003;  4110
	macRUL	CMD_ACTI; $0003;  4120
	macRUL	CMD_ACTI; $0003;  4132
	macRUL	CMD_ACTI; $0003;  4142
	macRUL	CMD_ACTI; $0003;  4152
	macRUL	CMD_ACTI; $0003;  4164
	macRUL	CMD_ACTI; $0003;  4174
	macRUL	CMD_ACTI; $0003;  4184
	macRUL	CMD_ACTI; $0003;  4196
	macRUL	CMD_ACTI; $0003;  4206
	macRUL	CMD_ACTI; $0003;  4216
	macRUL	CMD_ACTI; $0003;  4228
	macRUL	CMD_ACTI; $0003;  4238
	macRUL	CMD_ACTI; $0003;  4248
	macRUL	CMD_ACTI; $0003;  4260
	macRUL	CMD_ACTI; $0003;  4270
	macRUL	CMD_ACTI; $0003;  4280
	macRUL	CMD_ACTI; $0003;  4292
	macRUL	CMD_ACTI; $0003;  4302
	macRUL	CMD_ACTI; $0003;  4312
	macRUL	CMD_ACTI; $0003;  4324
	macRUL	CMD_ACTI; $0003;  4334
	macRUL	CMD_ACTI; $0003;  4344
	macRUL	CMD_ACTI; $0004;  4352
	macRUL	CMD_ACTI; $0004;  4364
	macRUL	CMD_ACTI; $0004;  4374
	macRUL	CMD_ACTI; $0004;  4384
	macRUL	CMD_ACTI; $0004;  4396
	macRUL	CMD_ACTI; $0004;  4406
	macRUL	CMD_ACTI; $0004;  4416
	macRUL	CMD_ACTI; $0004;  4428
	macRUL	CMD_ACTI; $0004;  4438
	macRUL	CMD_ACTI; $0004;  4448
	macRUL	CMD_ACTI; $0004;  4460
	macRUL	CMD_ACTI; $0004;  4470
	macRUL	CMD_ACTI; $0004;  4480
	macRUL	CMD_ACTI; $0004;  4492
	macRUL	CMD_ACTI; $0004;  4502
	macRUL	CMD_ACTI; $0004;  4512
	macRUL	CMD_ACTI; $0004;  4524
	macRUL	CMD_ACTI; $0004;  4534
	macRUL	CMD_ACTI; $0004;  4544
	macRUL	CMD_ACTI; $0004;  4556
	macRUL	CMD_ACTI; $0004;  4566
	macRUL	CMD_ACTI; $0004;  4576
	macRUL	CMD_ACTI; $0004;  4588
	macRUL	CMD_ACTI; $0004;  4598
	macRUL	CMD_ACTI; $0004;  4608
	macRUL	CMD_ACTI; $0004;  4620
	macRUL	CMD_ACTI; $0004;  4630
	macRUL	CMD_ACTI; $0004;  4640
	macRUL	CMD_ACTI; $0004;  4652
	macRUL	CMD_ACTI; $0004;  4662
	macRUL	CMD_ACTI; $0004;  4672
	macRUL	CMD_ACTI; $0004;  4680
	macRUL	CMD_ACTI; $0004;  4688
	macRUL	CMD_ACTI; $0004;  4696
	macRUL	CMD_ACTI; $0004;  4708
	macRUL	CMD_ACTI; $0004;  4718
	macRUL	CMD_ACTI; $0005;  4728
	macRUL	CMD_ACTI; $0005;  4740
	macRUL	CMD_ACTI; $0005;  4750
	macRUL	CMD_ACTI; $0005;  4760
	macRUL	CMD_ACTI; $0005;  4772
	macRUL	CMD_ACTI; $0005;  4782
	macRUL	CMD_ACTI; $0005;  4792
	macRUL	CMD_ACTI; $0005;  4804
	macRUL	CMD_ACTI; $0005;  4814
	macRUL	CMD_ACTI; $0005;  4824
	macRUL	CMD_ACTI; $0005;  4836
	macRUL	CMD_ACTI; $0005;  4846
	macRUL	CMD_ACTI; $0006;  4856
	macRUL	CMD_ACTI; $0006;  4868
	macRUL	CMD_ACTI; $0006;  4878
	macRUL	CMD_ACTI; $0006;  4888
	macRUL	CMD_ACTI; $0006;  4900
	macRUL	CMD_ACTI; $0006;  4910
	macRUL	CMD_ACTI; $0006;  4920
	macRUL	CMD_ACTI; $0007;  4928
	macRUL	CMD_ACTI; $0007;  4940
	macRUL	CMD_ACTI; $0007;  4950
	macRUL	CMD_ACTI; $0007;  4960
	macRUL	CMD_ACTI; $0007;  4972
	macRUL	CMD_ACTI; $0007;  4982
	macRUL	CMD_ACTI; $0007;  4992
	macRUL	CMD_ACTI; $0007;  5004
	macRUL	CMD_ACTI; $0007;  5014
	macRUL	CMD_ACTI; $0007;  5024
	macRUL	CMD_ACTI; $0008;  5038
	macRUL	CMD_ACTI; $0008;  5050
	macRUL	CMD_ACTI; $0008;  5060
	macRUL	CMD_ACTI; $0008;  5070
	macRUL	CMD_ACTI; $0008;  5082
	macRUL	CMD_ACTI; $0008;  5092
	macRUL	CMD_ACTI; $0008;  5102
	macRUL	CMD_ACTI; $0008;  5114
	macRUL	CMD_ACTI; $0008;  5124
	macRUL	CMD_ACTI; $0008;  5134
	macRUL	CMD_ACTI; $0008;  5146
	macRUL	CMD_ACTI; $0008;  5156
	macRUL	CMD_ACTI; $0009;  5166
	macRUL	CMD_ACTI; $0009;  5178
	macRUL	CMD_ACTI; $0009;  5188
	macRUL	CMD_ACTI; $0009;  5198
	macRUL	CMD_ACTI; $000A;  5206
	macRUL	CMD_ACTI; $000A;  5218
	macRUL	CMD_ACTI; $000A;  5228
	macRUL	CMD_ACTI; $000A;  5238
	macRUL	CMD_ACTI; $000A;  5250
	macRUL	CMD_ACTI; $000A;  5260
	macRUL	CMD_ACTI; $000A;  5270
	macRUL	CMD_ACTI; $000A;  5282
	macRUL	CMD_ACTI; $000A;  5292
	macRUL	CMD_ACTI; $000B;  5302
	macRUL	CMD_ACTI; $000B;  5314
	macRUL	CMD_ACTI; $000B;  5324
	macRUL	CMD_ACTI; $000B;  5334
	macRUL	CMD_ACTI; $000B;  5341
	macRUL	CMD_ACTI; $000B;  5348
	macRUL	CMD_ACTI; $000C;  5358
	macRUL	CMD_ACTI; $1011;  5366
	macRUL	CMD_ACTI; $1012;  5382
	macRUL	CMD_ACTI; $1112;  5386
	macRUL	CMD_ACTI; $1312;  5390
	macRUL	CMD_ACTI; $1312;  5396
	macRUL	CMD_ACTI; $1412;  5402
	macRUL	CMD_ACTI; $1612;  5406
	macRUL	CMD_ACTI; $1712;  5412
	macRUL	CMD_ACTI; $1812;  5416
	macRUL	CMD_ACTI; $1A12;  5420
	macRUL	CMD_ACTI; $1B12;  5426
	macRUL	CMD_ACTI; $1C12;  5430
	macRUL	CMD_ACTI; $1D12;  5434
	macRUL	CMD_ACTI; $1E12;  5438
	macRUL	CMD_ACTI; $1F12;  5442
	macRUL	CMD_ACTI; $2012;  5446
	macRUL	CMD_ACTI; $2212;  5450
	macRUL	CMD_ACTI; $2512;  5454
	macRUL	CMD_ACTI; $2512;  5458
	macRUL	CMD_ACTI; $2612;  5462
	macRUL	CMD_ACTI; $2712;  5466
	macRUL	CMD_ACTI; $2812;  5470
	macRUL	CMD_ACTI; $2912;  5474
	macRUL	CMD_ACTI; $2A12;  5478
	macRUL	CMD_ACTI; $2B12;  5482
	macRUL	CMD_ACTI; $2B12;  5488
	macRUL	CMD_ACTI; $2B12;  5494
	macRUL	CMD_ACTI; $2B12;  5505
	macRUL	CMD_ACTI; $2C12;  5516
	macRUL	CMD_ACTI; $2D12;  5520
	macRUL	CMD_ACTI; $2E12;  5524
	macRUL	CMD_ACTI; $2F12;  5528
	macRUL	CMD_ACTI; $2F12;  5534
	macRUL	CMD_ACTI; $3112;  5540
	macRUL	CMD_ACTI; $3212;  5544
	macRUL	CMD_ACTI; $3312;  5548
	macRUL	CMD_ACTI; $3412;  5552
	macRUL	CMD_ACTI; $3512;  5556
	macRUL	CMD_ACTI; $3512;  5562
	macRUL	CMD_ACTI; $3612;  5568
	macRUL	CMD_ACTI; $4012;  5572
	macRUL	CMD_ACTI; $4012;  5585
	macRUL	CMD_ACTI; $4012;  5598
	macRUL	CMD_ACTI; $4012;  5611
	macRUL	CMD_ACTI; $4712;  5622
	macRUL	CMD_ACTI; $4E12;  5631
	macRUL	CMD_ACTI; $5212;  5635
	macRUL	CMD_ACTI; $5312;  5639
	macRUL	CMD_ACTI; $9712;  5643
	macRUL	CMD_ACTI; $9812;  5649
	macRUL	CMD_ACTI; $9E12;  5652
	macRUL	CMD_ACTI; $A112;  5658
	macRUL	CMD_ACTI; $1617;  5662
	macRUL	CMD_ACTI; $4718;  5677
	macRUL	CMD_ACTI; $231C;  5695
	macRUL	CMD_ACTI; $1E1F;  5704
	macRUL	CMD_ACTI; $532D;  5711
	macRUL	CMD_ACTI; $3433;  5724
	macRUL	CMD_ACTI; $9834;  5733
	macRUL	CMD_ACTI; $1B36;  5746
	macRUL	CMD_ACTI; $2236;  5750
	macRUL	CMD_ACTI; $2A36;  5754
	macRUL	CMD_ACTI; $2D36;  5758
	macRUL	CMD_ACTI; $3636;  5763
	macRUL	CMD_ACTI; $A136;  5769
	macRUL	CMD_ACTI; $1B37;  5775
	macRUL	CMD_ACTI; $1B37;  5779
	macRUL	CMD_ACTI; $2237;  5783
	macRUL	CMD_ACTI; $2A37;  5787
	macRUL	CMD_ACTI; $3637;  5791
	macRUL	CMD_ACTI; $4837;  5795
	macRUL	CMD_ACTI; $A137;  5804
	macRUL	CMD_ACTI; $0038;  5808
	macRUL	CMD_ACTI; $0039;  5811
	macRUL	CMD_ACTI; $133B;  5815
	macRUL	CMD_ACTI; $133B;  5822
	macRUL	CMD_ACTI; $2F3B;  5833
	macRUL	CMD_ACTI; $103C;  5842
	macRUL	CMD_ACTI; $103C;  5846
	macRUL	CMD_ACTI; $103C;  5853
	macRUL	CMD_ACTI; $113C;  5861
	macRUL	CMD_ACTI; $133C;  5865
	macRUL	CMD_ACTI; $133C;  5871
	macRUL	CMD_ACTI; $143C;  5877
	macRUL	CMD_ACTI; $153C;  5881
	macRUL	CMD_ACTI; $163C;  5885
	macRUL	CMD_ACTI; $163C;  5889
	macRUL	CMD_ACTI; $163C;  5896
	macRUL	CMD_ACTI; $173C;  5904
	macRUL	CMD_ACTI; $183C;  5908
	macRUL	CMD_ACTI; $193C;  5912
	macRUL	CMD_ACTI; $1A3C;  5916
	macRUL	CMD_ACTI; $1B3C;  5921
	macRUL	CMD_ACTI; $1C3C;  5925
	macRUL	CMD_ACTI; $1D3C;  5929
	macRUL	CMD_ACTI; $1D3C;  5935
	macRUL	CMD_ACTI; $1E3C;  5944
	macRUL	CMD_ACTI; $1E3C;  5950
	macRUL	CMD_ACTI; $1E3C;  5965
	macRUL	CMD_ACTI; $1F3C;  5971
	macRUL	CMD_ACTI; $1F3C;  5977
	macRUL	CMD_ACTI; $203C;  5984
	macRUL	CMD_ACTI; $203C;  5990
	macRUL	CMD_ACTI; $213C;  6006
	macRUL	CMD_ACTI; $223C;  6010
	macRUL	CMD_ACTI; $233C;  6014
	macRUL	CMD_ACTI; $243C;  6018
	macRUL	CMD_ACTI; $243C;  6024
	macRUL	CMD_ACTI; $253C;  6029
	macRUL	CMD_ACTI; $253C;  6033
	macRUL	CMD_ACTI; $263C;  6037
	macRUL	CMD_ACTI; $273C;  6041
	macRUL	CMD_ACTI; $283C;  6045
	macRUL	CMD_ACTI; $283C;  6051
	macRUL	CMD_ACTI; $293C;  6059
	macRUL	CMD_ACTI; $293C;  6065
	macRUL	CMD_ACTI; $2A3C;  6073
	macRUL	CMD_ACTI; $2B3C;  6077
	macRUL	CMD_ACTI; $2B3C;  6085
	macRUL	CMD_ACTI; $2B3C;  6093
	macRUL	CMD_ACTI; $2C3C;  6099
	macRUL	CMD_ACTI; $2D3C;  6103
	macRUL	CMD_ACTI; $2D3C;  6107
	macRUL	CMD_ACTI; $2E3C;  6114
	macRUL	CMD_ACTI; $2F3C;  6118
	macRUL	CMD_ACTI; $2F3C;  6124
	macRUL	CMD_ACTI; $303C;  6130
	macRUL	CMD_ACTI; $313C;  6134
	macRUL	CMD_ACTI; $313C;  6138
	macRUL	CMD_ACTI; $323C;  6142
	macRUL	CMD_ACTI; $333C;  6146
	macRUL	CMD_ACTI; $343C;  6150
	macRUL	CMD_ACTI; $353C;  6154
	macRUL	CMD_ACTI; $353C;  6160
	macRUL	CMD_ACTI; $473C;  6166
	macRUL	CMD_ACTI; $483C;  6180
	macRUL	CMD_ACTI; $4E3C;  6184
	macRUL	CMD_ACTI; $523C;  6188
	macRUL	CMD_ACTI; $533C;  6192
	macRUL	CMD_ACTI; $533C;  6208
	macRUL	CMD_ACTI; $973C;  6214
	macRUL	CMD_ACTI; $983C;  6218
	macRUL	CMD_ACTI; $9D3C;  6222
	macRUL	CMD_ACTI; $9E3C;  6231
	macRUL	CMD_ACTI; $9E3C;  6237
	macRUL	CMD_ACTI; $A13C;  6245
	macRUL	CMD_ACTI; $A23C;  6249
	macRUL	CMD_ACTI; $003D;  6253
	macRUL	CMD_ACTI; $133E;  6255
	macRUL	CMD_ACTI; $2F3E;  6264
	macRUL	CMD_ACTI; $003F;  6273
	macRUL	CMD_ACTI; $003F;  6282
	macRUL	CMD_ACTI; $4042;  6299
	macRUL	CMD_ACTI; $4042;  6320
	macRUL	CMD_ACTI; $4544;  6334
	macRUL	CMD_ACTI; $1746;  6346
	macRUL	CMD_ACTI; $004B;  6363
	macRUL	CMD_ACTI; $004B;  6387
	macRUL	CMD_ACTI; $004B;  6405
	macRUL	CMD_ACTI; $004B;  6417
	macRUL	CMD_ACTI; $004B;  6438
	macRUL	CMD_ACTI; $4E4C;  6459
	macRUL	CMD_ACTI; $4D4F;  6469
	macRUL	CMD_ACTI; $4E50;  6476
	macRUL	CMD_ACTI; $4E51;  6487
	macRUL	CMD_ACTI; $4E51;  6501
	macRUL	CMD_ACTI; $4E51;  6514
	macRUL	CMD_ACTI; $0054;  6525
	macRUL	CMD_ACTI; $0056;  6535
	macRUL	CMD_ACTI; $0057;  6537
	macRUL	CMD_ACTI; $0057;  6549
	macRUL	CMD_ACTI; $0057;  6559
	macRUL	CMD_ACTI; $0068;  6569
	macRUL	CMD_ACTI; $006A;  6571
	macRUL	CMD_ACTI; $006B;  6666
	macRUL	CMD_ACTI; $006B;  6670
	macRUL	CMD_ACTI; $006C;  6675
	macRUL	CMD_ACTI; $2B96;  6677
	macRUL	CMD_ACTI; $2B96;  6689
	macRUL	CMD_ACTI; $2B96;  6698
	macRUL	CMD_ACTI; $3199;  6707
	macRUL	CMD_ACTI; $009C;  6711
	macRUL	CMD_ACTI; $2B9D;  6716
	macRUL	CMD_ACTI; $2B9D;  6727
	macRUL	CMD_ACTI; $2B9D;  6734
	macRUL	CMD_ACTI; $2B9D;  6745
	macRUL	CMD_ACTI; $009E;  6752
	macRUL	CMD_ACTI; $009E;  6761
	macRUL	CMD_ACTI; $009F;  6769

	macRUL	CMD_ACTI; $00A3;  6771	; ** new ** CASE (163)
	macRUL	CMD_ACTI; $00A4;  6773	; ** new ** HOME (164)
	macRUL	CMD_ACTI; $00A5;  6775	; ** new ** DEBU(G) (165)
	macRUL	CMD_ACTI; $00A6;  6777	; ** new ** SUMN(IKI) ACCENT (166)
	macRUL	CMD_CONN; $0004;  6779	; ** new ** Z (14 --> 15) 
	macRUL	CMD_CONN; $0003;  6789	; ** new ** V (15 --> 14) 

	hex	ff	; fin de table

tblFUNC
	db	FN_AT,0,FN_BEEP,20,116,FN_BEEP,20,118,FN_BEEP,20,120,FN_BEEP,40,136,FN_BEEP,20,120,FN_BEEP,40,136,FN_BEEP,20,120,FN_BEEP,120,136,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,20,142,FN_BEEP,20,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,40,144,FN_BEEP,20,134,FN_BEEP,40,140,FN_BEEP,140,136,FN_BEEP,20,116,FN_BEEP,20,118,FN_BEEP,20,120,FN_BEEP,40,136,FN_EOF
	db	FN_AT,0,FN_BEEP,20,120,FN_BEEP,40,136,FN_BEEP,20,120,FN_BEEP,140,136,FN_BEEP,20,130,FN_BEEP,20,126,FN_BEEP,20,124,FN_BEEP,20,130,FN_BEEP,20,136,FN_BEEP,40,144,FN_BEEP,20,140,FN_BEEP,20,136,FN_BEEP,20,130,FN_BEEP,120,140,FN_BEEP,20,116,FN_BEEP,20,118,FN_BEEP,20,120,FN_BEEP,40,136,FN_BEEP,20,120,FN_BEEP,40,136,FN_BEEP,20,120,FN_BEEP,120,136,FN_EOF
	db	FN_AT,0,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,20,142,FN_BEEP,20,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,40,144,FN_BEEP,20,134,FN_BEEP,40,140,FN_BEEP,120,136,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,20,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,40,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,20,136,FN_BEEP,20,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_EOF
	db	FN_AT,0,FN_BEEP,40,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,20,136,FN_BEEP,20,144,FN_BEEP,20,136,FN_BEEP,20,140,FN_BEEP,40,144,FN_BEEP,20,134,FN_BEEP,40,140,FN_BEEP,80,136,FN_BEEP,80,112,FN_ANYKEY,FN_GOTO,1,FN_DESC,FN_EOF
	db	FN_AT,116,FN_CARRIED,48,FN_DESTROY,48,FN_SET,12,FN_MESSAGE,61,FN_PLUS,30,5,FN_EOF
	db	FN_AT,162,FN_BEEP,9,134,FN_BEEP,13,134,FN_BEEP,9,134,FN_BEEP,9,130,FN_BEEP,9,130,FN_BEEP,34,126,FN_BEEP,13,134,FN_BEEP,13,134,FN_BEEP,13,130,FN_BEEP,13,120,FN_BEEP,50,126,FN_BEEP,13,134,FN_BEEP,13,134,FN_BEEP,13,140,FN_BEEP,13,134,FN_BEEP,13,144,FN_BEEP,13,140,FN_BEEP,13,134,FN_BEEP,13,126,FN_BEEP,9,134,FN_BEEP,22,134,FN_BEEP,9,130,FN_BEEP,9,130,FN_BEEP,34,126,FN_EOF
	db	FN_AT,88,FN_DESTROY,15,FN_EOF
	db	FN_AT,88,FN_DESTROY,22,FN_EOF
	db	FN_AT,140,FN_PRESENT,42,FN_BEEP,50,120,FN_BEEP,100,120,FN_BEEP,38,120,FN_BEEP,13,122,FN_BEEP,50,122,FN_BEEP,63,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,126,FN_BEEP,50,126,FN_BEEP,100,126,FN_BEEP,38,126,FN_BEEP,13,130,FN_BEEP,200,120,FN_BEEP,50,120,FN_BEEP,63,120,FN_BEEP,13,120,FN_BEEP,13,120,FN_EOF
	db	FN_AT,140,FN_PRESENT,42,FN_BEEP,13,120,FN_BEEP,13,120,FN_BEEP,13,120,FN_BEEP,13,120,FN_BEEP,13,122,FN_BEEP,50,122,FN_BEEP,63,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,122,FN_BEEP,13,126,FN_BEEP,50,126,FN_BEEP,100,126,FN_BEEP,38,126,FN_BEEP,13,130,FN_BEEP,100,120,FN_BEEP,13,122,FN_BEEP,13,106,FN_BEEP,13,112,FN_EOF
	db	FN_AT,140,FN_PRESENT,42,FN_BEEP,13,122,FN_BEEP,13,126,FN_BEEP,13,110,FN_BEEP,13,116,FN_BEEP,13,126,FN_BEEP,100,120,FN_BEEP,50,112,FN_BEEP,38,126,FN_BEEP,13,130,FN_BEEP,150,120,FN_EOF
	db	FN_AT,116,FN_ZERO,12,FN_CARRIED,26,FN_DESTROY,26,FN_MESSAGE,40,FN_SET,19,FN_EOF
	db	FN_AT,116,FN_ZERO,12,FN_CARRIED,51,FN_DESTROY,51,FN_MESSAGE,40,FN_SET,20,FN_EOF
	db	FN_NOTZERO,12,FN_NOTZERO,19,FN_ZERO,21,FN_AT,116,FN_CREATE,54,FN_GET,54,FN_MESSAGE,42,FN_SET,21,FN_EOF
	db	FN_AT,116,FN_NOTZERO,12,FN_NOTZERO,20,FN_ZERO,21,FN_CREATE,55,FN_GET,55,FN_MESSAGE,42,FN_SET,21,FN_EOF
	db	FN_AT,108,FN_CHANCE,50,FN_DESTROY,16,FN_MESSAGE,54,FN_EOF
	db	FN_AT,137,FN_CARRIED,42,FN_EQ,11,2,FN_MESSAGE,11,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,137,FN_CARRIED,42,FN_LT,11,2,FN_PLUS,30,5,FN_MESSAGE,9,FN_DROP,42,FN_CREATE,3,FN_GET,3,FN_EOF
	db	FN_NOTAT,1,FN_NOTAT,103,FN_NOTAT,29,FN_NOTAT,12,FN_NOTAT,132,FN_BEEP,10,100,FN_EOF
	db	FN_AT,123,FN_PRESENT,9,FN_NOTCARR,9,FN_CREATE,7,FN_DESTROY,9,FN_PLUS,30,5,FN_DESC,FN_EOF
	db	FN_AT,11,FN_MESSAGE,31,FN_EOF
	db	FN_AT,103,FN_BEEP,20,116,FN_BEEP,20,116,FN_BEEP,20,124,FN_BEEP,20,130,FN_BEEP,40,130,FN_BEEP,20,154,FN_BEEP,40,154,FN_BEEP,20,144,FN_BEEP,20,144,FN_BEEP,20,116,FN_BEEP,20,116,FN_BEEP,20,124,FN_BEEP,20,130,FN_BEEP,40,130,FN_BEEP,20,154,FN_BEEP,40,154,FN_EOF
	db	FN_AT,103,FN_BEEP,20,150,FN_BEEP,40,150,FN_BEEP,20,114,FN_BEEP,20,114,FN_BEEP,20,120,FN_BEEP,20,134,FN_BEEP,40,134,FN_BEEP,20,158,FN_BEEP,40,158,FN_BEEP,20,150,FN_BEEP,40,150,FN_BEEP,20,114,FN_BEEP,20,114,FN_BEEP,20,120,FN_BEEP,20,134,FN_BEEP,40,134,FN_BEEP,20,158,FN_BEEP,40,158,FN_BEEP,20,144,FN_BEEP,40,154,FN_BEEP,20,116,FN_BEEP,20,116,FN_BEEP,20,124,FN_BEEP,20,130,FN_BEEP,40,140,FN_BEEP,20,164,FN_BEEP,40,164,FN_EOF
	db	FN_AT,103,FN_BEEP,20,154,FN_BEEP,40,154,FN_BEEP,20,116,FN_BEEP,20,116,FN_BEEP,20,124,FN_BEEP,20,130,FN_BEEP,40,140,FN_BEEP,20,164,FN_BEEP,40,164,FN_BEEP,20,158,FN_BEEP,40,158,FN_BEEP,20,120,FN_BEEP,20,120,FN_BEEP,20,126,FN_BEEP,20,134,FN_BEEP,80,134,FN_BEEP,20,124,FN_EOF
	db	FN_AT,103,FN_BEEP,20,130,FN_BEEP,50,150,FN_BEEP,20,140,FN_BEEP,20,124,FN_BEEP,40,124,FN_BEEP,20,120,FN_BEEP,40,134,FN_BEEP,20,130,FN_BEEP,30,116,FN_BEEP,10,140,FN_BEEP,20,140,FN_BEEP,60,140,FN_EOF
	db	FN_AT,12,FN_BEEP,20,130,FN_BEEP,20,140,FN_BEEP,40,148,FN_BEEP,40,140,FN_BEEP,20,130,FN_BEEP,20,140,FN_BEEP,20,138,FN_BEEP,20,138,FN_EOF
	db	FN_AT,12,FN_BEEP,20,130,FN_BEEP,20,138,FN_BEEP,40,150,FN_BEEP,40,138,FN_BEEP,20,130,FN_BEEP,20,140,FN_BEEP,20,140,FN_BEEP,20,140,FN_EOF
	db	FN_AT,12,FN_BEEP,20,130,FN_BEEP,20,140,FN_BEEP,40,148,FN_BEEP,40,140,FN_BEEP,20,130,FN_BEEP,20,140,FN_BEEP,20,138,FN_BEEP,20,138,FN_BEEP,20,130,FN_BEEP,20,138,FN_BEEP,40,150,FN_BEEP,40,138,FN_BEEP,20,130,FN_BEEP,20,138,FN_BEEP,40,140,FN_EOF
	db	FN_AT,29,FN_BEEP,20,144,FN_BEEP,20,140,FN_BEEP,40,136,FN_BEEP,40,130,FN_BEEP,40,126,FN_BEEP,20,130,FN_BEEP,100,126,FN_BEEP,40,126,FN_BEEP,20,144,FN_BEEP,100,140,FN_BEEP,40,126,FN_BEEP,20,140,FN_BEEP,60,136,FN_BEEP,20,144,FN_BEEP,20,140,FN_BEEP,40,136,FN_BEEP,40,130,FN_BEEP,40,126,FN_BEEP,20,130,FN_BEEP,100,126,FN_BEEP,40,126,FN_BEEP,20,144,FN_BEEP,100,140,FN_BEEP,40,126,FN_BEEP,20,140,FN_BEEP,80,136,FN_EOF
	db	FN_AT,32,FN_CARRIED,26,FN_MESSAGE,50,FN_PAUSE,200,FN_DESTROY,26,FN_GOTO,1,FN_DESC,FN_EOF
	db	FN_AT,139,FN_CARRIED,46,FN_CARRIED,18,FN_SWAP,46,17,FN_DESTROY,18,FN_PLUS,30,5,FN_MESSAGE,32,FN_EOF
	db	FN_AT,139,FN_CARRIED,18,FN_NOTCARR,46,FN_DESTROY,18,FN_MESSAGE,32,FN_INVEN,FN_EOF
	db	FN_AT,122,FN_NOTCARR,22,FN_MESSAGE,52,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,32,FN_CARRIED,51,FN_MESSAGE,51,FN_DESTROY,51,FN_GOTO,18,FN_EOF
	db	FN_AT,32,FN_CARRIED,55,FN_MESSAGE,51,FN_DESTROY,55,FN_GOTO,18,FN_EOF
	db	FN_AT,132,FN_BEEP,40,136,FN_BEEP,20,132,FN_BEEP,40,130,FN_BEEP,20,130,FN_BEEP,20,130,FN_BEEP,20,126,FN_BEEP,20,130,FN_BEEP,40,132,FN_BEEP,20,126,FN_BEEP,40,140,FN_BEEP,20,136,FN_BEEP,40,132,FN_BEEP,20,132,FN_BEEP,20,132,FN_BEEP,20,130,FN_BEEP,20,132,FN_BEEP,40,136,FN_EOF
	db	FN_AT,132,FN_BEEP,20,130,FN_BEEP,40,136,FN_BEEP,20,132,FN_BEEP,40,130,FN_BEEP,20,130,FN_BEEP,20,130,FN_BEEP,20,126,FN_BEEP,20,130,FN_BEEP,40,132,FN_BEEP,20,126,FN_BEEP,40,140,FN_BEEP,20,136,FN_BEEP,40,144,FN_BEEP,20,140,FN_BEEP,20,136,FN_BEEP,20,136,FN_BEEP,20,132,FN_BEEP,20,130,FN_EOF
	db	FN_CARRIED,49,FN_CARRIED,37,FN_SWAP,37,50,FN_DESTROY,49,FN_PLUS,30,5,FN_EOF
	db	FN_AT,32,FN_NOTCARR,50,FN_MESSAGE,53,FN_GOTO,18,FN_PAUSE,200,FN_DESC,FN_EOF
	db	FN_AT,32,FN_NOTCARR,13,FN_MESSAGE,53,FN_PAUSE,200,FN_GOTO,18,FN_DESC,FN_EOF
	db	FN_AT,126,FN_CARRIED,42,FN_ABSENT,27,FN_MESSAGE,17,FN_DROP,42,FN_EOF
	db	FN_AT,140,FN_CARRIED,42,FN_ZERO,11,FN_MESSAGE,14,FN_EOF
	db	FN_AT,125,FN_PRESENT,42,FN_EQ,11,2,FN_LET,11,1,FN_EOF
	db	FN_PRESENT,42,FN_NOTWORN,41,FN_MESSAGE,0,FN_EOF
	db	FN_AT,2,FN_PRESENT,40,FN_NOTWORN,40,FN_GET,40,FN_WEAR,40,FN_MESSAGE,23,FN_INVEN,FN_EOF
	db	FN_AT,155,FN_WORN,17,FN_MESSAGE,34,FN_EOF
	db	FN_AT,155,FN_NOTWORN,17,FN_MESSAGE,35,FN_MESSAGE,7,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_AT,1,FN_PRESENT,1,FN_PRESENT,5,FN_PRESENT,54,FN_EQ,30,85,FN_GOTO,162,FN_EOF
	db	FN_AT,162,FN_MESSAGE,55,FN_MESSAGE,63,FN_PLUS,30,15,FN_MESSAGE,7,FN_TURNS,FN_SCORE,FN_EOF
	db	FN_AT,161,FN_MESSAGE,7,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_CARRIED,49,FN_CARRIED,37,FN_DESTROY,49,FN_DESTROY,37,FN_CREATE,50,FN_GET,50,FN_EOF
	db	FN_AT,32,FN_CARRIED,26,FN_DESTROY,26,FN_MESSAGE,53,FN_OK,FN_EOF
	db	FN_AT,32,FN_CARRIED,51,FN_DESTROY,51,FN_MESSAGE,51,FN_PAUSE,150,FN_GOTO,65,FN_EOF
	db	FN_NOTZERO,12,FN_CARRIED,26,FN_SWAP,26,54,FN_EOF
	db	FN_NOTZERO,12,FN_CARRIED,51,FN_SWAP,51,55,FN_EOF

* CMD_CONN

	db	FN_AT,0,FN_GOTO,1,FN_DESC,FN_EOF
	db	FN_AT,1,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,1,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,7,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,6,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,4,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,3,FN_DESC,FN_EOF
	db	FN_AT,2,FN_GOTO,10,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,10,FN_DESC,FN_EOF
	db	FN_AT,3,FN_GOTO,11,FN_DESC,FN_EOF
	db	FN_AT,4,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,4,FN_GOTO,8,FN_DESC,FN_EOF
	db	FN_AT,4,FN_GOTO,29,FN_DESC,FN_EOF
	db	FN_AT,5,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,5,FN_GOTO,8,FN_DESC,FN_EOF
	db	FN_AT,5,FN_GOTO,30,FN_DESC,FN_EOF
	db	FN_AT,5,FN_GOTO,31,FN_DESC,FN_EOF
	db	FN_AT,5,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,6,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,7,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,7,FN_GOTO,20,FN_DESC,FN_EOF
	db	FN_AT,7,FN_GOTO,9,FN_DESC,FN_EOF
	db	FN_AT,8,FN_GOTO,4,FN_DESC,FN_EOF
	db	FN_AT,8,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,9,FN_GOTO,20,FN_DESC,FN_EOF
	db	FN_AT,9,FN_GOTO,7,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,11,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,3,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,10,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,11,FN_GOTO,10,FN_DESC,FN_EOF
	db	FN_AT,11,FN_GOTO,3,FN_DESC,FN_EOF
	db	FN_AT,12,FN_GOTO,18,FN_DESC,FN_EOF
	db	FN_AT,12,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,12,FN_GOTO,10,FN_DESC,FN_EOF
	db	FN_AT,12,FN_GOTO,13,FN_DESC,FN_EOF
	db	FN_AT,13,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,13,FN_GOTO,14,FN_DESC,FN_EOF
	db	FN_AT,14,FN_GOTO,13,FN_DESC,FN_EOF
	db	FN_AT,14,FN_GOTO,17,FN_DESC,FN_EOF
	db	FN_AT,14,FN_GOTO,16,FN_DESC,FN_EOF
	db	FN_AT,16,FN_GOTO,17,FN_DESC,FN_EOF
	db	FN_AT,16,FN_GOTO,14,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,18,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,14,FN_DESC,FN_EOF
	db	FN_AT,17,FN_GOTO,16,FN_DESC,FN_EOF
	db	FN_AT,18,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,18,FN_GOTO,17,FN_DESC,FN_EOF
	db	FN_AT,18,FN_GOTO,32,FN_DESC,FN_EOF
	db	FN_AT,19,FN_GOTO,12,FN_DESC,FN_EOF
	db	FN_AT,19,FN_GOTO,20,FN_DESC,FN_EOF
	db	FN_AT,20,FN_GOTO,19,FN_DESC,FN_EOF
	db	FN_AT,20,FN_GOTO,21,FN_DESC,FN_EOF
	db	FN_AT,20,FN_GOTO,9,FN_DESC,FN_EOF
	db	FN_AT,21,FN_GOTO,20,FN_DESC,FN_EOF
	db	FN_AT,21,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,22,FN_GOTO,23,FN_DESC,FN_EOF
	db	FN_AT,22,FN_GOTO,33,FN_DESC,FN_EOF
	db	FN_AT,22,FN_GOTO,21,FN_DESC,FN_EOF
	db	FN_AT,23,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,23,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,24,FN_GOTO,23,FN_DESC,FN_EOF
	db	FN_AT,24,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,24,FN_GOTO,25,FN_DESC,FN_EOF
	db	FN_AT,24,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,24,FN_GOTO,34,FN_DESC,FN_EOF
	db	FN_AT,25,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,26,FN_GOTO,24,FN_DESC,FN_EOF
	db	FN_AT,26,FN_GOTO,34,FN_DESC,FN_EOF
	db	FN_AT,26,FN_GOTO,27,FN_DESC,FN_EOF
	db	FN_AT,27,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,28,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,28,FN_GOTO,51,FN_DESC,FN_EOF
	db	FN_AT,28,FN_GOTO,31,FN_DESC,FN_EOF
	db	FN_AT,28,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,28,FN_GOTO,2,FN_DESC,FN_EOF
	db	FN_AT,29,FN_GOTO,4,FN_DESC,FN_EOF
	db	FN_AT,30,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,30,FN_GOTO,31,FN_DESC,FN_EOF
	db	FN_AT,30,FN_GOTO,61,FN_DESC,FN_EOF
	db	FN_AT,31,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,31,FN_GOTO,30,FN_DESC,FN_EOF
	db	FN_AT,31,FN_GOTO,5,FN_DESC,FN_EOF
	db	FN_AT,32,FN_GOTO,18,FN_DESC,FN_EOF
	db	FN_AT,33,FN_GOTO,22,FN_DESC,FN_EOF
	db	FN_AT,33,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,34,FN_GOTO,26,FN_DESC,FN_EOF
	db	FN_AT,34,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,35,FN_GOTO,37,FN_DESC,FN_EOF
	db	FN_AT,36,FN_GOTO,33,FN_DESC,FN_EOF
	db	FN_AT,36,FN_GOTO,47,FN_DESC,FN_EOF
	db	FN_AT,36,FN_GOTO,37,FN_DESC,FN_EOF
	db	FN_AT,36,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,37,FN_GOTO,35,FN_DESC,FN_EOF
	db	FN_AT,37,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,37,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,38,FN_GOTO,37,FN_DESC,FN_EOF
	db	FN_AT,38,FN_GOTO,39,FN_DESC,FN_EOF
	db	FN_AT,38,FN_GOTO,49,FN_DESC,FN_EOF
	db	FN_AT,38,FN_GOTO,164,FN_DESC,FN_EOF
	db	FN_AT,39,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,39,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,39,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,40,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,40,FN_GOTO,39,FN_DESC,FN_EOF
	db	FN_AT,41,FN_GOTO,39,FN_DESC,FN_EOF
	db	FN_AT,41,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,41,FN_GOTO,44,FN_DESC,FN_EOF
	db	FN_AT,41,FN_GOTO,45,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,44,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,43,FN_DESC,FN_EOF
	db	FN_AT,42,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,43,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,44,FN_GOTO,42,FN_DESC,FN_EOF
	db	FN_AT,44,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,44,FN_GOTO,45,FN_DESC,FN_EOF
	db	FN_AT,44,FN_GOTO,163,FN_DESC,FN_EOF
	db	FN_AT,45,FN_GOTO,44,FN_DESC,FN_EOF
	db	FN_AT,45,FN_GOTO,41,FN_DESC,FN_EOF
	db	FN_AT,46,FN_GOTO,47,FN_DESC,FN_EOF
	db	FN_AT,46,FN_GOTO,48,FN_DESC,FN_EOF
	db	FN_AT,46,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,47,FN_GOTO,46,FN_DESC,FN_EOF
	db	FN_AT,47,FN_GOTO,48,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,47,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,46,FN_DESC,FN_EOF
	db	FN_AT,48,FN_GOTO,50,FN_DESC,FN_EOF
	db	FN_AT,49,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,49,FN_GOTO,55,FN_DESC,FN_EOF
	db	FN_AT,50,FN_GOTO,51,FN_DESC,FN_EOF
	db	FN_AT,50,FN_GOTO,48,FN_DESC,FN_EOF
	db	FN_AT,51,FN_GOTO,53,FN_DESC,FN_EOF
	db	FN_AT,51,FN_GOTO,50,FN_DESC,FN_EOF
	db	FN_AT,51,FN_GOTO,28,FN_DESC,FN_EOF
	db	FN_AT,51,FN_GOTO,36,FN_DESC,FN_EOF
	db	FN_AT,52,FN_GOTO,53,FN_DESC,FN_EOF
	db	FN_AT,53,FN_GOTO,52,FN_DESC,FN_EOF
	db	FN_AT,53,FN_GOTO,51,FN_DESC,FN_EOF
	db	FN_AT,54,FN_GOTO,60,FN_DESC,FN_EOF
	db	FN_AT,54,FN_GOTO,55,FN_DESC,FN_EOF
	db	FN_AT,55,FN_GOTO,49,FN_DESC,FN_EOF
	db	FN_AT,55,FN_GOTO,54,FN_DESC,FN_EOF
	db	FN_AT,55,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,56,FN_GOTO,57,FN_DESC,FN_EOF
	db	FN_AT,56,FN_GOTO,55,FN_DESC,FN_EOF
	db	FN_AT,57,FN_GOTO,58,FN_DESC,FN_EOF
	db	FN_AT,57,FN_GOTO,56,FN_DESC,FN_EOF
	db	FN_AT,58,FN_GOTO,59,FN_DESC,FN_EOF
	db	FN_AT,58,FN_GOTO,57,FN_DESC,FN_EOF
	db	FN_AT,59,FN_GOTO,58,FN_DESC,FN_EOF
	db	FN_AT,59,FN_GOTO,60,FN_DESC,FN_EOF
	db	FN_AT,60,FN_GOTO,59,FN_DESC,FN_EOF
	db	FN_AT,60,FN_GOTO,54,FN_DESC,FN_EOF
	db	FN_AT,60,FN_GOTO,61,FN_DESC,FN_EOF
	db	FN_AT,61,FN_GOTO,60,FN_DESC,FN_EOF
	db	FN_AT,61,FN_GOTO,30,FN_DESC,FN_EOF
	db	FN_AT,61,FN_GOTO,62,FN_DESC,FN_EOF
	db	FN_AT,62,FN_GOTO,61,FN_DESC,FN_EOF
	db	FN_AT,62,FN_GOTO,75,FN_DESC,FN_EOF
	db	FN_AT,63,FN_GOTO,64,FN_DESC,FN_EOF
	db	FN_AT,64,FN_GOTO,64,FN_DESC,FN_EOF
	db	FN_AT,64,FN_GOTO,65,FN_DESC,FN_EOF
	db	FN_AT,64,FN_GOTO,65,FN_DESC,FN_EOF
	db	FN_AT,64,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,65,FN_GOTO,64,FN_DESC,FN_EOF
	db	FN_AT,65,FN_GOTO,65,FN_DESC,FN_EOF
	db	FN_AT,65,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,66,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,66,FN_GOTO,66,FN_DESC,FN_EOF
	db	FN_AT,66,FN_GOTO,64,FN_DESC,FN_EOF
	db	FN_AT,73,FN_GOTO,80,FN_DESC,FN_EOF
	db	FN_AT,73,FN_GOTO,78,FN_DESC,FN_EOF
	db	FN_AT,73,FN_GOTO,76,FN_DESC,FN_EOF
	db	FN_AT,74,FN_GOTO,74,FN_DESC,FN_EOF
	db	FN_AT,75,FN_GOTO,62,FN_DESC,FN_EOF
	db	FN_AT,75,FN_GOTO,78,FN_DESC,FN_EOF
	db	FN_AT,75,FN_GOTO,77,FN_DESC,FN_EOF
	db	FN_AT,76,FN_GOTO,77,FN_DESC,FN_EOF
	db	FN_AT,76,FN_GOTO,73,FN_DESC,FN_EOF
	db	FN_AT,77,FN_GOTO,75,FN_DESC,FN_EOF
	db	FN_AT,77,FN_GOTO,76,FN_DESC,FN_EOF
	db	FN_AT,78,FN_GOTO,78,FN_DESC,FN_EOF
	db	FN_AT,78,FN_GOTO,73,FN_DESC,FN_EOF
	db	FN_AT,78,FN_GOTO,75,FN_DESC,FN_EOF
	db	FN_AT,79,FN_GOTO,82,FN_DESC,FN_EOF
	db	FN_AT,80,FN_GOTO,81,FN_DESC,FN_EOF
	db	FN_AT,80,FN_GOTO,82,FN_DESC,FN_EOF
	db	FN_AT,80,FN_GOTO,73,FN_DESC,FN_EOF
	db	FN_AT,81,FN_GOTO,81,FN_DESC,FN_EOF
	db	FN_AT,81,FN_GOTO,80,FN_DESC,FN_EOF
	db	FN_AT,82,FN_GOTO,81,FN_DESC,FN_EOF
	db	FN_AT,82,FN_GOTO,80,FN_DESC,FN_EOF
	db	FN_AT,83,FN_GOTO,84,FN_DESC,FN_EOF
	db	FN_AT,83,FN_GOTO,85,FN_DESC,FN_EOF
	db	FN_AT,84,FN_GOTO,83,FN_DESC,FN_EOF
	db	FN_AT,84,FN_GOTO,84,FN_DESC,FN_EOF
	db	FN_AT,85,FN_GOTO,85,FN_DESC,FN_EOF
	db	FN_AT,85,FN_GOTO,83,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,87,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,124,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,123,FN_DESC,FN_EOF
	db	FN_AT,86,FN_GOTO,131,FN_DESC,FN_EOF
	db	FN_AT,87,FN_GOTO,88,FN_DESC,FN_EOF
	db	FN_AT,87,FN_GOTO,132,FN_DESC,FN_EOF
	db	FN_AT,87,FN_GOTO,86,FN_DESC,FN_EOF
	db	FN_AT,88,FN_GOTO,133,FN_DESC,FN_EOF
	db	FN_AT,96,FN_GOTO,98,FN_DESC,FN_EOF
	db	FN_AT,97,FN_GOTO,96,FN_DESC,FN_EOF
	db	FN_AT,98,FN_GOTO,100,FN_DESC,FN_EOF
	db	FN_AT,98,FN_GOTO,96,FN_DESC,FN_EOF
	db	FN_AT,98,FN_GOTO,101,FN_DESC,FN_EOF
	db	FN_AT,99,FN_GOTO,100,FN_DESC,FN_EOF
	db	FN_AT,100,FN_GOTO,99,FN_DESC,FN_EOF
	db	FN_AT,100,FN_GOTO,101,FN_DESC,FN_EOF
	db	FN_AT,100,FN_GOTO,98,FN_DESC,FN_EOF
	db	FN_AT,101,FN_GOTO,100,FN_DESC,FN_EOF
	db	FN_AT,101,FN_GOTO,98,FN_DESC,FN_EOF
	db	FN_AT,101,FN_GOTO,103,FN_DESC,FN_EOF
	db	FN_AT,101,FN_GOTO,104,FN_DESC,FN_EOF
	db	FN_AT,102,FN_GOTO,104,FN_DESC,FN_EOF
	db	FN_AT,103,FN_GOTO,104,FN_DESC,FN_EOF
	db	FN_AT,103,FN_GOTO,101,FN_DESC,FN_EOF
	db	FN_AT,104,FN_GOTO,101,FN_DESC,FN_EOF
	db	FN_AT,104,FN_GOTO,103,FN_DESC,FN_EOF
	db	FN_AT,104,FN_GOTO,105,FN_DESC,FN_EOF
	db	FN_AT,104,FN_GOTO,106,FN_DESC,FN_EOF
	db	FN_AT,104,FN_GOTO,102,FN_DESC,FN_EOF
	db	FN_AT,105,FN_GOTO,104,FN_DESC,FN_EOF
	db	FN_AT,105,FN_GOTO,106,FN_DESC,FN_EOF
	db	FN_AT,105,FN_GOTO,107,FN_DESC,FN_EOF
	db	FN_AT,106,FN_GOTO,105,FN_DESC,FN_EOF
	db	FN_AT,106,FN_GOTO,104,FN_DESC,FN_EOF
	db	FN_AT,106,FN_GOTO,107,FN_DESC,FN_EOF
	db	FN_AT,107,FN_GOTO,106,FN_DESC,FN_EOF
	db	FN_AT,107,FN_GOTO,105,FN_DESC,FN_EOF
	db	FN_AT,108,FN_GOTO,100,FN_DESC,FN_EOF
	db	FN_AT,115,FN_GOTO,117,FN_DESC,FN_EOF
	db	FN_AT,116,FN_GOTO,115,FN_DESC,FN_EOF
	db	FN_AT,116,FN_GOTO,119,FN_DESC,FN_EOF
	db	FN_AT,117,FN_GOTO,115,FN_DESC,FN_EOF
	db	FN_AT,117,FN_GOTO,118,FN_DESC,FN_EOF
	db	FN_AT,118,FN_GOTO,121,FN_DESC,FN_EOF
	db	FN_AT,118,FN_GOTO,117,FN_DESC,FN_EOF
	db	FN_AT,119,FN_GOTO,122,FN_DESC,FN_EOF
	db	FN_AT,119,FN_GOTO,116,FN_DESC,FN_EOF
	db	FN_AT,120,FN_GOTO,121,FN_DESC,FN_EOF
	db	FN_AT,121,FN_GOTO,120,FN_DESC,FN_EOF
	db	FN_AT,121,FN_GOTO,123,FN_DESC,FN_EOF
	db	FN_AT,121,FN_GOTO,122,FN_DESC,FN_EOF
	db	FN_AT,121,FN_GOTO,118,FN_DESC,FN_EOF
	db	FN_AT,121,FN_GOTO,130,FN_DESC,FN_EOF
	db	FN_AT,122,FN_GOTO,121,FN_DESC,FN_EOF
	db	FN_AT,122,FN_GOTO,119,FN_DESC,FN_EOF
	db	FN_AT,123,FN_GOTO,121,FN_DESC,FN_EOF
	db	FN_AT,123,FN_GOTO,132,FN_DESC,FN_EOF
	db	FN_AT,123,FN_GOTO,124,FN_DESC,FN_EOF
	db	FN_AT,123,FN_GOTO,86,FN_DESC,FN_EOF
	db	FN_AT,124,FN_GOTO,86,FN_DESC,FN_EOF
	db	FN_AT,124,FN_GOTO,125,FN_DESC,FN_EOF
	db	FN_AT,124,FN_GOTO,123,FN_DESC,FN_EOF
	db	FN_AT,125,FN_GOTO,124,FN_DESC,FN_EOF
	db	FN_AT,125,FN_GOTO,126,FN_DESC,FN_EOF
	db	FN_AT,126,FN_GOTO,125,FN_DESC,FN_EOF
	db	FN_AT,126,FN_GOTO,127,FN_DESC,FN_EOF
	db	FN_AT,127,FN_GOTO,126,FN_DESC,FN_EOF
	db	FN_AT,127,FN_GOTO,129,FN_DESC,FN_EOF
	db	FN_AT,128,FN_GOTO,127,FN_DESC,FN_EOF
	db	FN_AT,129,FN_GOTO,127,FN_DESC,FN_EOF
	db	FN_AT,129,FN_GOTO,140,FN_DESC,FN_EOF
	db	FN_AT,130,FN_GOTO,121,FN_DESC,FN_EOF
	db	FN_AT,131,FN_GOTO,86,FN_DESC,FN_EOF
	db	FN_AT,131,FN_GOTO,133,FN_DESC,FN_EOF
	db	FN_AT,132,FN_GOTO,123,FN_DESC,FN_EOF
	db	FN_AT,132,FN_GOTO,87,FN_DESC,FN_EOF
	db	FN_AT,133,FN_GOTO,131,FN_DESC,FN_EOF
	db	FN_AT,133,FN_GOTO,134,FN_DESC,FN_EOF
	db	FN_AT,134,FN_GOTO,133,FN_DESC,FN_EOF
	db	FN_AT,134,FN_GOTO,136,FN_DESC,FN_EOF
	db	FN_AT,134,FN_GOTO,139,FN_DESC,FN_EOF
	db	FN_AT,135,FN_GOTO,136,FN_DESC,FN_EOF
	db	FN_AT,136,FN_GOTO,135,FN_DESC,FN_EOF
	db	FN_AT,136,FN_GOTO,134,FN_DESC,FN_EOF
	db	FN_AT,136,FN_GOTO,138,FN_DESC,FN_EOF
	db	FN_AT,136,FN_GOTO,137,FN_DESC,FN_EOF
	db	FN_AT,136,FN_GOTO,160,FN_DESC,FN_EOF
	db	FN_AT,137,FN_GOTO,138,FN_DESC,FN_EOF
	db	FN_AT,137,FN_GOTO,140,FN_DESC,FN_EOF
	db	FN_AT,137,FN_GOTO,136,FN_DESC,FN_EOF
	db	FN_AT,138,FN_GOTO,136,FN_DESC,FN_EOF
	db	FN_AT,139,FN_GOTO,134,FN_DESC,FN_EOF
	db	FN_AT,139,FN_GOTO,137,FN_DESC,FN_EOF
	db	FN_AT,140,FN_GOTO,137,FN_DESC,FN_EOF
	db	FN_AT,140,FN_GOTO,129,FN_DESC,FN_EOF
	db	FN_AT,147,FN_GOTO,149,FN_DESC,FN_EOF
	db	FN_AT,148,FN_GOTO,147,FN_DESC,FN_EOF
	db	FN_AT,148,FN_GOTO,149,FN_DESC,FN_EOF
	db	FN_AT,148,FN_GOTO,154,FN_DESC,FN_EOF
	db	FN_AT,149,FN_GOTO,148,FN_DESC,FN_EOF
	db	FN_AT,149,FN_GOTO,152,FN_DESC,FN_EOF
	db	FN_AT,149,FN_GOTO,149,FN_DESC,FN_EOF
	db	FN_AT,149,FN_GOTO,149,FN_DESC,FN_EOF
	db	FN_AT,150,FN_GOTO,151,FN_DESC,FN_EOF
	db	FN_AT,150,FN_GOTO,149,FN_DESC,FN_EOF
	db	FN_AT,151,FN_GOTO,153,FN_DESC,FN_EOF
	db	FN_AT,151,FN_GOTO,148,FN_DESC,FN_EOF
	db	FN_AT,152,FN_GOTO,149,FN_DESC,FN_EOF
	db	FN_AT,152,FN_GOTO,152,FN_DESC,FN_EOF
	db	FN_AT,152,FN_GOTO,152,FN_DESC,FN_EOF
	db	FN_AT,152,FN_GOTO,136,FN_DESC,FN_EOF
	db	FN_AT,153,FN_GOTO,151,FN_DESC,FN_EOF
	db	FN_AT,153,FN_GOTO,153,FN_DESC,FN_EOF
	db	FN_AT,153,FN_GOTO,159,FN_DESC,FN_EOF
	db	FN_AT,154,FN_GOTO,152,FN_DESC,FN_EOF
	db	FN_AT,154,FN_GOTO,155,FN_DESC,FN_EOF
	db	FN_AT,154,FN_GOTO,157,FN_DESC,FN_EOF
	db	FN_AT,155,FN_GOTO,158,FN_DESC,FN_EOF
	db	FN_AT,156,FN_GOTO,153,FN_DESC,FN_EOF
	db	FN_AT,156,FN_GOTO,156,FN_DESC,FN_EOF
	db	FN_AT,157,FN_GOTO,156,FN_DESC,FN_EOF
	db	FN_AT,157,FN_GOTO,155,FN_DESC,FN_EOF
	db	FN_AT,158,FN_GOTO,157,FN_DESC,FN_EOF
	db	FN_AT,160,FN_GOTO,150,FN_DESC,FN_EOF
	db	FN_AT,160,FN_GOTO,161,FN_DESC,FN_EOF
	db	FN_AT,160,FN_GOTO,136,FN_DESC,FN_EOF
	db	FN_AT,163,FN_GOTO,44,FN_DESC,FN_EOF
	db	FN_AT,163,FN_GOTO,45,FN_DESC,FN_EOF
	db	FN_AT,164,FN_GOTO,38,FN_DESC,FN_EOF
	db	FN_AT,164,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,67,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,67,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,67,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,60,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,60,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,60,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,110,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,110,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,110,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,110,FN_DESC,FN_EOF
	db	FN_AT,113,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,113,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,113,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,89,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,89,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,89,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,90,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,94,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,94,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,94,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,32,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,32,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,32,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,68,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,68,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,68,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,69,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,69,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,69,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,71,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,71,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,71,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,143,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,145,FN_DESC,FN_EOF
	db	FN_AT,143,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,145,FN_DESC,FN_EOF
	db	FN_AT,143,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,145,FN_DESC,FN_EOF
	db	FN_AT,110,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,114,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,90,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,89,FN_DESC,FN_EOF
	db	FN_AT,93,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,93,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,93,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,95,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,95,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,95,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,67,FN_CLEAR,0,FN_GOTO,60,FN_DESC,FN_EOF
	db	FN_AT,89,FN_CLEAR,0,FN_GOTO,32,FN_DESC,FN_EOF
	db	FN_CARRIED,42,FN_AT,140,FN_LT,11,2,FN_MESSAGE,15,FN_DROP,42,FN_EOF
	db	FN_AT,70,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,70,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,70,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,67,FN_DESC,FN_EOF
	db	FN_AT,141,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,142,FN_DESC,FN_EOF
	db	FN_AT,141,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,142,FN_DESC,FN_EOF
	db	FN_AT,141,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,142,FN_DESC,FN_EOF
	db	FN_AT,144,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,145,FN_DESC,FN_EOF
	db	FN_AT,144,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,145,FN_DESC,FN_EOF
	db	FN_AT,144,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,145,FN_DESC,FN_EOF
	db	FN_AT,145,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,143,FN_DESC,FN_EOF
	db	FN_AT,145,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,143,FN_DESC,FN_EOF
	db	FN_AT,145,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,143,FN_DESC,FN_EOF
	db	FN_AT,114,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,90,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,92,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,92,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,92,FN_DESC,FN_EOF
	db	FN_AT,91,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,91,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,91,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,93,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,93,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,93,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,94,FN_DESC,FN_EOF
	db	FN_AT,73,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,73,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,73,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,74,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,74,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,74,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,146,FN_CLEAR,0,FN_GOTO,133,FN_DESC,FN_EOF
	db	FN_AT,145,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,144,FN_DESC,FN_EOF
	db	FN_AT,145,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,144,FN_DESC,FN_EOF
	db	FN_AT,145,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,144,FN_DESC,FN_EOF
	db	FN_AT,110,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,112,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,112,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,112,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,113,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,113,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,113,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,114,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,90,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,91,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,91,FN_DESC,FN_EOF
	db	FN_AT,90,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,91,FN_DESC,FN_EOF
	db	FN_AT,92,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,92,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,92,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,90,FN_DESC,FN_EOF
	db	FN_AT,94,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,94,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,94,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,95,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,95,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,95,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,93,FN_DESC,FN_EOF
	db	FN_AT,69,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,69,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,69,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,72,FN_DESC,FN_EOF
	db	FN_AT,71,FN_CLEAR,0,FN_GOTO,73,FN_DESC,FN_EOF
	db	FN_AT,72,FN_CLEAR,0,FN_GOTO,74,FN_DESC,FN_EOF
	db	FN_AT,144,FN_CLEAR,0,FN_GOTO,152,FN_DESC,FN_EOF
	db	FN_AT,67,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,67,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,67,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,70,FN_DESC,FN_EOF
	db	FN_AT,152,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,141,FN_DESC,FN_EOF
	db	FN_AT,152,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,141,FN_DESC,FN_EOF
	db	FN_AT,152,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,141,FN_DESC,FN_EOF
	db	FN_AT,109,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,109,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,109,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,111,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,110,FN_DESC,FN_EOF
	db	FN_AT,111,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,110,FN_DESC,FN_EOF
	db	FN_AT,111,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,110,FN_DESC,FN_EOF
	db	FN_AT,71,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,71,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,71,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,68,FN_DESC,FN_EOF
	db	FN_AT,146,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,142,FN_DESC,FN_EOF
	db	FN_AT,146,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,142,FN_DESC,FN_EOF
	db	FN_AT,146,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,142,FN_DESC,FN_EOF
	db	FN_AT,113,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,113,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,113,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,95,FN_CLEAR,0,FN_GOTO,96,FN_DESC,FN_EOF
	db	FN_AT,142,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,146,FN_DESC,FN_EOF
	db	FN_AT,142,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,146,FN_DESC,FN_EOF
	db	FN_AT,142,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,146,FN_DESC,FN_EOF
	db	FN_AT,110,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,96,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,96,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,96,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,95,FN_DESC,FN_EOF
	db	FN_AT,121,FN_WORN,53,FN_MESSAGE,56,FN_PAUSE,250,FN_PAUSE,150,FN_GOTO,130,FN_DESC,FN_EOF
	db	FN_AT,68,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,68,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,68,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,71,FN_DESC,FN_EOF
	db	FN_AT,142,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,144,FN_DESC,FN_EOF
	db	FN_AT,142,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,144,FN_DESC,FN_EOF
	db	FN_AT,142,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,144,FN_DESC,FN_EOF
	db	FN_AT,111,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,111,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,111,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,112,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,112,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,112,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,109,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,109,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,109,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,111,FN_DESC,FN_EOF
	db	FN_AT,159,FN_CLEAR,0,FN_GOTO,157,FN_DESC,FN_EOF
	db	FN_AT,110,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,110,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,113,FN_DESC,FN_EOF
	db	FN_AT,112,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,112,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,112,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,114,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,114,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,112,FN_DESC,FN_EOF
	db	FN_AT,111,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,111,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,111,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,114,FN_DESC,FN_EOF
	db	FN_AT,100,FN_NOTWORN,25,FN_MESSAGE,45,FN_EOF
	db	FN_AT,100,FN_NOTCARR,16,FN_MESSAGE,58,FN_EOF	; was message 56
	db	FN_AT,100,FN_WORN,25,FN_CARRIED,16,FN_GOTO,108,FN_DESC,FN_EOF
	db	FN_AT,109,FN_CLEAR,0,FN_GOTO,40,FN_DESC,FN_EOF
	db	FN_AT,25,FN_PRESENT,2,FN_DESTROY,2,FN_CREATE,1,FN_GET,1,FN_PLUS,30,5,FN_MESSAGE,8,FN_EOF
	db	FN_GET,1,FN_OK,FN_EOF
	db	FN_GET,2,FN_OK,FN_EOF
	db	FN_PRESENT,29,FN_GET,29,FN_OK,FN_EOF
	db	FN_PRESENT,38,FN_GET,38,FN_OK,FN_EOF
	db	FN_GET,3,FN_OK,FN_EOF
	db	FN_NOTCARR,1,FN_GET,5,FN_OK,FN_EOF
	db	FN_GET,6,FN_OK,FN_EOF
	db	FN_GET,7,FN_OK,FN_EOF
	db	FN_WORN,10,FN_GET,9,FN_OK,FN_EOF
	db	FN_GET,10,FN_OK,FN_EOF
	db	FN_GET,11,FN_OK,FN_EOF
	db	FN_GET,12,FN_OK,FN_EOF
	db	FN_GET,13,FN_OK,FN_EOF
	db	FN_GET,14,FN_OK,FN_EOF
	db	FN_GET,15,FN_OK,FN_EOF
	db	FN_GET,46,FN_OK,FN_EOF
	db	FN_GET,20,FN_OK,FN_EOF
	db	FN_GET,20,FN_OK,FN_EOF
	db	FN_GET,21,FN_OK,FN_EOF
	db	FN_GET,22,FN_OK,FN_EOF
	db	FN_GET,23,FN_OK,FN_EOF
	db	FN_GET,24,FN_OK,FN_EOF
	db	FN_GET,25,FN_OK,FN_EOF
	db	FN_PRESENT,26,FN_GET,26,FN_OK,FN_EOF
	db	FN_PRESENT,54,FN_GET,54,FN_OK,FN_EOF
	db	FN_CARRIED,51,FN_SWAP,51,26,FN_CREATE,13,FN_GET,13,FN_OK,FN_EOF
	db	FN_CARRIED,55,FN_SWAP,55,54,FN_CREATE,13,FN_GET,13,FN_OK,FN_EOF
	db	FN_GET,27,FN_OK,FN_EOF
	db	FN_GET,28,FN_OK,FN_EOF
	db	FN_GET,30,FN_OK,FN_EOF
	db	FN_PRESENT,39,FN_GET,39,FN_OK,FN_EOF
	db	FN_PRESENT,31,FN_GET,31,FN_OK,FN_EOF
	db	FN_GET,33,FN_OK,FN_EOF
	db	FN_GET,34,FN_OK,FN_EOF
	db	FN_GET,35,FN_OK,FN_EOF
	db	FN_GET,36,FN_OK,FN_EOF
	db	FN_PRESENT,37,FN_GET,37,FN_OK,FN_EOF
	db	FN_PRESENT,50,FN_GET,50,FN_OK,FN_EOF
	db	FN_GET,41,FN_OK,FN_EOF
	db	FN_NOTAT,126,FN_NOTAT,137,FN_NOTAT,140,FN_WORN,41,FN_GET,42,FN_MESSAGE,13,FN_EOF
	db	FN_AT,126,FN_PRESENT,27,FN_WORN,41,FN_GET,42,FN_MESSAGE,13,FN_MESSAGE,18,FN_EOF
	db	FN_AT,126,FN_ABSENT,27,FN_GET,42,FN_MESSAGE,13,FN_DROP,42,FN_MESSAGE,17,FN_EOF
	db	FN_AT,140,FN_WORN,41,FN_NOTZERO,11,FN_GET,42,FN_MESSAGE,13,FN_EOF
	db	FN_AT,59,FN_MESSAGE,19,FN_PAUSE,150,FN_GOTO,157,FN_EOF
	db	FN_GET,8,FN_OK,FN_EOF
	db	FN_GET,47,FN_OK,FN_EOF
	db	FN_GET,53,FN_OK,FN_EOF
	db	FN_NOTAT,120,FN_GET,48,FN_OK,FN_EOF
	db	FN_GET,49,FN_EOF
	db	FN_NOTAT,128,FN_GET,52,FN_OK,FN_EOF
	db	FN_GET,17,FN_OK,FN_EOF
	db	FN_AT,43,FN_PRESENT,6,FN_DESTROY,6,FN_CREATE,5,FN_GET,5,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,56,FN_CARRIED,7,FN_DROP,7,FN_DESTROY,7,FN_CREATE,44,FN_GET,44,FN_PLUS,30,5,FN_MESSAGE,20,FN_EOF
	db	FN_AT,38,FN_CARRIED,11,FN_SWAP,11,18,FN_OK,FN_EOF
	db	FN_AT,48,FN_SWAP,14,13,FN_OK,FN_EOF
	db	FN_AT,135,FN_CARRIED,28,FN_SWAP,28,53,FN_MESSAGE,62,FN_PLUS,30,5,FN_EOF
	db	FN_AT,49,FN_CARRIED,35,FN_SWAP,35,36,FN_OK,FN_EOF
	db	FN_AT,36,FN_CARRIED,36,FN_SWAP,36,49,FN_MESSAGE,48,FN_PAUSE,150,FN_OK,FN_EOF
	db	FN_WEAR,10,FN_OK,FN_EOF
	db	FN_WEAR,46,FN_OK,FN_EOF
	db	FN_WEAR,25,FN_OK,FN_EOF
	db	FN_CARRIED,28,FN_MESSAGE,43,FN_EOF
	db	FN_WORN,25,FN_WEAR,41,FN_OK,FN_EOF
	db	FN_NOTWORN,25,FN_WEAR,17,FN_OK,FN_EOF
	db	FN_REMOVE,11,FN_OK,FN_EOF
	db	FN_REMOVE,10,FN_OK,FN_EOF
	db	FN_REMOVE,46,FN_OK,FN_EOF
	db	FN_REMOVE,25,FN_OK,FN_EOF
	db	FN_REMOVE,41,FN_OK,FN_EOF
	db	FN_WORN,40,FN_GT,30,50,FN_REMOVE,40,FN_OK,FN_EOF
	db	FN_REMOVE,17,FN_OK,FN_EOF
	db	FN_MESSAGE,2,FN_EOF
	db	FN_GOTO,63,FN_DESC,FN_EOF
	db	FN_CARRIED,29,FN_NOTCARR,30,FN_MESSAGE,4,FN_EOF
	db	FN_CARRIED,29,FN_CARRIED,30,FN_SWAP,29,38,FN_CLEAR,0,FN_DESC,FN_EOF
	db	FN_CARRIED,31,FN_SWAP,31,39,FN_CLEAR,0,FN_DESC,FN_EOF
	db	FN_DROP,1,FN_OK,FN_EOF
	db	FN_AT,1,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,162,FN_DROP,1,FN_SET,14,FN_OK,FN_EOF
	db	FN_DROP,2,FN_OK,FN_EOF
	db	FN_CARRIED,29,FN_DROP,29,FN_OK,FN_EOF
	db	FN_CARRIED,38,FN_DROP,38,FN_OK,FN_EOF
	db	FN_DROP,3,FN_OK,FN_EOF
	db	FN_DROP,4,FN_OK,FN_EOF
	db	FN_DROP,5,FN_OK,FN_EOF
	db	FN_AT,1,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,162,FN_DROP,5,FN_SET,13,FN_OK,FN_EOF
	db	FN_DROP,6,FN_OK,FN_EOF
	db	FN_DROP,7,FN_OK,FN_EOF
	db	FN_DROP,8,FN_OK,FN_EOF
	db	FN_DROP,9,FN_MESSAGE,24,FN_EOF
	db	FN_DROP,10,FN_OK,FN_EOF
	db	FN_DROP,11,FN_OK,FN_EOF
	db	FN_NOTAT,11,FN_DROP,12,FN_OK,FN_EOF
	db	FN_AT,11,FN_DROP,12,FN_MESSAGE,29,FN_PAUSE,250,FN_EOF
	db	FN_NOTAT,50,FN_DROP,13,FN_OK,FN_EOF
	db	FN_AT,50,FN_MESSAGE,28,FN_CREATE,12,FN_PLUS,30,5,FN_PAUSE,250,FN_PAUSE,250,FN_DESC,FN_EOF
	db	FN_CARRIED,51,FN_DROP,51,FN_OK,FN_EOF
	db	FN_NOTAT,48,FN_DROP,14,FN_OK,FN_EOF
	db	FN_AT,48,FN_DROP,14,FN_MESSAGE,24,FN_EOF
	db	FN_NOTAT,138,FN_DROP,15,FN_OK,FN_EOF
	db	FN_AT,138,FN_DROP,15,FN_CREATE,14,FN_MESSAGE,24,FN_MESSAGE,26,FN_DESTROY,15,FN_PLUS,30,5,FN_EOF
	db	FN_DROP,16,FN_OK,FN_EOF
	db	FN_DROP,46,FN_OK,FN_EOF
	db	FN_DROP,18,FN_OK,FN_EOF
	db	FN_NOTAT,118,FN_DROP,19,FN_OK,FN_EOF
	db	FN_AT,118,FN_MESSAGE,41,FN_EOF
	db	FN_DROP,20,FN_OK,FN_EOF
	db	FN_DROP,20,FN_OK,FN_EOF
	db	FN_DROP,21,FN_OK,FN_EOF
	db	FN_DROP,22,FN_OK,FN_EOF
	db	FN_NOTAT,117,FN_DROP,23,FN_OK,FN_EOF
	db	FN_AT,117,FN_SWAP,23,19,FN_MESSAGE,44,FN_EOF
	db	FN_NOTAT,120,FN_DROP,24,FN_OK,FN_EOF
	db	FN_AT,120,FN_SWAP,24,48,FN_MESSAGE,39,FN_EOF
	db	FN_DROP,25,FN_OK,FN_EOF
	db	FN_CARRIED,26,FN_DROP,26,FN_OK,FN_MESSAGE,1,FN_EOF
	db	FN_AT,162,FN_DROP,26,FN_SET,15,FN_OK,FN_EOF
	db	FN_CARRIED,54,FN_DROP,54,FN_OK,FN_EOF
	db	FN_DROP,27,FN_OK,FN_EOF
	db	FN_DROP,28,FN_OK,FN_EOF
	db	FN_AT,135,FN_DROP,45,FN_MESSAGE,24,FN_EOF
	db	FN_DROP,30,FN_OK,FN_EOF
	db	FN_CARRIED,31,FN_DROP,31,FN_OK,FN_EOF
	db	FN_CARRIED,39,FN_DROP,39,FN_OK,FN_EOF
	db	FN_DROP,32,FN_OK,FN_EOF
	db	FN_DROP,33,FN_OK,FN_EOF
	db	FN_DROP,33,FN_OK,FN_EOF
	db	FN_DROP,34,FN_OK,FN_EOF
	db	FN_DROP,35,FN_OK,FN_EOF
	db	FN_DROP,36,FN_OK,FN_EOF
	db	FN_CARRIED,37,FN_DROP,37,FN_OK,FN_EOF
	db	FN_CARRIED,50,FN_DROP,50,FN_OK,FN_EOF
	db	FN_AT,59,FN_DROP,44,FN_CREATE,43,FN_GET,43,FN_MESSAGE,21,FN_MESSAGE,22,FN_OK,FN_EOF
	db	FN_DROP,40,FN_OK,FN_EOF
	db	FN_DROP,8,FN_OK,FN_EOF
	db	FN_DROP,47,FN_OK,FN_EOF
	db	FN_AT,130,FN_CARRIED,53,FN_MESSAGE,57,FN_PAUSE,250,FN_PAUSE,250,FN_PLUS,30,5,FN_GOTO,1,FN_EOF
	db	FN_NOTAT,130,FN_DROP,53,FN_OK,FN_EOF
	db	FN_DROP,48,FN_OK,FN_EOF
	db	FN_DROP,49,FN_OK,FN_EOF
	db	FN_CARRIED,51,FN_SWAP,51,26,FN_DROP,26,FN_OK,FN_EOF
	db	FN_NOTAT,128,FN_DROP,52,FN_OK,FN_EOF
	db	FN_AT,128,FN_DROP,4,FN_CREATE,27,FN_DESC,FN_EOF
	db	FN_DROP,17,FN_OK,FN_EOF
	db	FN_DROP,52,FN_OK,FN_EOF
	db	FN_DESC,FN_EOF
	db	FN_CARRIED,38,FN_SWAP,38,29,FN_SET,0,FN_DESC,FN_EOF
	db	FN_CARRIED,39,FN_SWAP,39,31,FN_SET,0,FN_DESC,FN_EOF
	db	FN_NOTAT,11,FN_MESSAGE,5,FN_PAUSE,250,FN_MESSAGE,6,FN_EOF
	db	FN_AT,11,FN_CHANCE,20,FN_CREATE,11,FN_MESSAGE,30,FN_PAUSE,250,FN_PAUSE,250,FN_PLUS,30,5,FN_DESC,FN_EOF
	db	FN_AT,140,FN_PRESENT,42,FN_EQ,11,0,FN_NOTWORN,41,FN_NOTWORN,25,FN_MESSAGE,16,FN_LET,11,2,FN_PLUS,30,5,FN_DONE,FN_EOF
	db	FN_AT,140,FN_NOTZERO,11,FN_NOTWORN,41,FN_NOTWORN,25,FN_PRESENT,42,FN_MESSAGE,16,FN_DONE,FN_EOF
	db	FN_AT,7,FN_ABSENT,31,FN_MESSAGE,10,FN_PAUSE,150,FN_GOTO,124,FN_DESC,FN_EOF
	db	FN_AT,133,FN_PRESENT,43,FN_DROP,43,FN_DESTROY,43,FN_CREATE,6,FN_GET,6,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,124,FN_ABSENT,27,FN_NOTCARR,54,FN_CARRIED,3,FN_CARRIED,8,FN_SWAP,8,52,FN_SWAP,3,2,FN_MESSAGE,10,FN_PAUSE,150,FN_GOTO,7,FN_DONE,FN_EOF
	db	FN_AT,124,FN_ABSENT,27,FN_NOTCARR,54,FN_NOTCARR,3,FN_NOTCARR,8,FN_MESSAGE,10,FN_PAUSE,150,FN_GOTO,7,FN_DONE,FN_EOF
	db	FN_AT,99,FN_NOTCARR,37,FN_MESSAGE,10,FN_PAUSE,150,FN_GOTO,116,FN_DESC,FN_EOF
	db	FN_AT,124,FN_ABSENT,27,FN_CARRIED,8,FN_NOTCARR,54,FN_NOTCARR,3,FN_SWAP,8,52,FN_MESSAGE,10,FN_PAUSE,250,FN_GOTO,7,FN_DONE,FN_EOF
	db	FN_AT,124,FN_ABSENT,27,FN_NOTCARR,8,FN_NOTCARR,54,FN_CARRIED,3,FN_SWAP,3,2,FN_MESSAGE,10,FN_PAUSE,250,FN_GOTO,7,FN_DONE,FN_EOF
	db	FN_AT,24,FN_SWAP,8,45,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,98,FN_SWAP,45,16,FN_OK,FN_EOF
	db	FN_AT,155,FN_PRESENT,8,FN_MESSAGE,36,FN_DESTROY,8,FN_SET,20,FN_EOF
	db	FN_AT,155,FN_CARRIED,47,FN_NOTZERO,20,FN_CREATE,8,FN_MESSAGE,37,FN_DESTROY,47,FN_OK,FN_EOF
	db	FN_AT,81,FN_CARRIED,47,FN_NOTZERO,20,FN_CREATE,8,FN_MESSAGE,37,FN_DESTROY,47,FN_EOF
	db	FN_NOTAT,81,FN_NOTAT,155,FN_CARRIED,47,FN_DESTROY,47,FN_MESSAGE,37,FN_EOF
	db	FN_AT,35,FN_MESSAGE,60,FN_MESSAGE,7,FN_TURNS,FN_SCORE,FN_END,FN_EOF
	db	FN_TURNS,FN_EOF
	db	FN_AT,40,FN_NOTCARR,38,FN_NOTCARR,39,FN_SET,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,40,FN_CARRIED,38,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_AT,40,FN_CARRIED,39,FN_CLEAR,0,FN_GOTO,109,FN_DESC,FN_EOF
	db	FN_INVEN,FN_EOF
	db	FN_NOTAT,162,FN_SCORE,FN_BEEP,40,120,FN_BEEP,20,126,FN_BEEP,20,126,FN_BEEP,20,122,FN_BEEP,20,120,FN_BEEP,40,122,FN_BEEP,20,121,FN_BEEP,60,116,FN_BEEP,40,122,FN_BEEP,20,130,FN_BEEP,20,130,FN_BEEP,20,126,FN_BEEP,20,122,FN_BEEP,60,122,FN_BEEP,60,120,FN_BEEP,40,120,FN_BEEP,20,126,FN_BEEP,20,126,FN_BEEP,20,122,FN_BEEP,20,120,FN_BEEP,40,122,FN_BEEP,20,120,FN_BEEP,60,116,FN_BEEP,40,122,FN_BEEP,20,130,FN_BEEP,40,126,FN_BEEP,20,110,FN_BEEP,60,116,FN_BEEP,60,112,FN_MESSAGE,7,FN_TURNS,FN_END,FN_EOF
	db	FN_SAVE,FN_EOF,0,0	; ** new ** easier save FN_ATLT,85...
	db	FN_AT,162,FN_SAVE,FN_END,FN_EOF
	db	FN_LOAD,FN_EOF
	db	FN_AT,106,FN_CARRIED,16,FN_SWAP,16,26,FN_PLUS,30,5,FN_OK,FN_EOF
	db	FN_AT,106,FN_NOTCARR,16,FN_CARRIED,45,FN_MESSAGE,58,FN_EOF
	db	FN_AT,106,FN_NOTCARR,16,FN_NOTCARR,45,FN_MESSAGE,59,FN_EOF
	db	FN_DESTROY,33,FN_OK,FN_EOF
	db	FN_MESSAGE,49,FN_PAUSE,150,FN_EOF
	db	FN_CARRIED,13,FN_CARRIED,26,FN_SWAP,26,51,FN_DESTROY,13,FN_OK,FN_EOF
	db	FN_CARRIED,26,FN_NOTCARR,13,FN_MESSAGE,50,FN_EOF
	db	FN_CARRIED,13,FN_CARRIED,54,FN_SWAP,54,55,FN_DESTROY,13,FN_OK,FN_EOF
	db	FN_CARRIED,54,FN_NOTCARR,13,FN_MESSAGE,50,FN_EOF
	db	FN_AT,26,FN_CREATE,4,FN_GET,4,FN_MESSAGE,64,FN_EOF
	db	FN_AT,127,FN_PAUSE,150,FN_GOTO,128,FN_DESC,FN_EOF
	db	FN_SCORE,FN_EOF

	db	FN_CASE,FN_EOF	; ** new ** CASE (size = 2)
	db	FN_HOME,FN_EOF	; ** new ** HOME (size = 2)
	db	FN_DEBUG,FN_EOF	; ** new ** DEBU(G) (size = 2)
	db	FN_TRANSLATE,FN_EOF	; ** new ** ACCE(NTS) (size = 2)
	
	db	FN_AT,14,FN_CARRIED,34,FN_CLEAR,0,FN_GOTO,15,FN_DESC,FN_EOF	; ** new ** from location 14, go to location 15 if carrying a boat (size = 10)
	db	FN_AT,15,FN_GOTO,14,FN_DESC,FN_EOF	; ** new ** from location 15, go to location 14 (size = 6)
	
*------------------------------
* SYS_MESSAGES
*------------------------------

tblSYSMESSAGES
	asc	8D"Temno je kot v rogu."00
	asc	8D"Poleg tega vidim: "00
	asc	8D"^akam na tvoj ukaz."00
	asc	8D"Pri~akujem nasvetov, prijatelj."00
	asc	8D"In sedaj, nove nor~ije ?"00
	asc	8D"Kaj naj storim ?"00
	asc	8D"Tega sploh ne razumem."8D"Poskusi povedati kako druga~e."00
	asc	8D"Ne vidi{, da v to smer ni poti?"00
	asc	8D"Tega pa ne morem."00
	asc	8D"Prena{am pa tole: "00
	asc	" nosim"00
	asc	"Pravzaprav ni~."00
	asc	8D"Zares konec igre?"00
	asc	8D"KON^NO KONEC...bi poskusil ponovno?"00
	asc	8D"Hvala za dru`bo !"00
	asc	8D"OK."00
	asc	8D"Po`ge~kaj za nadaljevanje"00
	asc	8D"Ukazov dal si "00
	asc	" zares"00
	asc	""00	; plural
	asc	". "00
	asc	8D"Nabral si "00
	asc	" to~k."00
	asc	8D"Tega sploh ne nosim."00
	asc	8D"Ne morem, polne roke imam."00
	asc	8D"To `e imam."00
	asc	8D"Tega pa ni tukaj."00
	asc	8D"Prete`ko je. Najprej nekaj odlo`i."00
	asc	8D"Tega pa nimam."00
	asc	8D"To `e nosim na sebi."00
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
	macWORD	11;"NOTE"
	macWORD	12;"VEN"
	macWORD	16;"TV"  
	macWORD	16;"TELE"
	macWORD	17;"CEKE"
	macWORD	18;"VZEM"
	macWORD	18;"UGRA"
	macWORD	18;"ODPE"
	macWORD	18;"POBE"
	macWORD	18;"ODTR"
	macWORD	18;"TRGA"
	macWORD	18;"UTRG"
	macWORD	19;"SVEC"
	macWORD	20;"LONE"
	macWORD	21;"KOLE"
	macWORD	22;"KASE"
	macWORD	23;"KAVO"
	macWORD	24;"MOKO"
	macWORD	24;"AJDO"
	macWORD	25;"PRST"
	macWORD	26;"VOLC"
	macWORD	26;"ROZO"
	macWORD	27;"ROKA"
	macWORD	28;"HR"  
	macWORD	28;"TAST"
	macWORD	28;"RACU"
	macWORD	29;"KNJI"
	macWORD	30;"SOD" 
	macWORD	31;"LES" 
	macWORD	31;"DESK"
	macWORD	31;"HRAS"
	macWORD	32;"KROF"
	macWORD	33;"MARK"
	macWORD	34;"OKLE"
	macWORD	35;"SESA"
	macWORD	36;"PISC"
	macWORD	37;"PLAN"
	macWORD	38;"OPRE"
	macWORD	39;"PUSK"
	macWORD	40;"PORN"
	macWORD	41;"VIBR"
	macWORD	41;"JOYS"
	macWORD	42;"KRAV"
	macWORD	43;"SPEC"
	macWORD	44;"MEC" 
	macWORD	45;"PLEN"
	macWORD	46;"VZIG"
	macWORD	47;"BATE"
	macWORD	48;"HG"  
	macWORD	48;"ZIVO"
	macWORD	48;"SREB"
	macWORD	49;"RUM" 
	macWORD	50;"COLN"
	macWORD	51;"HMEL"
	macWORD	52;"PIR" 
	macWORD	52;"PIVO"
	macWORD	53;"POTN"
	macWORD	53;"LIST"
	macWORD	54;"OBLE"
	macWORD	54;"OBUJ"
	macWORD	54;"PRIP"
	macWORD	55;"SLEC"
	macWORD	55;"ODPN"
	macWORD	56;"GO"  
	macWORD	56;"EAT" 
	macWORD	56;"USE" 
	macWORD	56;"TAKE"
	macWORD	56;"DROP"
	macWORD	56;"LOOK"
	macWORD	56;"WEAR"
	macWORD	57;"FUK" 
	macWORD	57;"PIZD"
	macWORD	57;"KURA"
	macWORD	57;"JEBI"
	macWORD	57;"KURB"
	macWORD	57;"PICK"
	macWORD	57;"KURC"
	macWORD	59;"PRIZ"
	macWORD	60;"DAJ" 
	macWORD	60;"SPUS"
	macWORD	60;"ODLO"
	macWORD	61;"OPIS"
	macWORD	62;"UGAS"
	macWORD	63;"POCA"
	macWORD	63;"CAKA"
	macWORD	64;"OSEB"
	macWORD	64;"VERO"
	macWORD	65;"LOC" 
	macWORD	66;"SPI" 
	macWORD	66;"POFU"
	macWORD	66;"PODR"
	macWORD	67;"NE"  
	macWORD	68;"CIRA"
	macWORD	69;"CARA"
	macWORD	70;"RED" 
	macWORD	70;"VRST"
	macWORD	71;"MATE"
	macWORD	72;"ZNAC"
	macWORD	74;"DEKL"
	macWORD	75;"SEDI"
	macWORD	76;"PROD"
	macWORD	77;"DINA"
	macWORD	78;"ZAKL"
	macWORD	79;"MENJ"
	macWORD	79;"ZAME"
	macWORD	80;"ZAKO"
	macWORD	81;"ODKO"
	macWORD	82;"LOPA"
	macWORD	83;"MASK"
	macWORD	84;"PRIT"
	macWORD	86;"KORA"
	macWORD	87;"DOLA"
	macWORD	104;"I"   
	macWORD	104;"INVE"
	macWORD	106;"QUIT"
	macWORD	106;"STOP"
	macWORD	106;"KONE"
	macWORD	107;"SAVE"
	macWORD	108;"LOAD"
	macWORD	150;"KUPI"
	macWORD	151;"BOGO"
	macWORD	152;"SLIK"
	macWORD	153;"PIJ" 
	macWORD	153;"POPI"
	macWORD	154;"JEJ" 
	macWORD	155;"VELJ"
	macWORD	156;"POMA"
	macWORD	156;"SVET"
	macWORD	157;"SKRI"
	macWORD	158;"ATTA"
	macWORD	159;"REZU"
	macWORD	160;"MATJ"
	macWORD	161;"CARO"
	macWORD	162;"OGLJ"
	macWORD	162;"VREC"
	macWORD	163;"CASE"	; ** new ** upper/lower case
	macWORD	164;"HOME"	; ** new ** top of screen on new location
	macWORD	165;"DEBU"	; ** new ** debug on/off
	macWORD	166;"SUMN"	; ** new ** accents on/off (SUMNIKI)
	macWORD	255;"_"

