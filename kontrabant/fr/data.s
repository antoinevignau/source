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
	asc	"Version Apple II"8D8D
	dfb	7
	asc	"(c) 2025, Janez J. Starc &"8D
	dfb	9
	asc	"Brutal Deluxe Software"00

*	dfb	64,91,92,93,94,96,123,124,125,126
*	asc	"@[\]^`{|}~"


tblLOCATIONS
	asc "BIENVENUE DANS LA PREMIERE AVENTURE SLOVENE !!!"8D8D"Vous connaissez le but du jeu. L'ordinateur vous guidera "C0" travers des lieux familiers et inconnus, et vous lui conseillerez la marche "C0" suivre en francais simple."8D8D
88	ASC "N'abandonnez pas trop vite ; il nous faut quelques heures pour terminer, meme avec une carte et un sc"FB"nario. Tout ce qui arrive a une raison d'etre."8D8D"Nous vous souhaitons beaucoup de plaisir."8D8D
	ASC "Turk Ziga et Kmet Matevz. "8D"P.S. : des prix attendent les meilleurs !"00

	asc "La vie devient de plus en plus ennuyeuse pendant la saison s"FD"che. La t"FB"l"FB"vision r"FB"p"FD"te de vieux films, la radio est pleine de tristesse et les nouvelles dans les journaux ne valent meme pas la peine d'etre mentionn"FB"es."8D8D
	ASC "LA SEULE SOLUTION EST DE TROUVER UNE TELE, UN LECTEUR DE CASSETTES ET UN MICRO-ORDINATEUR. LE SEUL CHEMIN MENE DANS un monde plus vaste."00

	asc "Vous vous trouvez "C0" un c"FB"l"FD"bre carrefour europ"FB"en, quelque part au coeur de Ljubljana. De larges autoroutes modernes "C0" six voies m"FD"nent dans toutes les directions. Un homme ag"FB" s'approche de vous."00
	asc "Vous etes sur une colline. Il y a aussi une agr"FB"able auberge, devant laquelle est assis un homme "C0" grosse moustache qui vous demande un verre de rhum. Les chemins m"FD"nent "C0" l'E, au N et au NO."00
	asc "Vous etes entr"FB" dans la huiti"FD"me caserne d'un grand camp de contraception. Tout autour est rempli d'"FB"tudiants, et les sorties m"FD"nent au NE, au S et au BAS."00

	asc "Vous etes plong"FB" jusqu'aux genoux dans une eau de marais puante. Vous avez tr"FD"s froid aux pieds et vous voulez partir d'ici au plus vite. Au loin, vous apercevez un grand batiment blanc avec l'inscription : ..."
	ASC "PROTECTION INCENDIE. Les routes m"FD"nent au nord, au sud, "C0" l'est et au sud-ouest."00

	asc "Vous etes dans une grande usine qui sent le cirage, le shampoing et la paraffine."00
	asc "Au cr"FB"puscule, vous voyez de nombreuses pierres tombales abandonn"FB"es, dont une git meme au sol. L'atmosph"FD"re est tr"FD"s inqui"FB"tante. Des chemins sablonneux m"FD"nent au nord, "C0" l'ouest et au sud-ouest."00
	asc "De grands champs vous entourent. Un agriculteur, qui laboure avec une charrue command"FB"e par ordinateur, vous dit : "A2"Hg + Au = amalgame pour plombages."A2"Les routes m"FD"nent au nord et "C0" l'est."00
	asc "Vous vous trouvez devant une usine moderne, autour de laquelle des b"FB"b"FB"s heureux jouent. Un agent de s"FB"curit"FB" vous indique les chemins menant au nord et au sud."00
	asc "Devant une maison est assis un Turc accro au LSD, marmonnant : "A2"JE SAIS MAIS JE NE DIS PAS, JE SAIS MAIS JE NE DIS PAS..."A2" Des rues "FB"troites m"FD"nent au sud, "C0" l'ouest, au nord et au sud-est."00
	asc "Envelopp"FB"e d'une brume myst"FB"rieuse, la c"FB"l"FD"bre usine SPARK se dresse devant vous. On y d"FB"veloppe un nouveau micro-ordinateur : le HR 1884. Aidez-les et vous en obtiendrez un ! Les chemins m"FD"nent "C0" l'est et au sud-est."00
	asc "Vous etes dans la ville morte de notre grand po"FD"te, qui vous entoure tout excit"FB" et vous dit : "A2"Je suis l"C0" si vous avez besoin de moi !"A2" De mauvaises routes m"FD"nent "C0" l'est, "C0" l'ouest et au sud-est."00

	asc "La ville o"FC" vous vous trouvez est d"FB"cor"FB"e pour les fetes car le maire Marry se marie avec Matthias. Il y a un s"FB"minaire pour les programmeurs informatiques dans un batiment. "
	ASC "Tout le monde est tr"FD"s intelligent, il vaut donc mieux s'"FB"loigner vers le sud-ouest ou l'est."00

	asc "Vous etes arriv"FB" dans une station baln"FB"aire de renomm"FB"e mondiale o"FC" vous pourrez vous d"FB"tendre. En direction de l'ouest, vous voyez une ile au milieu d'un lac. Les sorties sont au nord-est, au nord et au nord-ouest."00
	asc "Vous etes sur une ile. Il y a une petite "FB"glise entretenue par des religieuses. De nombreuses histoires se d"FB"roulent sur cette ile. Vous pouvez "FB"galement voir la cloche "C0" voeux."00
	asc "Devant vous se trouve une location de bateaux. Un garde ob"FD"se dort profond"FB"ment devant. Les sorties sont au sud, au sud-est et au nord-est (du nord-est, vous voyez quelque chose de brillant au loin, mais ce n'est pas l'avenir)."00
	asc "L'"FB"clair de l'usine o"FC" ils travaillent avec un grand "FB"lan vous aveugle. Les prairies s'"FB"tendent "C0" l'est, au sud et au sud-ouest."00
	asc "Vous etes au coeur du trafic de contrebande carniolienne. Les chaussures peuvent le faire toutes seules, mais le reste 'ILS MONTENT'. Les sentiers de montagne m"FD"nent au S, N, O."00
	asc "Dans un vacarme violent, les avions d"FB"collent de l'a"FB"roport, le deuxi"FD"me plus grand du monde apr"FD"s Maribor."00
	asc "Vous etes dans la m"FB"tropole slov"FD"ne de Kamnik. Un ouvrier de l'usine locale ROPEVILLAGE vous dit : "A2"Une cravate n'est pas une pantoufle ; une cravate, c'est pour le cou !"A2" Si vous voulez partir, allez vers l'E ou l'O."00
	asc "Une agr"FB"able odeur de vieux beignets gras vous envahit les narines. Mais la fille dit : "A2"Peter m'a dit qu'il en mangeait tous les jours au diner."A2" S'ils sentent mauvais, allez vers l'est ou l'ouest."00
	asc "Avant de vous "FB"tendre de vastes champs d'or vert. C'est de l"C0" que sont fabriqu"FB"es les meilleures bi"FD"res de notre pays. Des sentiers champetres m"FD"nent "C0" l'est, "C0" l'ouest et au sud."00
	asc "Vous etes au chateau de Celje, o"FC" l'air n'est pas si mauvais grace "C0" l'altitude. Il y a une grande armure dans la pi"FD"ce. Des sentiers "FB"troits et escarp"FB"s m"FD"nent "C0" l'ouest et vers le bas."00
	asc "Vous etes arriv"FB" "C0" Celje, la ville des orf"FD"vres. L'air est tr"FD"s pollu"FB", alors soyez prudent ! L'air le plus pur est au nord, au nord-est, "C0" l'est et en haut."00
	asc "Vous voyez une grande usine qui est compl"FD"tement endett"FB"e. L'usine poss"FD"de encore quelques t"FB"l"FB"viseurs sous licence, mais ils veulent un ch"FB"quier pour eux. Vous ne pouvez sortir que vers le sud."00
	asc "Vous etes dans la fiert"FB" de Marlboro, "C0" Maribor. Apr"FD"s avoir pris le m"FB"tro, vous arrivez "C0" un quiz o"FC" l'on vous demande : "A2"Qu'est-ce qui est ROUGE et NOIR en meme temps ?"A200
	asc "Vous etes dans une petite ville de l'est. Il y a un homme qui a beaucoup de famille. C'est pourquoi il se vante : "A2"Mes oncles m'ont dit que vous devriez prendre soin de votre barbe !"A200
	
	asc "Devant vous se dresse la c"FB"l"FD"bre forteresse du Dr Rogelj, o"FC" sont soign"FB"s les accros "C0" l'informatique et ceux qui souffrent de cellulose h"FB"patique. Meme Kovi Janicic vient ici... "
	ASC "Les sentiers bien entretenus m"FD"nent au nord, "C0" l'est, au sud-ouest, au sud-est et "C0" l'ouest."00
	
	asc "Vous etes dans les studios de la grande radio, o"FC" ils diffusent du lait tous les jours. Dans le studio gisent quelques techniciens ivres : Ciril, Metod et Mickey Mouse. "
	ASC "Ici, "DC"a ressemble de plus en plus "C0" un tour de passe-passe. On ne peut s'"FB"chapper que par les escaliers."00
	
	asc "Vous voyez la c"FB"l"FD"bre pente des pauvres devant vous. Au sommet de la pente, une m"FD"re est assise, tenant une tasse de caf"FB" "C0" la main, servie par un certain Martin. "
	ASC "Les routes goudronn"FB"es m"FD"nent au NE, au SO et "C0" l'est."00

	asc "Vous etes devant l'entr"FB"e du mus"FB"e technique. Pour "FB"viter tout dommage, dirigez-vous vers le nord, l'est et l'ouest."00
	asc "Vous avez atteint le bureau de douane de Ljubelj. Juste apr"FD"s la porte, il y a un long tunnel sombre. Si vous ne souhaitez pas y aller, vous pouvez aller vers le sud."00
	asc "De l'eau bouillante jaillit du sol partout, mais l"C0" o"FC" elle ne jaillit pas, il y a un vignoble. Le climat est favorable et propice au repos. Les sorties sont au nord et au sud."00
	asc "Vous etes arriv"FB" au c"FB"l"FD"bre centre textile, o"FC" l'on fabrique des vetements modernes depuis l'age de pierre. La route m"FD"ne au sud-est."00
	asc "Dans la centrale nucl"FB"aire, on n'entend que le l"FB"ger bruit des machines et la commutation des relais. Soudain, vous entendez une alarme. Sur le pupitre de commande devant vous, 7 boutons s'allument. Sur lequel allez-vous appuyer ?"8D
	ASC "1 2 3 4 5 6 7 oo oo oo oo oo oo oo oo oo oo oo oo oo oo"00
	asc "Vous etes dans le New York slov"FD"ne. Vous voyez un artiste adulte en train de peindre. Il dit qu'il aimerait une gorg"FB"e de bi"FD"re fraiche. Les routes m"FD"nent "C0" l'E, "C0" l'O, au N et au S."00
	asc "Dans la ville qui poss"FD"de la premi"FD"re centrale nucl"FB"aire de notre pays, vous n'avez rien "C0" faire, alors allez au N, "C0" l'E ou "C0" l'O."00
	asc "Vous etes "C0" Zagreb "C0" la foire. Apportez votre ordinateur et vous recevrez un aspirateur. Vous pouvez aller au N, au S, "C0" l'E, au NE et "C0" l'O."00
	asc "La ville o"FC" vous vous trouvez poss"FD"de une immense usine de batons de bois "C0" tetes rouges. Au-dessus de l'entr"FB"e de l'usine, il y a un panneau : ON A BESOIN DE VOUS !!! Les routes pav"FB"es m"FD"nent au S, "C0" l'E et "C0" l'O."00
	asc "Vous etes dans une ville blanche, la capitale de notre patrie. Il y a un grand batiment de paragraphes sur le cot"FB" nord. Indiquez la devise correcte et entrez ou allez vers l'O, le N ou le S."00
	asc "De loin, vous pouvez voir Vucko, qui veille sur notre seule ville olympique (pour l'instant). Des chemins presque impraticables m"FD"nent au N, au SE, au S et "C0" l'E."00
	asc "Vous etes dans une ville o"FC" la Morava ne s'"FB"puise jamais. Tout le monde dans la ville "FB"coute quelqu'un qui dit que c'est tr"FD"s beau. Les rues vont dans les directions N, S, O, et A L'INTERIEUR du ???."00
	asc "Vous etes devant un joli caf"FB". Tout le monde y raffole du caf"FB", et on l'"FB"change contre des lecteurs de cassettes en grande quantit"FB". Le retour ne peut se faire que DEHORS."00
	asc "Vous etes arriv"FB" "C0" un c"FB"l"FD"bre centre de confiserie. L'odeur est agr"FB"able depuis l'O. Les sorties sont au N, au NO et au S."00
	asc "Tout autour de vous, il n'y a que des montagnes noires. Les chemins m"FD"nent "C0" l'E et au N."00
	asc "Vous etes dans une ville travers"FB"e par une rivi"FD"re extremement propre. La puanteur vous poussera tot ou tard vers le nord ou le nord-ouest."00
	asc "Vous vous trouvez au milieu d'une foret sombre. Au loin, vous entendez les hurlements des loups et des ours. Vos chances de survie sont minimes. Les sentiers entre les arbres m"FD"nent au sud et "C0" l'ouest."00
	asc "La ville o"FC" vous vous trouvez est c"FB"l"FD"bre pour ses produits secs. Leurs barriques sont les meilleures. Urban vous dit : "A2"Je vous donne le produit pour la mati"FD"re premi"FD"re !"A2" Les routes vont vers l'est, le sud-est et le nord-ouest."00
	asc "Tout autour de vous sent l'orge grill"FB"e, car la ville poss"FD"de l'une des meilleures brasseries du monde. Vous pouvez aller vers le nord et le sud."00
	asc "Sur une petite colline se dresse un monument d"FB"di"FB" "C0" un c"FB"l"FD"bre contrebandier de livres. Aujourd'hui encore, on peut y trouver de nombreuses choses int"FB"ressantes, car les habitants travaillent temporairement "C0" l'"FB"tranger. Les routes m"FD"nent au nord-ouest et au sud-est."00
	asc "Au seuil de sa ville natale se trouve Desnstik, et vous dites : "A2"Allez de Litija "C0" Catez, et vous vivrez beaucoup de choses int"FB"ressantes !"A2" Traversez les diagonales."00
	asc "Le conte de f"FB"es raconte que des sorci"FD"res se rassemblaient autrefois sur la colline o"FC" vous vous trouvez. Il ne reste d'elles qu'une pierre sur laquelle elles tuaient parfois leurs ennemis. Le sentier forestier descend."00
	asc "Vous etes dans une vaste zone karstique. La Slivnica s'"FB"l"FD"ve au-dessus de vous, et le sentier m"FD"ne au nord."00
	asc "Vous etes "C0" Keltska Bistrica, une station interm"FB"diaire entre Rijeka et Postojna. Vous pouvez aller au nord-ouest et au sud-est par de belles routes."00
	asc "Vous etes dans une grande ville portuaire, qui regorge d'individus suspects venus du monde entier. Attention ! Les routes terrestres m"FD"nent au nord, "C0" l'ouest et au nord-ouest."00
	asc "Vous etes dans la ville natale de notre c"FB"l"FD"bre boxeur Mate Parlow. Il y a aussi une boulangerie o"FC" Pate a commenc"FB" son voyage. Les routes m"FD"nent au nord et au nord-est."00 ; **27 3 2025**
	asc "Vous etes dans la Silicon Valley yougoslave, o"FC" sont fabriqu"FB"es les c"FB"l"FD"bres calculatrices DIGITRON. Les routes m"FD"nent au nord et au sud."00
	asc "Vous etes dans le port de Rose, o"FC" tout est bond"FB" de touristes. Sur un mur, il est "FB"crit en grandes lettres : NE RESPIREZ PAS PAR MON COLLIER ! Vous pouvez aller au nord ou au sud."00

	asc "De belles juments galopent devant vous, celles qu'utilisent tous les contrebandiers. Au fond se trouve le batiment administratif, o"FC" ils placent les commandes de file d'attente pour elles." ; **27 3 2025**
	ASC "Ils accueillent "FB"galement des invit"FB"s, moyennant des frais raisonnables. Le chemin m"FD"ne du nord au sud."00
	
	asc "Vous etes devant l'entr"FB"e d'une grande grotte sombre, situ"FB"e au nord. Si vous n'etes pas sp"FB"l"FB"ologue, allez au nord-est, au sud-est ou au sud-ouest."00
	asc "Vous etes dans un endroit entour"FB" de forets. Depuis des temps imm"FB"moriaux, la tradition veut que les voyageurs soient vol"FB"s ici. Mais vous pouvez vous "FB"chapper par le nord-est, l'ouest et le sud-ouest."00
	asc "L'ancienne ville mini"FD"re vous accueille et vous offre toutes ses richesses. Souvenez-vous d'un certain message et ne prenez pas ce qui vous est superflu. Le chemin m"FD"ne "C0" l'est et au sud-ouest."00
	asc "Tant que vous continuez "C0" le r"FB"p"FB"ter, je ne pense pas "C0" vous aider. Grace "C0" moi, vous pouvez obtenir un doctorat ici. O"FC" m"FD"nent les chemins, vous devrez le d"FB"couvrir par vous-meme."00
	asc "Ils vous surveillent ; un faux pas peut etre fatal."00
	asc "Ils vous observent ; un faux mouvement peut etre fatal."00
	asc "Il fait chaud. Le bon mot ici vous sauve, le mauvais vous d"FB"truit."00
	asc "Vous etes "C0" l'entr"FB"e d'une grotte souterraine. De l'eau glac"FB"e goutte du plafond, et quelque part dans les profondeurs, une rivi"FD"re gronde. D'"FB"troits couloirs m"FD"nent au N, au S et "C0" l'O."00
	asc "Vous etes dans une grotte. Il fait tr"FD"s froid. Sur le mur, il est "FB"crit au fusain : N'ALLEZ PAS PLUS LOIN ! Des chemins humides m"FD"nent au S et au SO."00
	asc "Vous etes dans une grotte. Vous pouvez voir un peu. Les chemins m"FD"nent au S et "C0" l'O."00
	asc "Vous etes dans une grotte. Vous pouvez voir un peu. Les chemins m"FD"nent au N et "C0" l'E."00
	asc "Vous etes dans une grotte. Vous pouvez voir un peu. Les chemins m"FD"nent au S, "C0" l'O et au NE."00
	asc "Vous etes dans une grotte. Vous pouvez voir un peu plus. Les chemins m"FD"nent "C0" l'E et "C0" l'O."00
	asc "Il fait plus clair - vous etes dans une grotte foresti"FD"re. Les chemins m"FD"nent au S, "C0" l'E, "C0" l'O et au NO."00
	asc "Vous etes dans la foret. Les chemins m"FD"nent au N et "C0" l'E."00
	asc "Vous etes dans une vieille foret sombre. Les chemins m"FD"nent au N, au NE, "C0" l'E et "C0" l'O."00
	asc "Vous etes dans une vieille foret sombre. Les chemins m"FD"nent "C0" l'O et au SE."00
	asc "Vous etes dans une vieille foret sombre. Les chemins m"FD"nent au N et "C0" l'E."00
	
	asc "Vous etes dans une vieille foret sombre. Les chemins m"FD"nent au S, "C0" l'E et "C0" l'O."00
	asc "Vous vous trouvez dans la salle bleue du chateau cach"FB". La grande salle est "C0" l'O."00
	asc "Vous etes au chateau de Predjama, dans la salle rouge. Les sorties sont au nord, "C0" l'est et au sud-ouest."00
	asc "Vous etes dans la salle violette."00
	asc "Vous etes dans la salle verte. Les tapis sont au nord-est et "C0" l'ouest."00
	asc "Vous etes dans la salle jaune."00
	asc "Vous etes dans la salle blanche. La seule porte donne "C0" l'ouest et l'escalier descend. Il y a un t"FB"l"FB"phone au mur, et dans l'annuaire, il est indiqu"FB" : "A2"Appel en cas de d"FB"tresse : 061-313715"A200
	asc "Vous etes dans une salle violette."00
	asc "Vous vous tenez parmi d'"FB"tranges pierres. L'endroit sent la mort. Vous entendez des rires au sud. Les routes m"FD"nent "C0" l'ouest, au nord-est, au sud et au sud-est."00
	asc "Devant vous se trouve un lac, et au-dessus se trouve une maison en bois sur pilotis. Beaver Janez sait o"FC" se trouve le bateau. De l'autre cot"FB" du lac, vous voyez la SAINTE TRINITE."00
	asc "Vous etes un vrai crochet (racine) ! "A2"Nagez plus au sud."A200
	asc "Vous etes dans un tunnel. Il y a de l'obscurit"FB" autour de vous, mais n'ayez pas peur, car nous sommes deux."00
	asc "Vous etes dans un tunnel qui nous relie "C0" tous... oncles et tous... tantes. Traversez-le !"00
	asc "Vous etes toujours dans le tunnel. D"FB"pechez-vous, car l'air est tr"FD"s mauvais et il est d"FB"j"C0" difficile de respirer."00
	asc "Vous etes "C0" la sortie d'un grand tunnel. N'attendez pas, mais partez d"FD"s que possible. D"FD"s que possible !"00
	asc "Vous marchez encore dans le tunnel. Une bouff"FB"e d'air frais arrive de quelque part, alors n'abandonnez pas."00
	asc "Vous etes dans la partie autrichienne du tunnel. Choisissez le pays o"FC" vous souhaitez vous rendre et allez-y."00
	asc "Vous etes "C0" l'entr"FB"e autrichienne du tunnel. Le mur dit en guise de bienvenue : "A2"Hier wird Deutsch gesprochen!"A200
	asc "Vous etes au bureau de douane autrichien. Ils vous interrogent sur Sliwowitz, et pour "FB"viter la tentation, cette chose n'est meme pas dans le jeu."00
	asc "Vous etes dans les montagnes. Vous entendez un troupeau de moutons et le yodel de leur berger, qui connait tous les gardes-fronti"FD"res. Un sentier "FB"troit m"FD"ne "C0" l'E."00
	asc "CAMBIO-WECHSELSTUBE-EXCHANGE. Vous vous trouvez devant le centre commercial slov"FD"ne VELIKE. Leur devise est : VENIR, VOIR, ACHETER, PARTIR. Apr"FD"s le shopping, vous pouvez visiter N, S et NE."00 
	asc "Vous etes "C0" la Pierre du Prince. Avec un peu d'imagination, vous pouvez imaginer des images du pass"FB"."00 
	asc "Du sthst vor einem Kasino neben Worther See.Um einzutreten mus man eine Krawatte haben. Strasen fuhren nach Ost,West and Sud."00 
	asc "Du bist im Klagenfurt. Hier gibt es viele Sachen, aber du hast genug Zeit und Geld. Gassen fuhren nach Nord, West et Nordwest."00 
	asc "Du bist an einem See. Man dit, das hier einmal auch ein Held, Tzchrthomyr genannt lebte. Du kannst zum Nordwest gehen."00 
	asc "In Wein trinken alle Leute Wien. Aber du must die Reise fortsetzen. Grose Strassen gehenn ach Ost und Sudost."00 
	asc "Jetzt bist du im Munchen. Hier kann man gute Computer und Bier kaufen. Winklige Strassen fuhrenn ach Ost, West and Sud."00 
	asc "Du kommst in eine Bierstube, wo man gutes Bier trinken kann. Aber das Bier schadet der Gesundheit und du must nach Nord, West oder Nordost gehen."00 
	asc "Jetzt bist du in einem grosen Geschaft fur Computer. Du siehst viele Computer, aber welcher ist der beste? Is der von CBM ou SPECTRUM?"00 ; **27 3 2025** 
	asc "Vous vous trouvez dans l'un des sites touristiques du Sex Shop de Munich. Les images sur les murs sont tentantes, mais..."00
	asc "Vous etes au casino. Prenez les grosses roulettes et les machines "C0" sous et donnez l'argent aux gens."00
	asc "Vous etes dans un labyrinthe de paragraphes. Les chemins m"FD"nent dans toutes les directions, mais attention aux trous dans la loi."00
	asc "Vous etes dans un labyrinthe de paragraphes. Les chemins m"FD"nent dans toutes les directions, mais attention aux trous dans la loi."00
	asc "Vous etes dans un labyrinthe de paragraphes. Les chemins m"FD"nent dans toutes les directions, mais attention aux trous dans la loi."00
	asc "Vous etes dans un labyrinthe de paragraphes. Les chemins m"FD"nent dans toutes les directions, mais attention aux trous dans la loi."00
	asc "Vous etes dans un labyrinthe de paragraphes. Il y a aussi Jernej, qui cherche une licence pour importer un micro-ordinateur."00
	asc "Vous etes au Tr"FB"sor. Dans le mur se trouve un coffre-fort qui ne peut etre ouvert que par un mot magique, "FB"crit au feutre noir "FB"pais au dos d'un des kiosques pr"FD"s de Figovec."00
	asc "Vous etes sur la bonne voie, continuez jusqu'"C0" S."00
	asc "Vous vous tenez pr"FD"s d'un lac "FB"trange, o"FC" vit le h"FB"ros Crtomir, qui a besoin de compagnie f"FB"minine."00 ; **27 3 2025**
	asc "Vous vous tenez haut dans les montagnes. Autour de vous se trouvent des moutons, et aussi leur berger, qui aime regarder les images."00
	asc "De l'autre cot"FB" de l'alpage, Kekec saute joyeux et chante des chansons sur ses actes h"FB"roiques."00
	asc "Pehta est venue vers vous, qui vous bat pour un morceau de pain. Donnez-lui quelque chose, afin qu'elle ne vous mange pas !"00 ; **27 3 2025**
	asc "Vous etes sur une petite ile au milieu d'un lac. Leur prot"FB"g"FB"e Vragumila prend un bain de soleil sur une chaise longue au milieu des nonnes. Elle pense "C0" votre bien-aim"FB", mais il ne peut pas y aller."00
	asc "Vous etes dans un petit village. Il fait si froid que vous etes compl"FD"tement engourdie."00
	asc "Vous etes "C0" Bedanec (l'homme de la mis"FD"re). Il n'y a rien "C0" voir, car tout est mis"FB"rable."00
	asc "La petite fille au bl"FB" garde la farine. Quant aux roses, elle est compl"FD"tement malheureuse."00
	asc "Vous etes en r"FB"union au club de bowling de Navje. Comme les combats sont int"FB"ressants, il y a beaucoup de pierres pour s'asseoir."00
	asc "Autour de vous se trouve le quartier du gang des Chaussettes. Attention aux dangers."00
	asc "Vous etes au chateau de Celeia. Profitez-en, car il n'existe qu'aujourd'hui et plus jamais."00
	asc "Vous etes dans la cit"FB" des trois "FB"toiles. Si vous connaissez le mot magique, vous pouvez aller au mont Peca, mais soyez prudent, car les lieux sont tr"FD"s d"FB"licats."00
	asc "Le roi Matthias est assis "C0" la table. Une longue barbe sale est enroul"FB"e autour de la table. Vous pouvez obtenir une "FB"p"FB"e ici."00
	asc "Vous etes dans un chateau o"FC" ne vivent que des gens bien, qui m"FB"ritent d'etre kidnapp"FB"s."00
	asc "Ursula attend les gar"DC"ons de la Soci"FB"t"FB" de recherche fluviale sur la piste de danse. Laissez tout ce dont vous n'avez pas besoin, car on danse ici."00
	asc "En contrebas, vous voyez une ville gard"FB"e par un dragon vert. Sur la tour du chateau, il est "FB"crit : ATTENTION, FRAICHEMENT PEINT !!!"00
	asc "Tout sent le parfum enivrant des roses. Mais les roses ont des "FB"pines douloureuses, c'est pourquoi vous avez besoin de gants."00
	asc "Vous etes au sommet des Jumeaux Sacr"FB"s. Il y a une cafeti"FD"re ici, mais malheureusement, elle ne peut pas fonctionner."00
	asc "Vous etes pr"FD"s d'un lac intermittent. De quelque part, vous pouvez entendre le rire des sorci"FD"res."00
	asc "Vous etes au bord de la mer. L"C0" se tient aussi la laide Vida, qui ne peut plus laver les couches quotidiennement. Elle a "FB"galement tout l'"FB"quipement de plong"FB"e n"FB"cessaire offert par son mari."00
	asc "Vous etes dans une clairi"FD"re au milieu de la foret. Les chemins vont au sud-est, "C0" l'ouest et au nord-ouest."00
	asc "Vous etes dans le chateau o"FC" vit Fr"FB"d"FB"ric, qui ne veut que Veronika. Aidez-le et il vous r"FB"compensera !"00
	asc "Vous etes pr"FD"s de la rivi"FD"re Kolpa. Les gens d'ici sont tr"FD"s forts ; certains, comme Klepec Tepec, d"FB"racineraient des arbres entiers s'il mangeait seulement quelque chose de sucr"FB"."00
	asc "Vous etes au sommet de la montagne. Il y a aussi un autel de sorci"FD"res. S'il vous plait, partons ; J'ai peur."00
	asc "Vous etes dans une auberge en bord de route o"FC" ils ont de tr"FD"s belles chambres doubles."00
	asc "La grotte seule et l'obscurit"FB"."00
	asc "La grotte seule et l'obscurit"FB"."00
	asc "La grotte seule et l'obscurit"FB"."00
	asc "La grotte seule et l'obscurit"FB"."00
	asc "La grotte seule et l'obscurit"FB"."00
	asc "La grotte seule et l'obscurit"FB"."00
	asc "Foret tr"FD"s dense."00 ; **27 3 2025**
	asc "Foret tr"FD"s dense."00 ; **27 3 2025**
	asc "Foret tr"FD"s dense."00 ; **27 3 2025**
	asc "Foret tr"FD"s dense."00 ; **27 3 2025**
	asc "Foret tr"FD"s dense."00 ; **27 3 2025**
	asc "Vous etes dans la grotte de la foret. Seulement alors... LE PLUS FORT RESTE !"00
	asc "Vous etes dans la chambre du chevalier."00
	asc "Vous etes dans le chateau o"FC" vit Predjama Erazem."00
	asc "Vous etes dans la salle de duel."00
	asc "Vous etes dans la salle de danse."00
	asc "Vous etes dans la salle "C0" manger."00
	asc "Vous etes dans la biblioth"FD"que."00
	asc "Vous etes dans des caves. Le sol est froid, car il est fait de terre pi"FB"tin"FB"e."00
	asc "Vous vous trouvez sous le chateau de Predjama. Ils vous tirent dessus de peur que vous ne voliez le tr"FB"sor. Le chemin monte au chateau, "C0" l'ouest et au sud vers la foret."00
	asc "Vous etes sur un pont-levis qui se ferme brutalement. Un serviteur sort du chateau avec une poubelle."00
	asc "Vous etes dans un appartement. Vous ne voyez qu'une table et un chaise."00
	asc "Vous etes au pays du coquelicot. Il fait chaud, alors retournez vers le nord."00
	asc "Tout autour, il y a des champs de bl"FB". Des routes droites m"FD"nent "C0" l'est et au sud."00

*------------------------------
* MESSAGES
*------------------------------

tblMESSAGES
	asc	"Tu es nu. Veronika rougit."00
	asc	"Tu le regretteras !"00
	asc	"Tu es en Slov"FB"nie, alors parle-moi en slov"FD"ne, idiot !"00
	asc	"Klepec Tepec prend un beignet et te donne d'excellentes planches de chene en guise de remerciement."00
	asc	"Que dois-je faire du tien ?"00
	asc	"Euh ! Celui-ci m'ira tr"FD"s bien, vu qu'on marche depuis longtemps."00
	asc	"Bon. Je suis repos"FB"e, alors allons-y."00
	asc	"Le jeu est termin"FB", c'"FB"tait une danse endiabl"FB"e."00
	asc	"Un homme reconnaissant te donne un t"FB"l"FB"viseur import"FB" d'un programme abandonn"FB"."00 ; **27 3 2025**
	asc	"Frederick le rayonnant prend Veronika et, en guise de remerciement, lui offre un pot d'or."00 ; **27 3 2025**
	asc	"PUFFF ..."00
	asc	"Frederick n'aime plus l'expression de Veronika. Il sort une "FB"p"FB"e et te la plante dans les cotes. Quelle folie !!"00 ; **27 3 2025**
	asc	"J'imagine que Veronika ne t'a pas fait de maquillage !"00
	asc	A2"Allons-y, mon ch"FB"ri"A2", d"FB"cide-t-elle, puis elle saute rapidement dans tes bras."00
	asc	"Veronika a d"FB"j"C0" enlev"FB" son jean moulant et t'invite "C0" venir la s"FB"duire."00
	asc	"Elle te gifle. Beurk, comme les filles des contes de f"FB"es sont fortes. R"FB"veille-toi."00
	asc	"Grince...Grince...Grince...(5 points)"00
	asc	"Herman de Celje te prend Veronica."00 ; **27 3 2025**
	asc	"Herman veut garder Veronica, mais ton "FB"p"FB"e ne le laisse pas s'en approcher."00
	asc	"Matej te montre le gant de pr"FD"s... pif... pif... pif"00
	asc	"Ils te donnent l'apprenti Matej, qui monte l'"FB"paule "FB"mouss"FB"e..."00
	asc	"En "FB"change du cher invit"FB", tu as la protection de la commande."00
	asc	"Vous etes enregistr"FB" sous le num"FB"ro 1921212, VEUILLEZ NOUS ALLOUER JUSQU'A 28 JOURS POUR LA LIVRAISON."00
	asc	"L'homme "FB"pingle un badge sur ta poitrine et te souhaite bonne chance."00 ; **27 3 2025**
	asc	"MERCI !"00
	asc	"L'oeil gauche est violet."00
	asc	A2"Mmm, che buono !"A2" dit Tepec en posant les belles planches de chene qui le soutiennent."00 ; **27 3 2025**
	asc	"Urban vous donne des barils en disant : "A2"Ces barils ont "FB"t"FB" fabriqu"FB"s par mon p"FD"re pour un pasteur corrompu."A200 ; **27 3 2025**
	asc	"Trubar : "A2"Je"A2"suis d"FB"j"C0" trop vieux pour faire de la contrebande. Mettez le Spectrum dans le baril et tout ira bien."A200 ; **27 3 2025**
	asc	"N'abandonne pas maintenant, "DC"a va arriver !"00
	asc	"Coucou, je suis toujours l"C0"... (clavier, il n'y a pas assez d'armure pour toute la RH dans ce jeu)."00
	asc	"SILENCE, ON TRAVAILLE !"00
	asc	"OH MON DIEU, UN TEL ASPIRATEUR ENTRE TES JAMBES EST TOUT AUTRE QU'UN BALAI, CA VAUT LA PEINE DE LE DIRE."00
	asc	"Tu vois un grand trou dans le sol."00
	asc	"Ils t'attaquent, mais ton armure peut le retenir."00
	asc	"La cupidit"FB" sans armure est une chose terriblement triste."00
	asc	"Le tr"FB"sor est enterr"FB". (pourquoi fais-tu "DC"a, je pr"FB"f"FD"re cet endroit)"00
	asc	"Tu as d"FB"terr"FB" le tr"FB"sor."00
	asc	"Tout est fini maintenant, tu as d"FB"truit la pelle."00
	asc	"Les lunes s'enfoncent dans la douceur du joystick et Bogomila se pr"FB"cipite dans tes bras."00 ; **27 3 2025**
	asc	"Crtomir t'a confisqu"FB" le SPECTRUM et dit qu'il te le donnera uniquement pour son propre bien."00
	asc	"Kekec t'a dit : Tu peux fuir Bedanec si tu portes une arme."00
	asc	"Tu m'as rendu Bogomila - merci, on va nous laisser tranquilles maintenant, et je t'ai donn"FB" le Sinclair."00 ; **27 3 2025**
	asc	"Allez ! Tu n'es plus un b"FB"b"FB" !"00
	asc	"Rozle est perdu dans les images, il t'a laiss"FB" la flute."00
	asc	"Porte une cravate en soie, "DC"a te sortira de ce p"FB"trin."00
	asc	"Urska te verse de l'eau dessus. Tu te r"FB"veilles dans ta chambre, somnolent."00
	asc	"D"FB"butant, reste "C0" la maison !"00
	asc	"Clic..."00
	asc	"TOUT LE MONDE SE BOUCHERAIT LA TETE !"00
	asc	"J'ai besoin d'un tonneau pour me cacher."00
	asc	"Le douanier ne tombe pas dans le panneau : c'est un vieux truc, cacher des choses dans des tonneaux."00
	asc	"Un Bedanec, tir"FB" "C0" distance juste avant la fin, a renvers"FB" le courageux aventurier d"FB"sarm"FB"."00 ; **27 3 2025**
	asc	"Vous devez avoir un passeport valide et exporter de la haute technologie, et vous pourrez passer !"00 ; **27 3 2025**
	asc	"Ils t'ont plum"FB" jusqu'"C0" la derni"FD"re goutte !"00
	asc	"Bravo !!! Le mot de passe secret est : tempete"00
	asc	"Je nage, je nage, je nage, je nage comme un cobaye."00
	asc	"La belle Ursula n'est pas reconnaissante, mais te verse un seau d'eau glac"FB"e... Tu reprends doucement tes esprits."00
	asc	"On ne peut acheter ici qu'avec des devises convertibles."00
	asc	"Tu n'as pas d'argent ????"00
	asc	"Booooooon..."00
	asc	"Crtomir te remercie, il te donne cinq pour cent."00
	asc	"La belle Vida se tenait au bord de la mer, elle t'a donn"FB" un masque pour les couches."00
	asc	"Je ne vois rien de sp"FB"cial."00
	asc	"Bravo ! La r"FB"ponse est correcte, c'est pour "DC"a que tu as la collection Attach"FB" !"00

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
	macOBJ	O_NOTCRE;"t"FB"l"FB"vision"
	macOBJ	O_NOTCRE;"ch"FB"quier"
	macOBJ	O_NOTCRE;"pot plein de pi"FD"ces d'or"
	macOBJ	O_NOTCRE;"collection d'attaches"
	macOBJ	O_NOTCRE;"lecteur de cassettes"
	macOBJ	O_NOTCRE;"caf"FB
	macOBJ	O_NOTCRE;"farine de sarrasin"
	macOBJ	155;"tr"FB"sor fabuleux"
	macOBJ	132;"daphn"FB" d'hiver"
	macOBJ	29;"gants"
	macOBJ	O_NOTCRE;"clavier HR 1884"
	macOBJ	O_NOTCRE;"micro-ordinateur-"C0"-faire"8D"livr"FB" "C0" faire soi-meme"
	macOBJ	O_NOTCRE;"tonneau "C0" double fond"
	macOBJ	O_NOTCRE;"planches de chene"
	macOBJ	21;"beignet"
	macOBJ	O_NOTCRE;"Deutsche Mark"
	macOBJ	O_NOTCRE;"armure magique"
	macOBJ	O_NOTCRE;"aspirateur turbo"
	macOBJ	O_NOTCRE;"sifflet"
	macOBJ	132;"edelweiss"
	macOBJ	41;FB"quipement d'alpinisme"
	macOBJ	98;"pistolet"
	macOBJ	107;"magazines porno"
	macOBJ	107;"joystick"
	macOBJ	20;"cravate"
	macOBJ	O_NOTCRE;"ZX SPECTRUM"
	macOBJ	O_NOTCRE;FB"pee du roi Matthias"
	macOBJ	9;"couches"
	macOBJ	6;"bougie"
	macOBJ	39;"allumettes"
	macOBJ	40;"lampe torche"
	macOBJ	O_NOTCRE;"mercure"
	macOBJ	3;"rhum pour le courage"
	macOBJ	16;"bateau"; 34 COLN
	macOBJ	22;"houblon"
	macOBJ	O_NOTCRE;"bi"FD"re"
	macOBJ	114;"passeport"
	macOBJ	O_NOTCRE;"bougie allum"FB"e"
	macOBJ	O_NOTCRE;"lampe torche allum"FB"e"
	macOBJ	2;"badge sur lequel est "FB"crit :"8D"ATTENTION AVENTURIER DEBUTANT"
	macOBJ	34;"robe de haute couture europ"FB"enne"
	macOBJ	129;"belle V"FB"ronique"
	macOBJ	O_NOTCRE;"file d'attente pour la jument"
	macOBJ	O_NOTCRE;"Matej"
	macOBJ	O_NOTCRE;"un paquet de dinars"
	macOBJ	31;"armure"
	macOBJ	45;"pelle"
	macOBJ	120;"Bogomila d"FB"sireuse"
	macOBJ	O_NOTCRE;"ta photo (tu es beau)"
	macOBJ	O_NOTCRE;"passeport valide"
	macOBJ	O_NOTCRE;"SPECTRUM cach"FB" dans un tonneau"
	macOBJ	O_NOTCRE;"gros sac de charbon"
	macOBJ	O_NOTCRE;"masque de plong"FB"e"
	macOBJ	O_NOTCRE;"ZX SPECTRUM"
	macOBJ	O_NOTCRE;"SPECTRUM cach"FB" dans un tonneau"8D
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
	asc 	8D"Il fait nuit noire."00
	asc 	8D"En plus, je vois : "00
	asc 	8D"J'attends ta commande."00
	asc 	8D"J'attends des conseils, mon ami."00
	asc 	8D"Et maintenant, encore des pitreries ?"00
	asc 	8D"Que dois-je faire ?"00
	asc 	8D"Je ne comprends pas du tout."8D"Essaie de le dire autrement."00
	asc 	8D"Tu ne vois pas qu'il n'y a aucun chemin dans cette direction ?"00
	asc 	8D"Mais je ne peux pas faire "DC"a."00
	asc 	8D"Vous poss"FB"dez : "00
	asc 	" (port"FB")"00
	asc 	"En fait, rien."00
	asc 	8D"Est-ce vraiment la fin du jeu ? "00
	asc 	8D"ENFIN LA FIN... Voulez-vous reessayer ? "00
	asc 	8D"Merci pour la compagnie !"00
	asc 	8D"OK."00
	asc 	8D"Chatouillez pour continuer "00
	asc 	8D"Vous avez vraiment jou"FB" "00
	asc 	" tour"00
	asc 	"s"00 ; pluriel
	asc 	". "00
	asc 	8D"Vous avez gagn"FB" "00
	asc 	" points."00
	asc 	8D"Je ne porte pas "DC"a du tout."00
	asc 	8D"Je ne peux pas, j'ai les mains pleines."00
	asc 	8D"Je l'ai d"FB"j"C0"."00
	asc 	8D"Mais il n'est pas l"C0"."00
	asc 	8D"C'est trop lourd. Pose quelque chose d'abord. "00
	asc 	8D"Je n'ai pas "DC"a."00
	asc 	8D"Je le porte d"FB"j"C0"."00
	asc 	"O"00
	asc 	"N"00
	asc 	8D"Chemins menant "C0" : "00
	asc 	8D"Je ne vois aucun moyen. "00
	asc 	8D"Charger la partie (emplacement 1-9) ? "00	; ** nouveau ** charger la partie (emplacements 1-9) ?
	asc 	8D"Sauvegarder la partie (emplacement 1-9) ? "00	; ** nouveau** sauvegarde de la partie (emplacements 1-9) ?

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
	macWORD	1;"N"	; "S"
	macWORD	1;"NORD"	; "SEVE"
	macWORD	2;"S"	; "J"
	macWORD	2;"SUD"	; "JUG"
	macWORD	3;"E"	; "V"
	macWORD	3;"EST"	; "VZHO"
	macWORD	4;"O"	; "Z"
	macWORD	4;"OUES"	; "ZAHO"
	macWORD	5;"NE"	; "SV"
	macWORD	6;"NO"	; "SZ"
	macWORD	7;"SE"	; "JV"
	macWORD	8;"SO"	; "JZ"
	macWORD	9;"H"	; "G"
	macWORD	9;"HAUT"	; "GOR"
	macWORD	10;"B"	; "D"
	macWORD	10;"BAS"	; "DOL"
	macWORD	11;"ENTR"	; "NOTE"
	macWORD	12;"SORT"	; "VEN"
	macWORD	12;"SORS"	; sortir, sors
	macWORD	16;"TV"	; "TV" 
	macWORD	16;"TELE"	; "TELE"
	macWORD	17;"VERI"	; "CEKE"
	macWORD	18;"PREN"	; "VZEM"
	macWORD	18;"VOLE"	; "UGRA"
*	macWORD	18;"	; "ODPE"
*	macWORD	18;"PICK"	; "POBE"
*	macWORD	18;"TEAR"	; "ODTR"
*	macWORD	18;"	; "TRGA"
*	macWORD	18;"	; "UTRG"
	macWORD	19;"BOUG"	; "SVEC"
	macWORD	20;"POT"	; "LONE"
	macWORD	21;"COLL"	; "KOLE"
	macWORD	22;"CASS"	; "KASE"
	macWORD	23;"CAFE"	; "KAVO"
	macWORD	24;"FARI"	; "MOKO"
*	macWORD	24;"BUCK"	; "AJDO"
*	macWORD	25;"	; "PRST"	 - NOT SURE I THINK IT SI NOT USED
	macWORD	26;"DAPH"	; "VOLC"
	macWORD	26;"FLEU"	; "ROZO"
	macWORD	27;"GANT"	; "ROKA"
	macWORD	28;"HR"	; "HR" 
	macWORD	28;"CLAV"	; "TAST"
	macWORD	28;"ORDI"	; "RACU"
	macWORD	29;"LIVR"	; "KNJI"
	macWORD	30;"TONN"	; "SOD"
	macWORD	31;"BOIS"	; "LES"
	macWORD	31;"PLAN"	; "DESK"planche
	macWORD	31;"CHEN"	; "HRAS"
	macWORD	32;"BEIG"	; "KROF"
	macWORD	33;"MARK"	; "MARK"
	macWORD	34;"ARMU"	; "OKLE"
	macWORD	35;"ASPI"	; "SESA"
	macWORD	36;"FLUT"	; "PISC"
	macWORD	37;"EDEL"	; "PLAN"
	macWORD	38;"EQUI"	; "OPRE" equipement d'alpinisme
	macWORD	39;"PIST"	; "PUSK"
	macWORD	40;"PORN"	; "PORN"
	macWORD	41;"VIBR"	; "VIBR"
	macWORD	41;"JOYS"	; "JOYS"
	macWORD	42;"CRAV"	; "KRAV"
	macWORD	43;"SPEC"	; "SPEC"
	macWORD	44;"EPEE"	; "MEC"
	macWORD	45;"COUC"	; "PLEN"
	macWORD	46;"ALLU"	; "VZIG"
	macWORD	47;"LAMP"	; "BATE"
	macWORD	47;"TORC"	; lampe torche
	macWORD	48;"HG"	; "HG" 
*	macWORD	48;"	; "ZIVO"
	macWORD	48;"MERC"	; "SREB"
	macWORD	49;"RHUM"	; "RUM"
	macWORD	50;"BATE"	; "COLN"
	macWORD	51;"SAUT"	; "HMEL"
*	macWORD	52;"	; "PIR"
	macWORD	52;"BIER"	; "PIVO"
	macWORD	53;"PASS"	; "POTN"
*	macWORD	53;"	; "LIST"
	macWORD	54;"ROBE"	; "OBLE"
	macWORD	54;"PASS"	; passer une robe
*	macWORD	54;"	; "OBUJ"
*	macWORD	54;"	; "PRIP"
	macWORD	55;"DESH"	; "SLEC"d"FB"shabiller
*	macWORD	55;"	; "ODPN"
*	macWORD	56;"ALLE"	; "GO" 
*	macWORD	56;"VA"	; "GO"
*	macWORD	56;"MANG"	; "EAT"
*	macWORD	56;"UTIL"	; "USE"
*	macWORD	56;"PREN"	; "TAKE"
*	macWORD	56;"LAIS"	; "DROP"
*	macWORD	56;"REGA"	; "LOOK"
*	macWORD	56;"PORT"	; "WEAR"
	macWORD	57;"ENCU"	; "FUK"
	macWORD	57;"CHAT"	; "PIZD"
	macWORD	57;"BITE"	; "KURA"
*	macWORD	57;"	; "JEBI"
	macWORD	57;"SALO"	; "KURB"
*	macWORD	57;"	; "PICK"
*	macWORD	57;"	; "KURC"
	macWORD	59;"ALLU"	; "PRIZ"allumer
	macWORD	60;"DONN"	; "DAJ"
	macWORD	60;"LACH"	; "SPUS"
*	macWORD	60;"	; "ODLO"
	macWORD	61;"REGA"	; "OPIS"
	macWORD	61;"R"	; regarder
	macWORD	62;"TOUR"	; "UGAS"
	macWORD	63;"ATTE"	; "POCA"
*	macWORD	63;"	; "CAKA"
	macWORD	64;"PERS"	; "OSEB"
	macWORD	64;"VERO"	; "VERO"
*	macWORD	65;"	; "LOC"
	macWORD	66;"DORM"	; "SPI"
	macWORD	66;"DORS"	; dormir
	macWORD	66;"ENCU"	; "POFU"
*	macWORD	66;"	; "PODR"
	macWORD	67;"NON"	; "NE" 
	macWORD	68;"HOCU"	; "CIRA"
	macWORD	69;"POCU"	; "CARA"
	macWORD	70;"ROUG"	; "RED"
*	macWORD	70;"	; "VRST"
	macWORD	71;"MATE"	; "MATE"
	macWORD	72;"BADG"	; "ZNAC"
	macWORD	74;"REMP"	; "DEKL"
	macWORD	75;"ASSO"	; "SEDI"
	macWORD	76;"VEND"	; "PROD"
	macWORD	77;"DINA"	; "DINA"
	macWORD	78;"TRES"	; "ZAKL"
	macWORD	79;"ECHA"	; "MENJ"
*	macWORD	79;"	; "ZAME"
	macWORD	80;"CREU"	; "ZAKO"
	macWORD	81;"BOUC"	; "ODKO"
	macWORD	82;"PELL"	; "LOPA"
	macWORD	83;"MASQ"	; "MASK"
	macWORD	84;"PRES"	; "PRIT"
	macWORD	86;"STEP"	; "KORA"
	macWORD	87;"POUP"	; "DOLA"
	macWORD	104;"I"	; "I"  
	macWORD	104;"INVE"	; "INVE"
	macWORD	106;"QUIT"	; "QUIT"
	macWORD	106;"ARRE"	; "STOP"
	macWORD	106;"FIN"	; "KONE"
	macWORD	107;"SAVE"	; "SAVE"
	macWORD	108;"LOAD"	; "LOAD"
	macWORD	150;"ACHE"	; "KUPI"
	macWORD	151;"BOGO"	; "BOGO"
	macWORD	152;"PHOT"	; "SLIK"
	macWORD	153;"BOIR"	; "PIJ"
	macWORD	153;"BOIS"	; BOIRE
*	macWORD	153;"	; "POPI"
	macWORD	154;"MANG"	; "JEJ"
	macWORD	155;"VALI"	; "VELJ"
	macWORD	156;"AIDE"	; "POMA"
*	macWORD	156;"	; "SVET"              - NOT SURE I THINK IT SI NOT USED
	macWORD	157;"CACH"	; "SKRI"
	macWORD	158;"ATTA"	; "ATTA"
	macWORD	159;"SCOR"	; "REZU"
*	macWORD	160;"	; "MATJ"              - NOT SURE I THINK IT SI NOT USED
	macWORD	161;"MAGI"	; "CARO"
	macWORD	162;"CHAR"	; "OGLJ"
	macWORD	162;"SAC"	; "VREC"
	macWORD	163;"CASE"	; "CASE"	; ** new ** upper/lower case
	macWORD	164;"HOME"	; "HOME"	; ** new ** top of screen on new location
	macWORD	165;"DEBU"	; "DEBU"	; ** new ** debug on/off
	macWORD	166;"ACCE"	; "SUMN"	; ** new ** accents on/off (SUMNIKI)
	macWORD	255;"_"	; "_"

