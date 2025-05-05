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
	asc	"Ti si jedini pismen u svojoj    "8D
	asc	"zemlji. Ostali naravno isto bi  "8D
	asc	"hteli  ali ti si  onaj  koji ih "8D
	asc	"moze spasiti. Pozuri !"00
	asc	"Sam u kuci stojis i drzis Dugu u"8D
	asc	"rukama. "00
	asc	"Ti si na velikom raskrscu gde   "8D
	asc	"KONTRABANT zivotu daje ritam."00
	asc	"Sume su opasne, hladne          "8D
	asc	"i tamne..."00
	asc	"Cilibar dobiti, to nije lako,   "8D
	asc	"svako se pita :"A2"Pa boze, kako?"A200
	asc	"Neki manevri su zaista teski,   "8D
	asc	"ali budi uporan in ponovi ih sto"8D
	asc	"puta. Prema severu vidis tablu  "8D
	asc	"na kojoj pise :"A2"U cetvrt otvoren"8D
	asc	"u pola zatvoren."A200
	asc	"Mocvara je vlazna i opasna, to  "8D
	asc	"ni slucajno nije mesto za tebe."00
	asc	"Komarci te bodu i vrlo te boli, "8D
	asc	"pozuri odavde jer neko te voli."00
	asc	"Tu zive neobicni ljudi koji samo"8D
	asc	"grade kolibe i kipove."00
	asc	"U hladnoj si pecini. Tu zive    "8D
	asc	"krojaci bez posla, jer nemaju   "8D
	asc	"cime da rade."00
	asc	"Sever, Istok, Jug i Zapad, brzo "8D
	asc	"kreni ti u napad."00
	asc	"Iako je tu sve na stubovima to  "8D
	asc	"nije Venecija nego ANALJBULJ."00
	asc	"Tu je mesto gde jos zivi jedna  "8D
	asc	"od retkih zivotinja- jugosaurus."00
	asc	"Tu zive mamuti, opasne i velike "8D
	asc	"zivotinje od kojih jedna upravo "8D
	asc	"trci prema tebi."00
	asc	"U sumi u kojoj si sada cuvaj se,"8D
	asc	"jer tu zivi puno opasnih        "8D
	asc	"zivotinja."00
	asc	"Kroz gusto lisce mozes da vidis "8D
	asc	"jedino to da te neko osmatra."00
	asc	"Pored Save i Dunava lezi grad a "8D
	asc	"vremenska prognoza cuti bez     "8D
	asc	"rege zelene."00
	asc	"Stojis u tamnoj sumi i cujes    "8D
	asc	"strasnog vuka u daljini."00
	asc	"Andersen je ovde slao devojcicu "8D
	asc	"po sibice a jos prije savetovao "8D
	asc	"joj put na sever."00
	asc	"Ssssumaaaa...."00
	asc	"Ovde mozes da dobijes topla     "8D
	asc	"odela ali, na zalost, nisu bas  "8D
	asc	"cela."00
	asc	"U GOLOJ radionici ima puno lepih"8D
	asc	"stvari a najlepse su situle sa  "8D
	asc	"natpisom MEJDINHONGKONG."00
	asc	"U novoj si vaskoj fabrici i kazu"8D
	asc	"da je to SITULARNA."00
	asc	"Sume su guste a u njima zbog    "8D
	asc	"zveri moze biti stvarno gusto."00
	asc	"Putevi su utabani, drvece je    "8D
	asc	"staro, a ti si glup, jer stojis "8D
	asc	"ovde."00
	asc	"Zima je hladna, svaka zver je   "8D
	asc	"gladna ..."00
	asc	"Sve sto vidis su krosnje drveca."00
	asc	"Kod SPARKA imaju uvek smolu, ali"8D
	asc	"mogu lepo da ti zamotaju kamen."00
	asc	"Brdo se visoko iznad tebe dize, "8D
	asc	"cuvaj se, opasnost stize."00
	asc	"V steni je velika pecina i ti bi"8D
	asc	"naravno hteo uci, ali je zbog   "8D
	asc	"medveda strazara tesko."00
	asc	"Ovde zive trgovci koji bi od    "8D
	asc	"tebe hteli svasta da kupe.      "8D
	asc	"Prodaj ali pazi!"00
	asc	"Jednom ce tu biti lepa gostiona "8D
	asc	"sa dobrom hranom i brkatim      "8D
	asc	"piscem. A sada je tu tuga i ne  "8D
	asc	"moze da ti pomogne ni Duga."00
	asc	"Ovde zive gastarbajteri koji ti "8D
	asc	"zele prodati udice.             "8D
	asc	"Dodi, vidi,kupi, idi !"00
	asc	"Proteus riba zivi u ovoj        "8D
	asc	"supljini i kaze ti neko :"A2"Trebat"8D
	asc	"ces je negde daleko!"A200
	asc	"Ovo mesto je opasno zbog zveri  "8D
	asc	"koje vole ljudske stvari. Putevi"8D
	asc	"vode na I, Z i J."00
	asc	"Ovde zive samo bednici koji     "8D
	asc	"zarade manje od tri kamena      "8D
	asc	"mesecno i ti nemas sta da trazis"8D
	asc	"medju njima."00
	asc	"Na obali jezera ceka te Jazon   "8D
	asc	"ali ne moze nista da ucini za   "8D
	asc	"tebe jer mu je brod neispravan."00
	asc	"Rim je lep i vecan, ali Neron   "8D
	asc	"ludi ozbiljno hoce zapaliti i   "8D
	asc	"njega i ljude."00
	asc	"Ides po rimskom putu koji se    "8D
	asc	"pise malim slovom."00
	asc	"Sam si na putu i ne znas gde te "8D
	asc	"vodi, ali na svu srecu imas     "8D
	asc	"mene."00
	asc	"Na slovensku zemlju te most vodi"8D
	asc	"ali prolaz nije slobodan uvek i "8D
	asc	"za sve."00
	asc	"Na plafonu su ogledala,zidovi su"8D
	asc	"crveni i ako si musko ti ces    "8D
	asc	"poludeti od srece."00
	asc	"Stojis ispred emonskog zida.    "8D
	asc	"Razmisli da li ces uci ili ne."00
	asc	"Tu se svi boje Huna Atile i zele"8D
	asc	"njegovu glavu na tacni."00
	asc	"Stojis u rimskom gradu i radujes"8D
	asc	"se zivotu."00
	asc	"Pod slobodnim suncem Irena lezi,"8D
	asc	"po ledjima je ono pece. Ako     "8D
	asc	"kreme ne bude vise onda..."00
	asc	"Dosao si u bogat grad, zlatni   "8D
	asc	"kip je njegov ponos, pogledaj ga"8D
	asc	"sad."00
	asc	"Na emonskom trgu si sad, kaldrma"8D
	asc	"se bas postavlja i sve je       "8D
	asc	"raskopano."00
	asc	"Kod rimskog akvadukta si, vode  "8D
	asc	"ima ili je nema."00
	asc	"Lahor pirka, tebe nova ljubav   "8D
	asc	"dirka."00
	asc	"Split je pun muzicara, ali      "8D
	asc	"instrumenata je malo, a caru je "8D
	asc	"do muzike stalo."00
	asc	"Pula je grad-luka, i arenu svoju"8D
	asc	"ima. Potrazi tu svoju srecu, ako"8D
	asc	"ti je do toga. "00
	asc	"U velikoj areni, na sred staze  "8D
	asc	"stojis, trkaci su grozoviti i   "8D
	asc	"mnogo ih se bojis."00
	asc	"Sumica je ruzna i zapustena, sve"8D
	asc	"sto padne na zemlju ostane tamo "8D
	asc	"zauvek."00
	asc	"Tu je smrdljivac bez manira     "8D
	asc	"Mefisto-vrag-pastir."00
	asc	"Svi su ovde pijani, ako hoces   "8D
	asc	"vina ponudi im alat."00
	asc	"U daljini je mesto kuzno, crn   "8D
	asc	"dim se iz njega valja. Kuga je  "8D
	asc	"posast grozna, sa kosom okolo   "8D
	asc	"hara."00
	asc	"Mesto je kuzno lesevi svuda idi "8D
	asc	"na groblje kad ne znas kuda. "00
	asc	"Na groblju si, zanimljivih      "8D
	asc	"stvari za sve tu ima, a narocito"8D
	asc	"za vestice."00
	asc	"Na brdu je beli dvor, sve u     "8D
	asc	"njemu je fino samo fali vino."00
	asc	"Aerodrom je velik, ali prazan.  "8D
	asc	"Turbo je prevazidjen. Lobanje su"8D
	asc	"desert pravi za sve koji hoce da"8D
	asc	"su zdravi."00
	asc	"Preko vode vodi most. Ti bi na  "8D
	asc	"istok zeleo, ali mostarina se   "8D
	asc	"mora platiti."00
	asc	"Put je ravan i sirok,           "8D
	asc	"vodi te pravo na jug.           "8D
	asc	"To ti nove snage daje,          "8D
	asc	"jer pred tobom put je dug."00
	asc	"Usao si u veliku stalu.         "8D
	asc	"Konja ima koliko volis,         "8D
	asc	"ali da bi makar jednog dobio    "8D
	asc	"seti se kralja Artura."00
	asc	"Dusan je car bogat bajoslovno,  "8D
	asc	"konje kupuje i menja masovno."00
	asc	"Car Lazar  mrtav spi,           "8D
	asc	"samo ONA moze da ga probudi."00
	asc	"Sultanov dvorac je nov i moderan"8D
	asc	"ali fali zenska ruka da bi bio  "8D
	asc	"udoban."00
	asc	"V brigadi Marko vozi tragace,   "8D
	asc	"a lepu Ravijojlu nosi na krkace."00
	asc	"Nisko zbunje i zelena trava..."00
	asc	"Na brdu grad se beli.Tamo neko  "8D
	asc	"galami. To je tip koga se svi   "8D
	asc	"boje."00
	asc	"Zli vuk tu zivi,Vucko ga zovu.  "8D
	asc	"To je olimpijski grad,          "8D
	asc	"pa je trgovina dozvoljena."00
	asc	"Carica Milica je jako lepa,     "8D
	asc	"ali se nakitom ulepsati ne moze."00
	asc	"Tamni su zatvori                "8D
	asc	"u tom strasnom gradu.           "8D
	asc	"Ljudi tamo zive,                "8D
	asc	"u vlazi i hladu."00
	asc	"Cuda se u bajkama uvek desavaju,"8D
	asc	"njihovi junaci ovde zive."00
	asc	"Mehmed Sokolovic ovde je pasa,  "8D
	asc	"ispunice se zelja vasa."00
	asc	"Na Kosovom polju reka tece,     "8D
	asc	""A2"BIREKU ESTE I MIRE"A2",           "8D
	asc	"stanovnik ti rece."00
	asc	"Velike su sume tu,              "8D
	asc	"cuju se vukovi."00
	asc	"Karadzic se  zove Vuk,          "8D
	asc	"pise, radi on bez muk'."00
	asc	"..."A2"svaka puska bice ubojita,   "8D
	asc	"u rukama Mandusica Vuka"A2" ..."00
	asc	"Srbija nije velika,             "8D
	asc	"i susede ona mami.              "8D
	asc	"Svako sebi je zeli,             "8D
	asc	"i napasti hoce u tami."00
	asc	"Sultan Murat bogat je,          "8D
	asc	"raskosan je njegov dvor.        "00
	asc	"Bistro jezero duboko            "8D
	asc	"pred tobom lezi.                "8D
	asc	"Bisera ima mnogo prekrasnih,    "8D
	asc	"rado bi ih imao i ti."00
	asc	"U Dubrovackoj apoteci,          "8D
	asc	"za bisere dobiju se tablete."00
	asc	"More je mokro i slano,          "8D
	asc	"jer radije slanu jedemo hranu,  "8D
	asc	"so mu krademo po planu."00
	asc	"Ta dolina ruza je puna,         "8D
	asc	"Bleiweis poznati tu zivi.       "8D
	asc	"Kranjske pcele obozava,         "8D
	asc	"lipe ljubi i gaji."00
	asc	"Ljubljana je mesto belo, iako je"8D
	asc	"u novom ruhu turobno."00
	asc	"Madona di Krainska gora."00
	asc	"Triglav je gora velika,         "8D
	asc	"divojaraca puna."00
	asc	"Put taj te na Dunav vodi,       "8D
	asc	"pozuri, na veselje hodi."00
	asc	"U Pratru svako hoce igrati,     "8D
	asc	"dobri su tamo automati.         "8D
	asc	"Prvi Kontrabant igraju,         "8D
	asc	""A2"dvojku"A2" jos, na zalost,        "8D
	asc	"ne poznaju. "00
	asc	"Marija voli da pomaze,          "8D
	asc	"ali, pazi, ponekad laze."00
	asc	"U lepom dvorcu zivi Josif,      "8D
	asc	"ali mu zivot zagorcavaju        "8D
	asc	"grcevi u stomaku."00
	asc	"Nekad je ovde bila lipa, ali sad"8D
	asc	"je nema, jer ju je neki ludak   "8D
	asc	"posekao."00
	asc	"Priblizavas se kraju, nagrada te"8D
	asc	"ceka,  puta  nazad  vise  nema, "8D
	asc	"upotrebi sve svoje znanje."00
	asc	"U Ljubljani si, ako si pravilno "8D
	asc	"igrao nesto sto si ovde ostavio "8D
	asc	"pod nogama ti je."00
	asc	"Na postamentu nema nista. Ako   "8D
	asc	"imas postavi nesto na njega."00
	asc	"Cudoviste u obliku paragrafa    "8D
	asc	"stoji pred tobom, preti ti smrcu"8D
	asc	"budi brz i ubij ti njega."00
	asc	"Soba je pusta, put te vodi na   "8D
	asc	"zapad. Iznenadjenja ludih i     "8D
	asc	"opasnih ima na tom putu mnogo."00
	asc	"Blizu si uspeha, u zadnju godinu"8D
	asc	"sad udji, dobro razmisli i      "8D
	asc	"pametan odgovor daj."00
	asc	"Igru si uspesno zavrsio, svaka  "8D
	asc	"cast. Snimi ovu sliku i brzo sa "8D
	asc	"njom na postu."00
	asc	"Na pustom si otoku. Zbog ruznih "8D
	asc	"reci nemas vise priliku."00

*------------------------------
* MESSAGES
*------------------------------

tblMESSAGES
	asc	"Lepo je runo, al' puno je smole,"8D"oni koji su tu takvog ne vole."00
	asc	"Jazon je zahvalno pokupio smolu,"8D"popravio  brod  i  uzeo  te  sa "8D"sobom."00
	asc	"Cistoca je pola zdravlja i Jazon"8D"je zbog toga odbio tvoj dar."00
	asc	"Trafo si bacio tacno i snazno - "8D"mamuta ubio i to je vazno."00
	asc	"Tvoje ruke su tako jake, da je  "8D"trafo odleteo daleko,           "8D"u nepovrat."00
	asc	"Dao si strasnome medvedu med,   "8D"prosao si i probio led."00
	asc	"Ne mozes prici ka velikoj jami, "8D"jer medved je cuva i lezi u     "8D"tami."00
	asc	"Drvo je suvo, vatra je jaka,    "8D"otera pcele iz pcelinjaka."00
	asc	"Vatra se lepo zapalila, ali ju  "8D"je jaka bura ugusila."00
	asc	"Zver je uzela proteusa,         "8D"bas pameti nema, jer sada mozes "8D"proci bez ikakvih problema."00
	asc	"Za micanje je sada kasno, pozuri"8D"jer vrlo je opasno !"00
	asc	"Da se mices nisi u stanju, ali  "8D"si zato u opasnom sranju."00
	asc	"Umreti ovde vrlo je lako, pozuri"8D"i idi al' ne pitaj kako."00
	asc	"Sibica se zapalila ali brzo i   "8D"ugasila."00
	asc	"Da ubijes mamuta potrebna je    "8D"caka, jer mamut ipak nije neka  "8D"stara baka."00
	asc	"Zasto da ubijes tu lepu zver; pa"8D"to je nepravda a nije ni fer."00
	asc	"Ajde, nemoj da ubijas zivotinje "8D"koje izumiru !"00
	asc	"Pcele su osetile opasnost i brzo"8D"su odletele."00
	asc	"  Zdravo ludak, ja sam Igra.    "8D"Izvrsavam tvoja glupa naredjenja"8D"i mogu  ti  reci  da tako nikada"8D"neces kraja steci."00
	asc	"Ako si navik'o pricati tako,    "8D"znaj, mali covek sa mnom neces  "8D"lako."00
	asc	"Zar ne znas kolika si beda - ne "8D"mozes tek tako da otopis santu  "8D"leda."00
	asc	"Ja se njega bojim ... Hoces da  "8D"ga ubijem lopatom ?!?"00
	asc	"Dobro, kad si vec navalio neka  "8D"ti bude ! Bummm - i Atile nema  "8D"vise."00
	asc	"Namazao si se kremom i vrlo si  "8D"lep, ali ces tesko da dobijes   "8D"novu."00
	asc	"Sunce ju je sprzilo i od bola   "8D"place, ali svejedno neda da je  "8D"namazes."00
	asc	"Irena uziva i stenje tako glasno"8D"da je cuje i njezin dragi Iztok,"8D"koji brzo pritrci, izvuce mac i "8D"ubije te."00
	asc	"Ako nemas carobnu foru, ne mozes"8D"da tucas lepu Teodoru."00
	asc	"Neron je zahvalno uzeo tvoj dar "8D"a paljenje Rima ga je tako      "8D"zaposlilo da je zaboravio na    "8D"svoju harfu."00
	asc	"Dioklecijana je harfa tako      "8D"odusevila da ti je poklonio lep "8D"prsten."00
	asc	"Na zalost nisi bas dobar muzicar"8D"pa si unistio dragocenu harfu."00
	asc	"Nisi bas dzokej, pa te je lepi  "8D"konj bacio sa sebe i slomio ti  "8D"vrat."00
	asc	"Vratio si se na sever, put je   "8D"bio dug, ali sada nema povratka "8D"na jug."00
	asc	"Vila Raviojla na konja skoci,   "8D"jer na put sa tobom ona hoce    "8D"poci."00
	asc	"Sa konja je vila sisla i u      "8D"stranu malo otisla."00
	asc	"Spasio si lepu Kosovku devojku, "8D"ali sad pazi sta ces sa njom."00
	asc	"Kosovka devojka ne da caru da   "8D"spava i on te izbaci kroz vrata."8D""00
	asc	"Devojka je lepo vaspitana i nebi"8D"ti dala ni poljupca, kamo li    "8D"nesto drugo."00
	asc	"Mozda ce da te boli, ali vila   "8D"Raviojla ne sme da se voli."00
	asc	"Tako si slab svercer da se pitam"8D"gde ti zivis."00
	asc	"Ubio si divojarca i dobio       "8D"carobni kamen."00
	asc	"Zbog takvih kao sto si ti svi su"8D"vec izumrli."00
	asc	"Franjo Josif bolesti nema - ides"8D"dalje bez problema."00
	asc	"Otkopao si Emonca i sad treba da"8D"ides dalje prema zapadu, jer tu "8D"nema vise mesta za tebe."00
	asc	"Kip je tako lep, da su ti ljudi "8D"za   njega  dali  pet  posto  i "8D"poslali te dalje na zapad."00
	asc	"Uspeo si ubiti zver - paragraf."00
	asc	"Lavina je bila ogromna, a ti si "8D"se, glupane, smrzao za hiljadu  "8D"godina."00
	asc	"Mamut je dosao do tebe,         "8D"izgnjecio te u marmeladu od     "8D"kupusa."00
	asc	"Bodu te pcele - to boli         "8D"kuku-lele."00
	asc	"Zver je gladna ot kad' je veka, "8D"hoce da pojede nesto od coveka."00
	asc	"Na pocetak trke si dosao -      "8D"dileme nema,"00
	asc	"ali si poslednji - utesna       "8D"nagrada je krema."00
	asc	"Cuju se koraci, dolazi Justi, da"8D"bi se spasio cilibar ispusti."00
	asc	"Teodora je videla da nisi njen  "8D"muz i posto nisi imao cilibar da"8D"je utesis, ona te je ubila."00
	asc	"Kraljevic Marko ide sa tobom i  "8D"bez brige - pomoci ce ti puno."00
	asc	"Bio si vec skoro na kraju ali te"8D"je cudoviste unistilo zakonima."00
	asc	"Spectrum jako grije, otopiti    "8D"lavinu tesko mu nije."00
	asc	"ZX se je ukljucio, tiho zuji a  "8D"iz njega se pusi."00
	asc	"Ti bi voleo  da me vidis mrtvog "8D"ali se iz inata necu resetirati."8D""00
	asc	"Dali si idiot ?"00
	asc	"HELP !"00
	asc	"Doneo si Ireni ono sto je       "8D"trebala i ona ti je poklonila   "8D"Istokove carobne gace."00
	asc	"Tesko je doci na jug i bez      "8D"dragoga kamena nece ici."00
	asc	"Jednu zenu bi jos mogao, ali    "8D"takvu masu - nikako !"00
	asc	"Vila nece da pesaci pa probaj da"8D"nadjes bar konja."00
	asc	"Vino je slatko, crveno..."00
	asc	"HIK ?!"00
	asc	"Nema ulaza bez dozvole."00
	asc	""00
	asc	"Sada nije sezona utrka, ali ti  "8D"ionako uvek gubis."00
	asc	"Iako sam masina nisam tako      "8D"hladan da bih zeleo vlasnikovu  "8D"smrt."00
	asc	"Napao si Franju, ali je brzo    "8D"pritrcao strazar i ubio te."00
	asc	"PUFF ..."00
	asc	"Stara fora ne pali vise, zato   "8D"probaj nesto drugo."00
	asc	"Treba da budes lepo odeven."00
	asc	"Uzeli su i popili vino, a tebi  "8D"dali pismo."00
	asc	"Djavo se uplasi i pobegne, a    "8D"tebi ostavi vile."00
	asc	"Carica je sretna kod lipe a     "8D"Gregor ti je dozvolio da tovaris"8D"sol."00
	asc	"Urednik je objavio tvoje price i"8D"kao u zahvalu poklonio ti       "8D"sadnicu."00
	asc	"Vuk zuri s pisanjem i dobro     "8D"uspeva, jer pise onako kao sto  "8D"govori."00
	asc	"Ciril je ozdravio Metoda a u    "8D"zahvalu podario ti je AZBUKU."00
	asc	"Metoda jako boli zub,           "8D"ajde nemoj biti grub."00
	asc	"Zaplenili su ti vino ali sada   "8D"mozes putovati."00
	asc	"Dobre price za "A2"NOVIZE"A2" u Becu  "8D"su bolje nego   devize."00
	asc	"Metoda boli zub,                "8D"ajde nemoj biti grub."00
	asc	"Dosao si kasno i to je opasno."00
	asc	"Vreme prodje, kraj ti dodje."00
	asc	"Lavina hladna sada te drzi, na  "8D"sever i jug ispustiti te nece."00
	asc	"Pojeo si lobanju i usudio si se "8D"uzeti mac."00
	asc	"Milica je uzela nakit i naravno "8D"zaboravila na kraljevstvo."00

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
	macOBJ	36;"zlatno runo"
	macOBJ	O_NOTCRE;"zlatni kip Emonca"
	macOBJ	60;"mac"
	macOBJ	83;"sol"
	macOBJ	97;"zlatni kljuc u godinu 2000"
	macOBJ	O_NOTCRE;"dozvolu za tovarenje soli"
	macOBJ	84;"lipovu sadnicu"
	macOBJ	O_NOTCRE;"knjigu pripovedaka"
	macOBJ	1;"ogledalo"
	macOBJ	78;"pusku"
	macOBJ	O_NOTCRE;"konja"
	macOBJ	O_NOTCRE;"kraljevstvo"
	macOBJ	70;"zlatni djerdan"
	macOBJ	66;"cupriju"
	macOBJ	62;"zene"
	macOBJ	58;"lobanju"
	macOBJ	O_NOTCRE;"propusnicu za kuzni grad"
	macOBJ	55;"vino"
	macOBJ	O_NOTCRE;"vile"
	macOBJ	53;"sibu"
	macOBJ	8;"cudan kip"
	macOBJ	6;"zelenu regu"
	macOBJ	32;"udice"
	macOBJ	30;"ilirski novcic"
	macOBJ	18;"kutiju sibica"
	macOBJ	O_NOTCRE;""
	macOBJ	O_NOTCRE;"harfu"
	macOBJ	O_NOTCRE;""
	macOBJ	27;"smolu"
	macOBJ	21;"situlu"
	macOBJ	O_NOTCRE;"odelo"
	macOBJ	9;"kostanu iglu"
	macOBJ	O_CARRIED;"trafo za Spectrum"
	macOBJ	O_NOTCRE;"med"
	macOBJ	24;"drvo"
	macOBJ	4;"cilibar"
	macOBJ	O_CARRIED;"Microdrive"
	macOBJ	O_NOTCRE;"kremu za suncanje"
	macOBJ	O_NOTCRE;"carobne Iztokove gace"
	macOBJ	16;"vremensku prognozu"
	macOBJ	O_NOTCRE;"usmoljeno runo"
	macOBJ	O_NOTCRE;"smolu u situli"
	macOBJ	14;"ledenu lavinu"
	macOBJ	13;"zlog mamuta"
	macOBJ	29;"opasnog medveda"
	macOBJ	34;"halapljivu zver"
	macOBJ	33;"proteusa"
	macOBJ	O_NOTCRE;"ukljucen Spectrum"
	macOBJ	28;"pcele"
	macOBJ	12;"jugosaura"
	macOBJ	44;"lopatu"
	macOBJ	39;"Huna Atilu"
	macOBJ	O_NOTCRE;"Atilinu glavu"
	macOBJ	45;"lepu Irenu"
	macOBJ	41;"primamljivu Teodoru"
	macOBJ	O_NOTCRE;"harfu"
	macOBJ	50;"prsten"
	macOBJ	74;"sokola"
	macOBJ	38;"rimski novcic"
	macOBJ	O_NOTCRE;"kraljevstvo"
	macOBJ	73;"vilu Raviojlu"
	macOBJ	O_NOTCRE;"vilu na konju"
	macOBJ	O_NOTCRE;"kraljevica Marka"
	macOBJ	72;"Kosovku devojku"
	macOBJ	O_NOTCRE;"azbuku"
	macOBJ	82;"lek"
	macOBJ	81;"biser"
	macOBJ	O_NOTCRE;"lekoviti kamen"
	macOBJ	80;"kafu "A2"Minas"A2
	macOBJ	79;"vrecu pasulja"
	macOBJ	91;"Franju Josifa"
	macOBJ	O_NOTCRE;"sol u glavi"
	macOBJ	20;"jelenje koze"
	macOBJ	41;"zaptivac"
	macOBJ	90;"fiting"
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
	asc	8D"Tamno je."00
	asc	8D"Vidim i :"00
	asc	8D"Kazuj o gospodaru !"00
	asc	8D"Sta da radim?"00
	asc	8D"Pozuri sa kucanjem."00
	asc	8D"Kako napred?"00
	asc	8D"Za ovo nisam programiran."00
	asc	8D"U taj pravac ne mogu."00
	asc	8D"To ni Apple II"8D"nebi uradio."00
	asc	8D"Nosim "00
	asc	" (obucen)"00
	asc	"ne nista."00	; Nosim + ne nista.
	asc	8D"Siguran si da ne ide vise? "00
	asc	8D"Pa da probamo jos jednom! "00
	asc	8D"Kukavico !"00
	asc	8D"OK."00
	asc	8D"Skoci na gumicu !"00
	asc	8D"Upisao si poteza: "00	; ** new ** Simplify plural management (c) Janez
**	asc	8D"Upisao si "00
	asc	" poteza"00
	asc	"ov"00	; plural
	asc	". "00
	asc	8D"I zaradio "00
	asc	"%"00
	asc	8D"Toga nemam sa sobom."00
	asc	8D"Obe ruke imam zauzete."00
	asc	8D"To vec imam!"00
	asc	8D"To ne vidim ovde."00
	asc	8D"Suvise je tezko !"00
	asc	8D"To nemam u rukama !"00
	asc	8D"To sam vec obucen !"00
	asc	"D"00
	asc	"N"00
	asc	8D"Putevi vode na "00
	asc	8D"Ne vidim izlaza."00
	asc	8D"Ucitaj igru (ladica 1-9)? "00	; ** new ** load game (slot 1-9)?
	asc	8D"Spremi igru (ladica 1-9)? "00	; ** new ** save game (slot 1-9)?

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
	macWORD   1;"S"
	macWORD   1;"SEVE"
	macWORD   1;"SJEV"
	macWORD   2;"J"
	macWORD   2;"JUG"
	macWORD   3;"I"
	macWORD   3;"ISTO"
	macWORD   4;"Z"
	macWORD   4;"ZAHO"
	macWORD   4;"ZAPA"
	macWORD   5;"SI"
	macWORD   6;"SZ"
	macWORD   7;"JI"
	macWORD   8;"JZ"
	macWORD   9;"G"
	macWORD   9;"GORE"
	macWORD  10;"D"
	macWORD  10;"DOLE"
	macWORD  11;"VAN"
	macWORD  11;"IZAD"
	macWORD  12;"UNUT"
	macWORD  12;"UDJI"
	macWORD  13;"L"
	macWORD  13;"LEVO"
	macWORD  13;"DESN"
	macWORD  14;"KIP"
	macWORD  14;"KIPI"
	macWORD  14;"KIPE"
	macWORD  15;"NOVC"
	macWORD  15;"NOVA"
	macWORD  16;"UDIC"
	macWORD  17;"REGU"
	macWORD  17;"ZABU"
	macWORD  18;"VREM"
	macWORD  18;"PROG"
	macWORD  19;"RUNO"
	macWORD  20;"SIJ"
	macWORD  20;"IGLU"
	macWORD  20;"SIVA"
	macWORD  21;"NATA"
	macWORD  21;"OBUC"
	macWORD  21;"ODEL"
	macWORD  22;"SITU"
	macWORD  22;"POSU"
	macWORD  23;"SMOL"
	macWORD  24;"DAJ"
	macWORD  24;"SPUS"
	macWORD  24;"ODLO"
	macWORD  24;"BACI"
	macWORD  25;"UPAL"
	macWORD  25;"UKLJ"
	macWORD  26;"ZX"
	macWORD  26;"SPEC"
	macWORD  26;"SINC"
	macWORD  26;"RACU"
	macWORD  27;"TRAF"
	macWORD  27;"TRAN"
	macWORD  28;"MED"
	macWORD  29;"VATR"
	macWORD  30;"PROT"
	macWORD  30;"COVJ"
	macWORD  30;"COVE"
	macWORD  31;"UGAS"
	macWORD  31;"ISKL"
	macWORD  32;"POBE"
	macWORD  32;"UKRA"
	macWORD  32;"UZMI"
	macWORD  33;"SIBI"
	macWORD  34;"CILI"
	macWORD  35;"MCD"
	macWORD  35;"MICR"
	macWORD  35;"MIKR"
	macWORD  36;"UBIJ"
	macWORD  36;"NAPA"
	macWORD  37;"MAMU"
	macWORD  38;"PCEL"
	macWORD  39;"ZVER"
	macWORD  40;"JUGO"
	macWORD  41;"INVE"
	macWORD  43;"KORA"
	macWORD  43;"REZU"
	macWORD  43;"TOCK"
	macWORD  43;"NARE"
	macWORD  44;"KRAJ"
	macWORD  45;"FUK"
	macWORD  45;"JEBI"
	macWORD  45;"KURA"
	macWORD  45;"KURC"
	macWORD  45;"PIZD"
	macWORD  46;"LED"
	macWORD  46;"LAVI"
	macWORD  47;"SOS"
	macWORD  47;"POMO"
	macWORD  48;"OTOP"
	macWORD  49;"ATIL"
	macWORD  50;"GLAV"
	macWORD  51;"LOPA"
	macWORD  52;"KREM"
	macWORD  53;"NAMA"
	macWORD  54;"SE"
	macWORD  55;"IREN"
	macWORD  56;"GACE"
	macWORD  57;"FUKA"
	macWORD  57;"TUCA"
	macWORD  57;"SEVI"
	macWORD  57;"POJE"
	macWORD  58;"TEOD"
	macWORD  59;"ZAKO"
	macWORD  60;"EMON"
	macWORD  61;"HARF"
	macWORD  62;"PRST"
	macWORD  63;"ZAIG"
	macWORD  64;"ZENS"
	macWORD  64;"ZENE"
	macWORD  65;"CUPR"
	macWORD  65;"GRAD"
	macWORD  66;"SOKO"
	macWORD  66;"PTIC"
	macWORD  67;"DJER"
	macWORD  67;"NAKI"
	macWORD  68;"KRAL"
	macWORD  69;"KONJ"
	macWORD  70;"VILU"
	macWORD  71;"MARK"
	macWORD  72;"DEVO"
	macWORD  73;"CARJ"
	macWORD  74;"PROB"
	macWORD  75;"ZAJA"
	macWORD  75;"JASI"
	macWORD  76;"SPAS"
	macWORD  77;"MEC"
	macWORD  78;"LOBA"
	macWORD  79;"PROP"
	macWORD  80;"VINO"
	macWORD  81;"VILE"
	macWORD  82;"SIBU"
	macWORD  83;"SOL"
	macWORD  83;"NACL"
	macWORD  84;"DOZV"
	macWORD  85;"LIPU"
	macWORD  85;"SADN"
	macWORD  86;"BAJK"
	macWORD  86;"KNJI"
	macWORD  87;"ABEC"
	macWORD  87;"AZBU"
	macWORD  88;"LEK"
	macWORD  88;"LADJ"
	macWORD  89;"BISE"
	macWORD  90;"OZDR"
	macWORD  90;"IZLJ"
	macWORD  90;"IZLE"
	macWORD  91;"KAME"	
	macWORD  92;"UPUC"	
	macWORD  93;"KOZO"	
	macWORD  93;"DIVO"	
	macWORD  94;"PUSK"
	macWORD  95;"KAFU"
	macWORD  96;"PASU"
	macWORD  96;"VREC"
	macWORD  97;"FRAN"
	macWORD  97;"JOSI"
	macWORD  98;"POSA"
	macWORD  98;"CUDO"
	macWORD  99;"ODKO"
	macWORD 100;"ODKL"
	macWORD 101;"KLJU"
	macWORD 102;"ME"
	macWORD 103;"PIJ"
	macWORD 103;"POPI"
	macWORD 104;"OPIS"
	macWORD 104;"POGL"
	macWORD 104;"GLED"
	macWORD 105;"SAVE"
	macWORD 107;"CIRA"
	macWORD 107;"SJED"
	macWORD 107;"SEDN"
	macWORD 108;"LOAD"
	macWORD 109;"DA"
	macWORD 110;"SVUC"
	macWORD 110;"SKIN"
	macWORD 111;"DRVO"
	macWORD 112;"VRAT"
	macWORD 113;"LAZA"
	macWORD 114;"OGLE"
	macWORD 115;"SCRE"
	macWORD 115;"EKRA"
	macWORD 116;"CRTA"
	macWORD 117;"NE"
	macWORD 118;"KO"
	macWORD 118;"STA"
	macWORD 118;"TKO"
	macWORD 118;"KAKO"
	macWORD 118;"KOGA"
	macWORD 118;"ZAST"
	macWORD 119;"PROD"
	macWORD 120;"KUPI"
	macWORD 121;"UHVA"
	macWORD 121;"UPEC"
	macWORD 122;"KOZE"
	macWORD 123;"UDRI"
	macWORD 124;"VRAG"
	macWORD 125;"METO"
	macWORD 126;"ZAPT"
	macWORD 127;"FITI"
	macWORD 128;"CASE"	; ** new ** upper/lower case
                macWORD 129;"HOME"	; ** new ** top of screen on new location
                macWORD 130;"DEBU"	; ** new ** debug on/off
                macWORD 255;"_"
	