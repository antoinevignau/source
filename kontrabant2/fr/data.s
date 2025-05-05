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
strRIGHTP	asc	") ? "00
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
	asc	"Version Apple II"8D8D
	dfb	7
	asc	"(c) 2025, Janez J. Starc &"8D
	dfb	9
	asc	"Brutal Deluxe Software"00
	
tblLOCATIONS
	asc	"Tu es le seul lettr"FB" de ton pays, les autres voudraient clairement la meme chose. Les sauver de l'age de pierre, ce qui est un grand d"FB"sir."
	ASC	"Ce travail te tente, h"FB"ros. N'attends pas, n'h"FB"site pas, d"FB"peche-toi, sans toi, nous serons bientot tous dans..."8D00
	asc	"Tu es seul dans la maison, tu tiens l'arc-en-ciel dans tes mains."00
	asc	"Tu es "C0" un carrefour rocailleux, o"FC" la CONTREBANDE rythme la vie."00
	asc	"Les forets sombres sont froides et lugubres."00
	asc	"Obtenir de l'ambre est difficile. Tout le monde se demande comment."00
	asc	"Sois pers"FB"v"FB"rant et va vers le nord, r"FB"p"FD"te cette manoeuvre difficile cent fois. Le passage est ouvert entre 13h30 et 14h15."00
	asc	"Le marais est humide, il est important de s'"FB"chapper."00
	asc	"Les moustiques te piquent, ils te poussent "C0" bout, c'est tr"FD"s douloureux, COURS, tu n'as pas de chance ici."00
	asc	"Des gens "FB"tranges vivent ici, ils construisent des huttes au bord de la rivi"FD"re."00
	asc	"Tu es dans une grotte froide et humide, tu as froid, mais tu ne vas pas disparaitre. Il y a des tailleurs ici qui savent coudre et qui vous donnent des aiguilles pour un mot gentil."00
	asc	"Le Nord et l'Est r"FB"soudront votre probl"FD"me."00
	asc	"Vous regardez et demandez : "A2"C'est quoi cette "FB"chasse ?"A2" Jalen vous dit : "A2"Vous ne voyez pas, un pont !"A200
	asc	"C'est une drole de bete, ce Yugosaurus, bientot il n'en restera plus que le cadavre."00
	asc	"Un "FB"norme mammouth fonce sur vous, "C0" l'est et "C0" l'ouest, il vous bloque le chemin. Agissez vite pour vous sauver, sinon, il ne vous reste que la pri"FD"re."00
	asc	"Il y a des routes dans la foret, du gel, des animaux dangereux vivent ici."00
	asc	"Vous pouvez voir "C0" travers les feuilles du buisson que quelqu'un vous observe au loin."00
	asc	"Une ville se trouve au bord de la Save et du Danube, la m"FB"t"FB"o est silencieuse."00
	asc	"Vous etes au milieu d'une foret sombre, oh comme le loup hurle au loin."00
	asc	"Andersen a envoy"FB" une fille ici, au nord, puis il l'a conseill"FB"e sur son chemin. "A2"Allumettes, apportez le paquet rapidement, des nouvelles seront le d"FB"but pour vous."A200
	asc	"Forrreeet..."00
	asc	"Vous pouvez trouver des vetements chauds ici, mais ils n'ont rien pour les coudre."00
	asc	"Parr ... Ils ont des contours de situles derri"FD"re un fin voile "FB"crit MEJDINHONGKONG dessus."00
	asc	"Vous etes dans une nouvelle usine du village, ils l'appellent SITULARNA."00
	asc	"Les forets sont denses, mais dangereuses, et les cr"FB"atures qui y vivent sont effrayantes et insouciantes."00
	asc	"Les sentiers sont bien battus, les vieux arbres, pourquoi etes-vous vraiment press"FB" d'aller au paradis ?"00
	asc	"Chaque animal se m"FB"fie de sa proie, prends garde, voyageur, que ce ne soit pas toi."00
	asc	"Tout ce que tu vois, ce sont les cimes des arbres, elles bloquent joliment ton chemin vers le paradis."00
	asc	"Ils ont toujours de la poix (r"FB"sine) "C0" SPARK, et ils savent comment l'envelopper pour toi."00
	asc	"La colline s'"FB"l"FD"ve haut au-dessus de la vall"FB"e, respire profond"FB"ment l'air pur."00
	asc	"Il y a un grand trou dans la roche, il te donne clairement envie d'y grimper. L'entr"FB"e est rarement gratuite, l'ours des cavernes y est un hote permanent."00
	asc	"Des marchands d'argent vivent ici, ils sont impatients de vous acheter des tr"FB"sors. Ne d"FB"truisez jamais leurs espoirs, mais faites-les bien s"FB"cher chez l'acheteur."00
	asc	"Un jour, il y aura une belle auberge ici, la boisson sera bonne, la nourriture abondante. Un "FB"crivain moustachu vivra ici, nous devrons "FB"crire des livres sur lui."00
	asc	"Ici, dans la foret, il y a un village, il y a de l'argent et de la joie. Les habitants y vivent, ils se pr"FB"cipitent pour vous vendre des hame"DC"ons."00
	asc	"Prot"FB"e, le poisson humain, vit dans cette grotte. Il ressemble "C0" un humain, mais ce n'en est pas un."00
	asc	"Cet endroit est dangereux "C0" cause des betes qui aiment manger les humains. (il y a des chemins vers l'E, l'O et le S)"00
	asc	"Les pauvres mis"FB"rables vivent sur la pente, chacun re"DC"oit trois pierres par semaine."00
	asc	"Jason t'attend au bord du lac, le temps le torture, les nuits sont comme des moutons. De l'autre cot"FB" se trouve un v"FB"ritable paradis. Donnez-lui de quoi r"FB"parer le bateau."00
	asc	"Rome est une ville magnifique pour toujours, chacun peut y trouver de tout, mais ce fou de N"FB"ron est s"FB"rieux, il va la bruler au cr"FB"puscule."00
	asc	"Vous etes sur la voie romaine, ce qui est "FB"crit en majuscules, il y aura des rochers, de l"C0", jusqu'"C0" ce jour."00
	asc	"Vous etes seul sur la route, "DC"a vous fait mal, vous regardez et regardez, "DC"a vous m"FD"ne vers l'inconnu."00
	asc	"Ce pont m"FD"ne au pays slave, le passage vers le sud n'est pas libre pour tout le monde."00
	asc	"Les miroirs au plafond et sur les murs sont rouges, n'importe quel homme ici deviendrait fou."00
	asc	"Vous vous tenez devant le mur d'Emona, vous avez clairement peur d'y entrer."00
	asc	"Ils craignent Attila le Hun ici, ils veulent sa tete sur un plateau."00
	asc	"Vous vous tenez dans la ville romaine, vous savourez la vie."00
	asc	"Ir"FD"ne est allong"FB"e sous le soleil, elle lui brule le dos, elle en a tellement mal. Si elle manque de cr"FD"me, elle va commencer "C0" frire."00
	asc	"Tu es arriv"FB" dans une ville riche, fi"FD"re de ses statues d'or. Avant de prendre la route, mets-y soigneusement ton nez."00
	asc	"Tu es sur la place Emona, il y a de la terre froide ici. Si tu tiens une pelle "C0" la main, enterre quelque chose."00
	asc	"Tu es "C0" l'aqueduc romain, on peut y puiser de l'eau, mais comme elle va enti"FD"rement aux villes, tu ne peux pas la boire."00
	asc	"La brise arrive, le soleil se couche, un nouvel amour nait en toi."00
	asc	"A Split, il y a des artistes c"FB"l"FD"bres qui jouent jour et nuit, les instruments manquent, l'empereur les cherche en vain."00
	asc	"Pula est une ville portuaire qui poss"FD"de sa propre ar"FD"ne. Entre et trouve le bonheur, si tu veux seulement concourir."00
	asc	"Dans le L'ar"FD"ne est magnifique, vous vous tenez au milieu de la piste, les concurrents sont uniques, vous en avez tr"FD"s peur."00
	asc	"La foret est laide et n"FB"glig"FB"e, cela attire votre regard, tout ce qui tombe des arbres tombe, il y reste pour toujours."00
	asc	"Ici, le puant sans mani"FD"res est M"FB"phisto, le berger diabolique."00
	asc	"Les fermiers ici sont tous ivres, les vignes leur donnent de bons fruits, si vous voulez du vin, offrez-leur des outils."00
	asc	"Au loin, une ville sale, une fum"FB"e noire s'"FB"chappe. La peste est un fl"FB"au dangereux, elle tue avec sa faux tout autour."00
	asc	"La ville est sale, un vrai cimeti"FD"re, ici vous arrivez au cimeti"FD"re quelque part. On y trouve beaucoup de choses terribles, les sorci"FD"res invitent et enchantent."00
	asc	"Pierre sur pierre, un cimeti"FD"re, la mort se trouve ici, pour qui la cherche."00
	asc	"Comme une poule sur des oeufs, un chateau blanc se dresse ici. Le vin a soif des maitres de chai."00
	asc	"L'a"FB"roport est grand, car tout sur la colline est bruyant. La circulation est bruyante, tout le monde regarde."00
	asc	"Le pont sur l'eau est en construction, tu veux absolument aller vers l'est, tu n'as aucun moyen de continuer ici, si tu n'obtiens pas l'argent du p"FB"age."00
	asc	"La route est blanche, large, elle te m"FD"ne droit au sud. Cela te donne de nouveaux pouvoirs, mets-toi au travail maintenant, HORUK !"00
	asc	"Tu es entr"FB" en force dans l'"FB"curie, chaque cheval ici vaut un point. Mais pour obtenir l'animal, voici ce qu'Artur a dit que vous deviez faire."00
	asc	"Dusan est un roi riche et l"FB"gendaire, il ach"FD"te et vend des chevaux en masse."00
	asc	"Le tsar Lazar est mort et dort, seule ELLE peut le r"FB"veiller."00
	asc	"Le manoir du sultan est neuf et moderne, il a besoin d'une femme pour qu'il soit plus confortable."00
	asc	"Dans la brigade, Marko conduit Karioilla, "C0" bord de laquelle se trouve la f"FB"e Ravioila."00
	asc	"Buissons bas, herbe verte, il n'y a pas de femme plus belle que celle-ci, (aucune "FB"valuation n'"FB"tait plus d"FB"sirable...)"00
	asc	"La route serpente au loin, l"C0"-haut sur la colline se dresse un chateau. L"C0"-haut, quelqu'un crie, un petit pois dont tout le monde a peur."00
	asc	"Le grand m"FB"chant loup vit ici. Il s'appelle Vucko, c'est une ville olympique, o"FC" le commerce est autoris"FB"."00
	asc	"L'imp"FB"ratrice Milica, m"FB"chante et belle, bijoux difficiles "C0" trouver, pas beaux."00
	asc	"Les cachots de ce terrible chateau sont sombres. On y vit dans l'humidit"FB" et le froid."00
	asc	"Dans les contes de f"FB"es, les miracles se produisent toujours, mais ce ne sont que des h"FB"ros qui vivent ici."00
	asc	"Mehmed Sokolovic est l"C0", ton voeu se r"FB"alisera."00
	asc	"Sur la plaine du Kosovo, une rivi"FD"re serpente. "A2"BIREKU EST ET PAIX"A2", vous crie l'habitant."00
	asc	"Ici se trouvent de grandes forets, o"FC" les loups hurlent."00
	asc	"Karadzic s'"FB"crit Vuk, il "FB"crit, il travaille sans douleur."00
	asc	"..."A2"Chaque arme sera mortelle, entre les mains de Mandusic Vuk"A2"..."00
	asc	"La Serbie n'est pas tr"FD"s grande et elle attire ses voisins. Tout le monde la d"FB"sire de tout son coeur, mais a peur d'attaquer."00
	asc	"Le sultan Murat est tr"FD"s riche, sa cour est vraiment luxueuse."00
	asc	"Un lac clair, profond "C0" ses pieds, tu reposes. Les perles y sont magnifiques, je les voudrais maintenant."00
	asc	"A la pharmacie de Dubrovnik, on peut trouver des pilules contre des perles."00
	asc	"La mer est humide et sal"FB"e, car nous aimons manger sal"FB", ils la volent ouvertement."00
	asc	"Cette vall"FB"e est pleine de roses. Le c"FB"l"FD"bre Bleiweis vit ici. Il adore les abeilles carnioliennes, il aime et cultive les tilleuls."00
	asc	"Ljubljana est une ville blanche et moderne, mais dans la nouvelle partie, elle est sombre."00
	asc	"Les Carnioliennes ont toujours "FB"t"FB" belles et c"FB"l"FD"bres, mais aucune n'"FB"tait plus belle que la montagne. Aucune n'"FB"tait plus d"FB"sirable pour mes p"FD"res. "
	ASC	"A l'"FB"poque du ski, on ne l'escaladait pas."00
	asc	"Le mont Triglav est immense, les capricornes pullulent, on est tent"FB" de l'escalader, c'est ce que tout Slov"FD"ne d"FB"sire."00
	asc	"La route vous m"FD"ne "C0" Vienne, d"FB"pechez-vous d'aller vous amuser."00
	asc	"Tout le monde veut jouer au Prater, il y a de bonnes salles de jeux. On joue d'abord "C0" Contraband, puis "C0" "A2", et au deuxi"FD"me, "A2", dont ils ignorent malheureusement encore l'existence."00
	asc	"Marija, l'assistante, aime aussi vous aider."00
	asc	"Jozef vit dans une belle maison de maitre, Franz a tr"FD"s mal au ventre."00
	asc	"Il y avait un tilleul ici, aujourd'hui il a disparu. Tu as un robinet pour la propret"FB", s'il ne fonctionne pas, "DC"a pue."00
	asc	"Maintenant, tu approches de la fin, la r"FB"compense te sourit, utilise toutes tes connaissances, d"FB"sol"FB", il n'y a pas de retour en arri"FD"re."00
	asc	"Tu es "C0" Ljubljana, la ville blanche, tu as laiss"FB" quelque chose ici, si tu as bien jou"FB", il git sous tes pieds."00
	asc	"Il y a un pi"FB"destal vide ici, rien ne se tient dessus. Paye juste tes impots avec soin, mets quelque chose l"C0"-haut."00
	asc	"Le monstre Planetarium se tient devant toi, il menace de te tuer, il a la forme d'un paragraphe, surmonte-le, tue-le."00
	asc	"La pi"FD"ce est d"FB"serte et vide, le chemin te m"FD"ne "C0" l'ouest. Les surprises sont folles et les dangers sont partout."00
	asc	"Tu as presque r"FB"ussi "C0" atteindre la derni"FD"re ann"FB"e maintenant. R"FB"fl"FB"chis-y bien, donne une r"FB"ponse intelligente."00
	asc	"Tu as termin"FB" le jeu avec succ"FD"s, eh bien, tu es vraiment l"C0", "C0" la fin. FELICITATIONS AVENTURIER !"00	; Sauvegarde l'image sur une cassette, donne-la vite au facteur."00
	asc	"Tu te trouves maintenant sur une ile d"FB"serte, dans une mer calme, parce que tu as mal parl"FB", tu n'auras pas d'autre chance."00
	asc	""00

*------------------------------
* MESSAGES
*------------------------------

tblMESSAGES
	asc	"Vetu d'une toison recouverte de poix (r"FB"sine), tu n'auras aucun avenir."00
	asc	"Jason a accept"FB" la poix (r"FB"sine) avec gratitude, il a r"FB"par"FB" le navire et t'a emmen"FB" avec lui."00
	asc	"La poix (r"FB"sine) n'est pas propre, elle met Jason en col"FD"re, il n'en veut pas."00
	asc	"Elle s'est envol"FB"e en d"FB"crivant un arc magnifique et a frapp"FB" le mammouth en plein coeur."00
	asc	"Tu as lanc"FB" le transformateur tr"FD"s fort, il s'est envol"FB" tr"FD"s loin, tu ne le r"FB"cup"FB"reras pas."00
	asc	"L'ours s'empare s"FB"rieusement de ton miel, s'"FB"loigne et t'oublie."00
	asc	"L'ours reste souvent assis devant la grotte, ne laisse entrer personne gratuitement."00
	asc	"Le feu brul"FB" a chass"FB" les abeilles, le miel de la ruche est maintenant "C0" toi."00
	asc	"Le vent est fort, le feu brule, souffle une fois - la flamme s'est "FB"teinte."00
	asc	"La bete est stupide, elle ne sait pas Ce qu'il fait, c'est qu'il a pris Prot"FB"e."00
	asc	"R"FB"solvez l'"FB"nigme, puis bougez. Si vous voulez vivre, partez vite."00
	asc	"D"FB"pechez-vous et faites quelque chose rapidement, si cela n'arrive pas, mon ami, il vous poursuivra bientot !"00
	asc	"Il est tr"FD"s facile de mourir ici, attendez un peu et vous serez parti."00
	asc	"La flamme vive s'enflamme imm"FB"diatement, brule un peu, puis s'"FB"teint."00
	asc	"Vous ne pouvez pas le tuer facilement, il reste peu de temps, mais vous etes en danger."00
	asc	"La bete est tr"FD"s dangereuse, il est difficile de la d"FB"jouer."00
	asc	"Ne tuez pas le Yugosaurus, c'est un animal tr"FD"s rare, si je vous faisais "DC"a maintenant, vous le regretteriez vite."00
	asc	"Les abeilles ont vu le danger et se sont rapidement envol"FB"es."00
	asc	"Salut, imb"FB"cile, je suis le Jeu, j'ob"FB"is. Toi, je ris aux "FB"clats. Tu fais des erreurs stupides, des grosses, tu tombes dans le panneau des vieux et des nouveaux. "
	ASC	"Si tu continues comme "DC"a, tu ne finiras jamais la partie."00
	asc	"Si tu as l'habitude de parler comme "DC"a "C0" la maison, tu sais quoi, petit bonhomme, on ne s'amuse pas avec moi ici."00
	asc	"La glace est froide et massive, c'est dur de la faire fondre, mais tu sais que tu n'y arriveras pas sans une astuce."00
	asc	"Je pensais que je devrais me cacher ; devrais-je le tuer avec une pelle ?!?"00
	asc	"Aussi mesquin qu'une mouche, tu le veux "C0" tout prix, mais parce que tu insistes vraiment pour etre mesquin - boum ! et Attila est parti."00
	asc	"Tu t'es barbouill"FB" et tu es tr"FD"s joli, ce sera tr"FD"s difficile d'en trouver un nouveau."00
	asc	"Ca lui brule le dos au point de g"FB"mir et de pleurer, elle ne veut pas que tu la barbouille, elle ne le veut pas."00
	asc	"Ir"FD"ne appr"FB"cie, soupire bruyamment, Iztok, son amant l'entendra bientot. Il comprend imm"FB"diatement ce qui "
	ASC	"se cache derri"FD"re, il d"FB"gaine son "FB"p"FB"e et r"FB"sout le probl"FD"me."00
	asc	"Tu n'es pas un maitre, tes besoins sont grands, il te faut un miracle pour r"FB"soudre les diff"FB"rends. "00
	asc	"N"FB"ron prend les allumettes avec reconnaissance, oublie la harpe, et Rome est d"FB"j"C0" en feu."00
	asc	"Diocl"FB"tien est ravi de la harpe, et te donne une bague et une pierre polie."00
	asc	"Tu manies mal la harpe, tu en joues "C0" peine et puis la corde casse, c'est terrible, mais il est d"FB"j"C0" trop tard pour pleurer."00
	asc	"Bien monter "C0" cheval n'est pas ta vertu, car c'est une comp"FB"tence plus dure que le tonnerre. Le cheval se met soudain "C0" hennir, te fait tomber et "
	ASC	"te brise le cou."00
	asc	"Tu es retourn"FB" dans le nord, laisse-moi te dire : "A2"Revenir en arri"FD"re"A2" est impossible !"00
	asc	"La f"FB"e a saut"FB" sur le cheval, elle est partie avec toi."00
	asc	"Le cheval f"FB"erique descend maintenant de cheval, s'"FB"loigne un peu et te fait signe."00
	asc	"Tu as bien sauv"FB" la Kosovare, tu as de la chance de ne pas t'etre ridiculis"FB"."00
	asc	"La Kosovare ne laisse pas dormir le tsar, elle te jette par la porte ouverte."00
	asc	"Cette fille est vraiment vertueuse, elle ne te laissera pas l'embrasser, elle ferait tout ce que tu veux, l'"FB"tiquette ne me le permet pas."00
	asc	"Comment coucher avec elle, tu ne sais pas, de toute fa"DC"on tu ne devrais pas faire "DC"a."00
	asc	"Tu es un escroc, un imb"FB"cile, cent fois pire que Krpan."00
	asc	"Tu as tu"FB" Capricorne et obtenu la pierre miraculeuse."00
	asc	"A cause de gens comme toi, tout a disparu."00
	asc	"Franz est gu"FB"ri et r"FD"gne, car il est bienveillant envers toi, il te montre la voie "C0" suivre."00
	asc	"Tu as d"FB"terr"FB" la statue d'Emona. Elle est magnifique. Il n'y a vraiment rien ici. Le chemin te m"FD"ne vers l'ouest. Malheureusement, tu ne peux plus revenir en arri"FD"re."00
	asc	"La statue est magnifique, et les gens sont heureux, ils donnent cinq pour cent pour elle, encore une fois tu vas lentement vers l'ouest, il y en a de moins en moins jusqu'"C0" la fin."00
	asc	"Paragraphe : le monstre est mort, grand tu es devenu un h"FB"ros, les points que tu as accumul"FB"s jusqu'"C0" pr"FB"sent, tout le monde ne peut pas les avoir."00
	asc	"L'avalanche "FB"tait vraiment "FB"norme, et "C0" l'int"FB"rieur il y avait du froid, de la glace froide, il n'y a plus de solution pour toi maintenant, tu es gel"FB" depuis mille ans."00
	asc	"Le mammouth est venu vers toi, tu n'as pas pris ta d"FB"fense ; le r"FB"sultat est bref, clair : tu es maintenant effondr"FB"."00
	asc	"Elles sont tr"FD"s ac"FB"r"FB"es, les piqures sont douloureuses, les piqures de ces abeilles d"FB"mangent vraiment."00
	asc	"Pour te faire sortir de ce monde, la bete sanguinaire veut un humain."00
	asc	"Tu es venu "C0" la course avec un micro-moteur, ils ont agit"FB" le drapeau, la course a commenc"FB"..."00
	asc	"L'"FB"quipement est "C0" C'est ta faute d'etre dernier, mais c'est "C0" toi de te consoler avec le cri solaire."00
	asc	"On entend d"FB"j"C0" des pas, le brave Justi arrive, d"FB"peche-toi. Lache l'ambre et cours, peut-etre que celle-ci le retiendra."00
	asc	"Th"FB"odora n'est pas bon march"FB", tu as besoin d'ambre ici tout de suite. Elle sort le couteau de sous la couverture, le couteau est maintenant plant"FB" dans ta poitrine."00
	asc	"Marco va et vient avec toi, tu peux t'en r"FB"jouir si tu le gardes pr"FD"s de toi, tu seras bien aid"FB"e."00
	asc	"Tu "FB"tais presque au bout, un accident t'arrive, le pi"FD"ge des lois te d"FB"truit, tu es morte maintenant."00
	asc	"Spectrum chauffe beaucoup, l'avalanche a fondu."00
	asc	"ZX est maintenant allum"FB", il ronronne tr"FD"s doucement, il fume presque."00
	asc	"Tu aimerais me voir mourir, mais c'est exactement pour "DC"a que je ne r"FB"initialiserai pas."00
	asc	"Es-tu idiot ?"00
	asc	"A L'AIDE !"00
	asc	"Tu as apport"FB" "C0" Ir"FD"ne la cr"FD"me solaire qu'elle voulait, elle est si fi"FD"re de toi maintenant, elle t'a donn"FB" les sous-vetements magiques."00
	asc	"C'est difficile d'aller dans le sud maintenant, Sans une petite pierre pr"FB"cieuse, ce ne sera pas facile."00
	asc	"J'aurais travaill"FB" avec une seule femme, mais pas avec autant."00
	asc	"Puisque la f"FB"e ne veut pas marcher, essaie au moins d'avoir un cheval."00
	asc	"Le vin est doux, rouge."00
	asc	"RANDONNEE ?!"00
	asc	"Entr"FB"e interdite sans permission."00
	asc	""00
	asc	"La course n'est pas de saison, meme si tu es dans l'ar"FD"ne, tu ne peux pas gagner de toute fa"DC"on."00
	asc	"Je ne suis pas assez coriace pour vouloir ta mort."00
	asc	"Tu attaque Franz, il a peur, il appelle les gardes, tu es mort."00
	asc	"PUFF..."00
	asc	"La vieille astuce ne fonctionne pas, essaie quelque chose de nouveau."00
	asc	"Tu dois etre bien habill"FB"."00
	asc	"Les paysans ont bu le vin pour toi et t'ont donn"FB" une lettre en cadeau."00
	asc	"Le Le diable prend peur et s'enfuit, te laissant la fourche."00
	asc	"L'imp"FB"ratrice se sent douce pr"FD"s du tilleul, Gregor te permet de porter le sel."00
	asc	"L'"FB"diteur publie tes histoires, te donne un jeune arbre en remerciement."00
	asc	"Le Vuk se pr"FB"cipite pour "FB"crire, "FB"cris comme tu parles."00
	asc	"Cyril soigne Metod qui se r"FB"tablit et donne l'Alphabet en retour."00
	asc	"Metod a mal aux dents, Cyril est suspendu "C0" la lettre "A2"B"A2"."00
	asc	"Les paysans ont confisqu"FB" le vin, t'ont autoris"FB" "C0" voyager."00
	asc	"De bonnes histoires pour "A2"NOUVELLES"A2", "C0" Vienne valent mieux que des devises "FB"trang"FD"res."00
	asc	"Metod a mal aux dents, Cyril se tient "C0" la lettre "A2"B"A2"."00
	asc	"Tu es arriv"FB" trop tard, c'est terrible."00
	asc	"Le temps avance inlassablement."00
	asc	"L'avalanche est froide, la glace te retient au nord et au sud, elle ne te lachera pas."00
	asc	"Tu as regard"FB" le crane et os"FB" prendre l'"FB"p"FB"e."00
	asc	"La Milica a saisi les bijoux, elle a oubli"FB" le royaume."00

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
	macOBJ	36;"Toison d'or"
	macOBJ	O_NOTCRE;"Statue dor"FB"e d'Emona"
	macOBJ	60;"Ep"FB"e"
	macOBJ	83;"Sel"
	macOBJ	97;"Cl"FB" d'or de l'an 2000"
	macOBJ	O_NOTCRE;"Permis de transport de sel"
	macOBJ	84;"Tilleul"
	macOBJ	O_NOTCRE;"Livre"
	macOBJ	1;"Miroir"
	macOBJ	78;"Fusil"
	macOBJ	O_NOTCRE;"Cheval"
	macOBJ	O_NOTCRE;"Royaume"
	macOBJ	70;"Djerdan dor"FB
	macOBJ	66;"Pont"
	macOBJ	62;"Femmes"
	macOBJ	58;"Crane"
	macOBJ	O_NOTCRE;"Passeport pour la ville sale"
	macOBJ	55;"Vin"
	macOBJ	O_NOTCRE;"Fourche"
	macOBJ	53;"Baton"
	macOBJ	8;"Statue "FB"trange"
	macOBJ	6;"Grenouille"
	macOBJ	32;"Crochets"
	macOBJ	30;"Pi"FD"ce illyrienne"
	macOBJ	18;"Allumettes"
	macOBJ	O_NOTCRE;""
	macOBJ	O_NOTCRE;"Harpe"
	macOBJ	O_NOTCRE;""
	macOBJ	27;"R"FB"sine"
	macOBJ	21;"Situle"
	macOBJ	O_NOTCRE;"Vetements"
	macOBJ	9;"Aiguille en os"
	macOBJ	O_CARRIED;"Transformateur pour Spectrum"
	macOBJ	O_NOTCRE;"Miel"
	macOBJ	24;"Bois"
	macOBJ	4;"Ambre"
	macOBJ	O_CARRIED;"Microdrive"
	macOBJ	O_NOTCRE;"Cr"FD"me solaire"
	macOBJ	O_NOTCRE;"Porte magique d'Iztok"
	macOBJ	16;"pr"FB"Visions m"FB"t"FB"o"
	macOBJ	O_NOTCRE;"Toison goudronn"FB"e"
	macOBJ	O_NOTCRE;"Goudron dans une situle"
	macOBJ	14;"Avalanche de glace"
	macOBJ	13;"Mammouth mal"FB"fique"
	macOBJ	29;"Ours dangereux"
	macOBJ	34;"Bete s"FB"rieuse"
	macOBJ	33;"Prot"FB"e"
	macOBJ	O_NOTCRE;"Spectre "FB"tincelant"
	macOBJ	28;"Abeilles"
	macOBJ	12;"Yugosaurus"
	macOBJ	44;"Pelle"
	macOBJ	39;"Attila "C0" la chasse"
	macOBJ	O_NOTCRE;"Tete d'Attila"
	macOBJ	45;"Belle Ir"FD"ne"
	macOBJ	41;"S"FB"duisante T"FB"odora"
	macOBJ	O_NOTCRE;"Harpe"
	macOBJ	50;"Bague"
	macOBJ	74;"Faucon"
	macOBJ	38;"Pi"FD"ce romaine"
	macOBJ	O_NOTCRE;"Royaume"
	macOBJ	73;"F"FD"e Raviola"
	macOBJ	O_NOTCRE;"Manoir hippomobile"
	macOBJ	O_NOTCRE;"Reine Marka"
	macOBJ	72;"Femme du Kosovo"
	macOBJ	O_NOTCRE;"Alphabet"
	macOBJ	82;"M"FB"dicaments"
	macOBJ	81;"Perle"
	macOBJ	O_NOTCRE;"Pierre de gu"FB"rison"
	macOBJ	80;"Caf"FB" "A2"Minas"A2
	macOBJ	79;"Sac de haricots"
	macOBJ	91;"Franz Jozef"
	macOBJ	O_NOTCRE;"Sel sur la tete"
	macOBJ	20;"Peau de daim"
	macOBJ	41;"Sceau"
	macOBJ	90;"Raccord"8D
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
	macRUL	CMD_ACTI; $1179;  3237	; ATTRAPER GRENOUILLE
	macRUL	CMD_ACTI; $7C7B;  3245
	macRUL	CMD_ACTI; $0080;  3256	; ** new ** CASE
	macRUL	CMD_ACTI; $0081;  3258	; ** new ** HOME
	macRUL	CMD_ACTI; $0082;  3260	; ** new ** DEBU(G)
	macRUL	CMD_ACTI; $002B;  3264	; ** new ** SCORE
	macRUL	CMD_ACTI; $0083;  3266	; ** new ** ACCENT
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
	db	FN_TRANSLATE,FN_EOF	; ** new ** ACCE(NTS) (size = 2)

*------------------------------
* SYS_MESSAGES
*------------------------------

tblSYSMESSAGES
	asc 	8D"Il fait sombre."00
	asc 	8D"Je vois aussi :"00
	asc 	8D"Votre commande, o maitre !"00
	asc 	8D"Que dois-je faire ?"00
	asc 	8D"D"FB"pechez-vous avec votre commande."00
	asc 	8D"Comment proc"FB"der ?"00
	asc 	8D"Je ne suis pas programm"FB" pour "DC"a."00
	asc 	8D"Je ne peux pas aller par la."00
	asc 	8D"Meme Iskra Delta Triglav ne pourrait pas faire "DC"a."00
	asc 	8D"Je porte "00
	asc 	" (port"FB")"00
	asc 	" rien. "00	; Porter + rien.
	asc 	8D"Veux-tu vraiment abandonner ? "00
	asc 	8D"Peut-etre devrais-tu retenter ta chance ? "00
	asc 	8D"Lache !"00
	asc 	8D"OK."00
	asc 	8D"Appuie sur une touche pour continuer. "00
	asc 	8D"Nombre de pas : "00	; ** nouveau ** Simplifier la gestion du pluriel (c) Janez
** asc 8D"Tu as donne "00
	asc 	"ordre"00
	asc 	"ov"00 ; pluriel
	asc 	". "00
	asc 	8D"Ton score est "00
	asc 	"%"00
	asc 	8D"Je ne peux meme pas porter "DC"a."00
	asc 	8D"J'ai les mains pleines."00
	asc 	8D"Je l'ai d"FB"j"C0" !"00
	asc 	8D"Je ne vois pas "DC"a ici."00
	asc 	8D"C'est trop lourd !"00
	asc 	8D"Je n'ai pas "DC"a dans les mains."00
	asc 	8D"Je l'ai d"FB"j"C0" sur moi !"00
	asc 	"O"00
	asc 	"N"00
	asc 	8D"Les chemins m"FD"nent "C0" : "00
	asc 	8D"Je ne vois aucun chemin."00
	asc 	8D"Charger la partie (emplacements 1-9) ? "00	; ** nouveau ** charger la partie (emplacements 1 "C0" 9) ?
	asc 	8D"Sauvegarder la partie (emplacements 1-9) ? "00	; **Ênouveau** sauvegarde (emplacements 1-9)Ê?

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
	macWORD	1;"N"	; "N"
	macWORD	1;"NORD"	; "NORT"
	macWORD	2;"S"	; "S"
	macWORD	2;"SUD"	; "SOUT"
	macWORD	3;"E"	; "E"
	macWORD	3;"EST"	; "EAST"
	macWORD	4;"O"	; "W"
	macWORD	4;"OUES"	; "WEST"
	macWORD	5;"NE"	; "SV"
	macWORD	6;"NO"	; "SZ"
	macWORD	7;"SE"	; "JV"
	macWORD	8;"SO"	; "JZ"
	macWORD	9;;"H"	; "U"
	macWORD	9;;"HAUT"	; "UP"
	macWORD	10;"B"	; "D"
	macWORD	10;"BAS"	; "DOWN"
	macWORD	11;"SORT"	; "VEN"
*	macWORD	11;"	; "IZST"
	macWORD	12;"ENTR"	; "NOT"
*	macWORD	12;"	; "NOTE"
*	macWORD	12;"	; "VSTO"
*	macWORD	13;"G"	; "L"
	macWORD	13;"GAUC"	; "LEVO"
	macWORD	13;"DROI"	; "DESN"
	macWORD	14;"STAT"	; "KIP" 
*	macWORD	14;"	; "KIPE"
	macWORD	15;"PIEC"	; "KOVA"
	macWORD	15;"ARGE"	; "DENA"
	macWORD	16;"CROC"	; "TRNK"
	macWORD	17;"GREN"	; "REGO"
*	macWORD	17;"	; "ZABO"
	macWORD	18;"METE"	; "NAPO"
	macWORD	18;"PREV"	; "VREM"
	macWORD	19;"TOIS"	; "RUNO"	; TOISON D'OR
	macWORD	20;"COUS"	; "IGLO"
	macWORD	20;"COUD"	; "SIVA"
	macWORD	20;"AIGU"	; **new** AIGUILLE
	macWORD	21;"JUPE"	; "OBLE"	; DRESS
	macWORD	21;"ROBE"	; "NATA"
	macWORD	21;"VETE"	; **new** VETEMENTS
	macWORD	21;"METS"	; **new** METS/METTRE ANNEAU
	macWORD	21;"METT"	; **new**
	macWORD	22;"SITU"	; "SITU"
	macWORD	22;"SEAU"	; "POSO"
	macWORD	23;"RESI"	; "SMOL"
*	macWORD	23;"	; "ZASM"
	macWORD	24;"DONN"	; "DAJ" 
	macWORD	24;"JETE"	; "VRZI"
	macWORD	24;"JETT"	; "VRZI"
	macWORD	24;"LACH"	; "SPUS"
*	macWORD	24;"	; "ODLO"
	macWORD	25;"DEMA"	; "PRIZ"	; DEMARRER UN ORDINATEUR
*	macWORD	25;"	; "VKLJ"
	macWORD	26;"ZX"	; "ZX"
	macWORD	26;"SPEC"	; "SPEC"
	macWORD	26;"SINC"	; "SINC"
	macWORD	26;"ORDI"	; "RACU"
	macWORD	27;"TRAN"	; "TRAF"
*	macWORD	27;"	; "TRAN"
	macWORD	28;"MIEL"	; "MED" 
	macWORD	29;"FEU"	; "OGEN"
	macWORD	30;"PROT"	; "PROT"
*	macWORD	30;"	; "CLOV"
	macWORD	31;"ETEI"	; "UGAS"
*	macWORD	31;"	; "IZKL"
	macWORD	32;"PREN"	; "VZEM"	; TAKE
*	macWORD	32;"ATTR"	; "POBE"	; doublon avec ATTRAPER plus bas
	macWORD	32;"VOLE"	; "UKRA"
	macWORD	33;"ALLU"	; "VZIG"	; ALLUMETTES
*	macWORD	33;"	; "SIBI"
	macWORD	34;"AMBR"	; "JANT"	; AMBER
	macWORD	35;"MCD"	; "MCD" 
	macWORD	35;"MICR"	; "MICR"
	macWORD	35;"LECT"	; "MIKR"
	macWORD	36;"TUER"	; "UBIJ"
	macWORD	36;"ATTA"	; "NAPA"
	macWORD	37;"MAMM"	; "MAMU"
	macWORD	38;"ABEI"	; "CEBE"
	macWORD	39;"BETE"	; "ZVER"
	macWORD	40;"YUGO"	; "JUGO"
	macWORD	41;"I"	; "I"	; INVENTORY
	macWORD	41;"INVE"	; "INVE"
	macWORD	254;"TEMP"	;"CAS"	; TIME was 43
	macWORD	42;"PAS"	; **new**	; NUMBER OF STEPS
	macWORD	42;"TOUR"	; "KORA"	; TURN was 43
*	macWORD	42;"	; "UKAZ"	; TURN was 43
	macWORD	43;"SCOR"	; "REZU"	; SCORE
*	macWORD	43;"	; "TOCK"	; SCORE
	macWORD	44;"QUIT"	; "KONE"	; QUIT
	macWORD	45;"ENCU"	; "FUK" 
*	macWORD	45;"	; "JEBI"
	macWORD	45;"SALO"	; "KURA"
	macWORD	45;"BITE"	; "KURC"
	macWORD	45;"CHAT"	; "PIZD"
	macWORD	46;"GLAC"	; "LED" 
*	macWORD	46;"	; "PLAZ"
	macWORD	47;"SOS"	; "SOS" 
	macWORD	47;"AIDE"	; "POMA"
*	macWORD	47;"	; "POMO"
	macWORD	48;"FOND"	; "STAL"
	macWORD	49;"ATTI"	; "ATIL"
	macWORD	50;"TETE"	; "GLAV"
	macWORD	51;"PELL"	; "LOPA"	; SHOVEL?
	macWORD	52;"CREM"	; "KREM"
	macWORD	53;"APPL"	; "NAMA"
	macWORD	54;"MOI"	; "SE"
	macWORD	55;"IREN"	; "IREN"
	macWORD	56;"SOUS"	; "GATE"
*	macWORD	56;"	; "SPOD"
	macWORD	57;"DORS"	; "PODR"
	macWORD	57;"DORM"	; "POFU"
*	macWORD	57;"	; "POKA"
*	macWORD	57;"	; "POJE".
	macWORD	57;"EMBR"	; "POLJ"
	macWORD	58;"THEO"	; "TEOD"	; THEODOR
	macWORD	59;"ENTE"	; "ZAKO"	; TO BURY = ENTERRER
	macWORD	60;"EMON"	; "EMON"
	macWORD	61;"HARP"	; "HARF"
	macWORD	62;"BAGU"	; "PRST"
	macWORD	63;"JOUE"	; "ZAIG"
*	macWORD	64;"	; "ZENS"
	macWORD	64;"FEMM"	; "ZENE"
	macWORD	65;"PONT"	; "CUPR"	; BRIDGE
	macWORD	65;"CHAT"	; "GRAD"	; CASTLE
	macWORD	66;"FAUC"	; "SOKO"	; FALCON
	macWORD	66;"OISE"	; "PTIC"
	macWORD	67;"JOYA"	; "DJER"
	macWORD	67;"BIJO"	; "NAKI"
	macWORD	67;"COLL"	; **new**	; COLLIER
	macWORD	67;"COU"	; **new**	; COU
	macWORD	68;"ROYA"	; "KRAL"
	macWORD	69;"CHEV"	; "KONJ"
	macWORD	70;"FEE"	; "VILO"
	macWORD	71;"MARC"	; "MARK"	; MARCO
	macWORD	72;"FILL"	; "DEVO"
	macWORD	72;"SERV"	; **new**	; SERVANTE
	macWORD	73;"TSAR"	; "CARJ"
	macWORD	74;"REVE"	; "ZBUD"
	macWORD	75;"MONT"	; "ZAJA"
*	macWORD	75;"	; "JAHA"
	macWORD	76;"SECO"	; "RESI"	; SECOURIR/SAUVER
	macWORD	77;"EPEE"	; "MEC" 
	macWORD	78;"CRAN"	; "LOBA"
	macWORD	79;"PASS"	; "PROP"
	macWORD	80;"VIN"	; "VINO"
	macWORD	81;"FOUR"	; "VILE"	; FOURCHE
	macWORD	82;"BATO"	; "SIBO"
	macWORD	83;"SEL"	; "SOL" 
*	macWORD	83;"	; "NACL"
	macWORD	84;"PERM"	; "DOVO"
	macWORD	85;"TILL"	; "LIPO"	; LINDEN TREE is a TILLEUL
	macWORD	85;"ARBR"	; "DREV"
	macWORD	86;"LIVR"	; "PRIP"
	macWORD	87;"ALPH"	; "ABEC"
*	macWORD	87;"	; "AZBU"
	macWORD	88;"NAVI"	; "LADJ"
	macWORD	88;"MEDI"	; "ZDRA"	; HEALTH(Y) = SANTE and not index 88
	macWORD	89;"PERL"	; "BISE"
	macWORD	90;"SOIG"	; "OZDR"	; HEAL = SOIGNER
	macWORD	90;"SANT"	; "POZD"
	macWORD	91;"PIER"	; "KAME"
	macWORD	92;"TIRE"	; "USTR"
	macWORD	93;"CAPR"	; "KOZO"
	macWORD	94;"PIST"	; "PUSK"	; GUN
	macWORD	95;"CAFE"	; "KAVO"
	macWORD	96;"HARI"	; "PASU"	; BEANS = HARICOTS / POIS
	macWORD	96;"POIS"	; **new**
	macWORD	96;"SAC"	; "VREC"
	macWORD	97;"FRAN"	; "FRAN"
	macWORD	98;"PLAN"	; "POSA"
	macWORD	99;"CREU"	; "ODKO"	; TO DIG
	macWORD	100;"DEVE"	; "ODKL"	; UNLOCK
	macWORD	101;"CLE"	; "KLJU"
	macWORD	101;"CLEF"	; **new**
	macWORD	101;"CLES"	; **new**
	macWORD	102;"MOI"	; "ME"
	macWORD	103;"BOIR"	; "PIJ" 
*	macWORD	103;"	; "POPI"
	macWORD	104;"R"	; SHORT FOR REGARDER
	macWORD	104;"V"	; SHORT FOR VOIR
	macWORD	104;"REGA"	; "OPIS"
	macWORD	104;"VOIR"	; "GLEJ"
	macWORD	104;"VOIS"	; "POGL"	; LOOK
	macWORD	105;"SAUV"	; "SAVE"	; SAVE
	macWORD	107;"ASSO"	; "CIRA"
	macWORD	107;"ASSI"	; "SEDI"
	macWORD	108;"CHAR"	; "LOAD"	; LOAD
	macWORD	109;"OUI"	; "DA"
	macWORD	110;"DESH"	; "SLEC"	; UNDRESS
*	macWORD	110;"	; "SNEM"
	macWORD	111;"BOIS"	; "LES" 
	macWORD	112;"PORT"	; "VRAT"
	macWORD	113;"LAZA"	; "LAZA"
	macWORD	114;"MIRO"	; "OGLE"	; MIRROR
*	macWORD	115;"	; "SCRE"
*	macWORD	115;"	; "EKRA"
	macWORD	116;"AFFI"	; "RISI"
	macWORD	116;"DESS"	; **new**
	macWORD	117;"NON"	; "NE"
	macWORD	118;"QUOI"	; "KAJ" 
	macWORD	118;"QUI"	; "KDO" 
	macWORD	118;"COMM"	; "KAKO"
	macWORD	118;"POUR"	; "ZAKA"
*	macWORD	118;"	; "KOGA"
	macWORD	119;"VEND"	; "PROD"
	macWORD	120;"ACHE"	; "KUPI"
	macWORD	121;"ATTR"	; "UJEM"
	macWORD	122;"FOUR"	; "KOZE"
	macWORD	122;"PEAU"	; "KOZE"	; **new**
	macWORD	122;"DAIM"	; "KOZE"	; **new**
	macWORD	123;"TOUC"	; "UDAR"	; STRIKE
	macWORD	124;"DIAB"	; "VRAG"
	macWORD	125;"METO"	; "METO"
	macWORD	126;"SCEA"	; "TESN"
	macWORD	127;"CORR"	; "FITI"	; FITTING (OBJECT)
	macWORD	128;"CASS"	; "CASE"	; ** new ** upper/lower case
	macWORD	129;"HOME"	; "HOME"	; ** new ** top of screen on new location
	macWORD	130;"DEBU"	; "DEBU"	; ** new ** debug on/off
	macWORD	131;"ACCE"	; "SUMN"	; ** new ** accents on/off (SUMNIKI)
	macWORD	255;"_"	; "_"
