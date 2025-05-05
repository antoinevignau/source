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
	asc	"You are the only literate person in your land, the rest would clearly want the same. To save them from the Stone Age- a great desire,"8D
	ASC	"this work tempts you, hero. Don't wait, hesitate, you just hurry up, without you we will all soon be in ..."8D00
	asc	"You stand alone in the house, You hold the rainbow in your hands."00
	asc	"You are at a rocky crossroads, where SMUGGLING gives life a rhythm."00
	asc	"The dark forests are cold and gloomy."00
	asc	"Getting amber is difficult. Everyone wonders, how the hell."00
	asc	"Be persistent and go north, repeat this difficult maneuver a hundred times. The passage is open between half past and quarter past."00
	asc	"The swamp is damp, it's important to escape."00
	asc	"Mosquitoes are biting you, they're pressing your buttons, it's very painful, RUN, there's no luck for you here."00
	asc	"Strange people live here, they build huts on the river banks"00
	asc	"You're in a cold and damp cave, you're cold, but you're not going to disappear. There are tailors here who know how to sew and they give you needles for a kind word."00
	asc	"The North and the East will solve your problem."00
	asc	"You look and ask: "A2"What is this stilt?"A2" Jalen tells you: "A2"Don't you see, a bridge!"A2""00
	asc	"It's a funny beast, this south-wester, soon there will be only a corpse left of him."00
	asc	"A huge mammoth is rushing towards you, to the east and west it is blocking your path, quickly take some action to save you, if not, all you have left is prayer."00
	asc	"There are roads in the forest, frost, dangerous animals live here."00
	asc	"You can see through the leaves of the patch that someone is looking at you in the distance."00
	asc	"A city lies by the Sava and Danube, the weather forecast is silent without a word."00
	asc	"You are in the middle of a dark forest, oh how the wolf howls from afar."00
	asc	"Andersen sent a girl here, to the north then he advised her on her way "A2"Vzigalic, bring the package quickly, new ones will be the beginning for you."A2""00
	asc	"Gozzzdddddd..."00
	asc	"You can get warm clothes here, but they have nothing to fill you up."00
	asc	"In the NAGI workshop, the choice is great, everything you see here is very tempting. They have situl outlines behind a thin veil MEJDINHONGKONG written on them"00
	asc	"You are in a new factory in the village, they say SITULAR."00
	asc	"The forests are dense, but dangerous, and the creatures in them are scary careless."00
	asc	"The paths are well-trodden, the old trees, what are you really in a hurry to heaven."00
	asc	"Every animal is wary of its prey, beware traveler, that it may not be you."00
	asc	"All you see are treetops, they nicely block your way to heaven."00
	asc	"They always have bad luck at SPARK, a they know how to roll a stone face to face."00
	asc	"The hill rises high above the valley, take a deep breath of clean air."00
	asc	"There is a large hole in the rock, it clearly tempts you to climb into it. It is rarely free to enter, the cave bear is a permanent guest here."00
	asc	"Money merchants live here, they are eager to buy treasures from you. Never destroy their hopes, only dry them well at the buyer's."00
	asc	"Someday there will be a beautiful inn here, the drink will be good, the food plentiful. A writer with a mustache will live here, we will have to write books about him."00
	asc	"Here in the forest there is a settlement, there is money and joy in it. The locals live in it, they rush to sell you hooks."00
	asc	"Proteus the fish lives in this cave, but just like a man, she is not."00
	asc	"This place is dangerous because of the beasts, who like to eat people's things. (there are paths to the E, W and S)"00
	asc	"The poor wretched live on the slope, each gets three stones a week."00
	asc	"Jason is waiting for you on the lake shore, the weather is torturing him, the nights are like sheep. On the other side is a real paradise give him something to fix the boat."00
	asc	"Rome is a beautiful city forever, everyone can find everything in it, but the crazy Nero is serious, that he will burn it down at dusk."00
	asc	"You are on the Roman road, which is written with a little, there will be rocks, from it, to this day."00
	asc	"You are alone on road, it hurts you, you look and look it leads you into the unknown."00
	asc	"This bridge leads to the Slavic land the passage to the south is not free for everyone."00
	asc	"Mirrors on the ceiling and walls red, any man here would go crazy with happiness"00
	asc	"You stand in front of the Emon wall, you are clearly afraid to enter inside."00
	asc	"They fear Attila the Hun here, they want his head on a platter."00
	asc	"You stand in the Roman city, you are rejoicing in life."00
	asc	"Under the free sun Irena lies, it burns her back, so that it burns. If she runs out of cream, she will stink."00
	asc	"You have arrived in a rich city, his golden statue pride, before you go on the road, carefully stick your nose in it."00
	asc	"You are in the square now, Emon, cold earth lies here, If you hold a shovel in your hands, bury something too."00
	asc	"You are at the Roman aqueduct, water can be obtained from here, But since it all goes to the cities, you cannot drink it."00
	asc	"The breeze is coming, the sun is setting, a new love is arising in you."00
	asc	"In Split there are famous artists, who play night and day, instruments are lacking, the emperor searches for them in vain."00
	asc	"Pula is a city-port, which has its own arena. Enter and find happiness, if you only want to race."00
	asc	"In the arena magnificent, you stand in the middle of the track, the competitors are unique, you are very afraid of them."00
	asc	"The forest is ugly and neglected, this catches your eye, everything that falls from the trees falls off, there it lies forever."00
	asc	"Here the stinker with no manners is Mephisto-the devil-shepherd."00
	asc	"The farmers here are all drunk, the vines bear good fruit for them, if you want wine, offer them tools."00
	asc	"In the distance, a filthy city, black smoke billows out. The plague is a dangerous pest, it kills with its scythe all around."00
	asc	"The city is filthy, a real graveyard, here you come to the cemetery somewhere. Many terrible things can be found there, witches invite and delight."00
	asc	"Stone upon stone, a cemetery, death is found here, whoever seeks it."00
	asc	"Like a hen on eggs a white castle stands here. The wine is thirsty of the cellar masters."00
	asc	"The airport is large, because everything on the hill is noisy. The traffic is noisy of people's heads everyone is staring."00
	asc	"The bridge over the water is being built, you definitely want to go east, there's no way for you to continue here, if you don't get the money for the toll."00
	asc	"The road is white, wide, it leads you straight to the south. That gives you new powers, just get to work now, HORUK!"00
	asc	"You've entered the stable big, every horse here takes a point. But in order to get the animal, what someone Artur said you have to do"00
	asc	"Dusan is a legendary rich king, he buys and trades horses en masse."00
	asc	"Tsar Lazar is dead and sleeping, only SHE can wake him up."00
	asc	"The Sultan's mansion is new and modern, he needs a woman, so that it will be more comfortable."00
	asc	"In the brigade Marko "drives Karioilla, in it rides the fairy Ravioila."00
	asc	"Low bushes, green grass, there is no woman more beautiful than this, (no assessment was more desirable ..."00
	asc	"The road winds into the distance, there on the hill there stands a castle. Up on the castle someone is shouting, a little pea that everyone is afraid of."00
	asc	"The big bad wolf lives here, His name is Wolf, this is an Olympic city, where trade is allowed."00
	asc	"Empress Milica, evil and beautiful, jewelry is hard to get, not beautiful."00
	asc	"Dark are the dungeons, in this terrible castle. People live in them in dampness and cold."00
	asc	"Miracles always happen in fairy tales, them but heroes live here."00
	asc	"Mehmed Sokolovic is here, your good wish will come true"00
	asc	"On the Kosovo field, a river winds, "A2"BIREKU ESTE AND PEACE"A2", the inhabitant shouts to you."00
	asc	"Here are great forests, wolves howl in them."00
	asc	"Karadzic is written as Vuk, he writes, he works without pain."00
	asc	"..."A2"every gun will be deadly, in the hands of Mandusic Vuk"A2" ..."00
	asc	"Serbia is not really big, and it tempts its neighbors. Everyone wants it with all their heart, but is afraid to attack."00
	asc	"Sultan Murat is really rich, his court is truly luxurious."00
	asc	"Clear lake deep at his feet you lie. Pearls in it are beautiful, I would like to have them now."00
	asc	"In the Dubrovnik pharmacy, you can get pills for pearls."00
	asc	"The sea is wet and salty, because we like to eat salty food, they steal salt from it openly."00
	asc	"This valley is full of roses, The famous Bleiweis lives here. He adores Carniolan bees, he loves and grows linden trees."00
	asc	"Ljubljana is a white, modern city but in the new part it is gloomy."00
	asc	"Carniolan"s have always been beautiful, famous, but there was none more beautiful than the mountain. None was more desirable to my fathers,"8D
	ASC	"in its time of snow skiing, it did not climb."00
	asc	"Mount Triglav is big, capricorns swarm, you are tempted to walk up, that's what every Slovenian wants."00
	asc	"The road takes you to Vienna, just hurry up to the joy."00
	asc	"Everyone wants to play in the Prater, good ones there are machines. First Contraband is playing, "A2"twos"A2" unfortunately they don't know each other."00
	asc	"Marija the assistant likes to help you, name the road after her 5% you already weigh"00
	asc	"Jozef lives in a beautiful mansion, Franck's stomach loves to hurt."00
	asc	"There used to be a linden tree here, today it's gone. You have a faucet for cleanliness, if it doesn't work, it stinks."00
	asc	"Now you are approaching the end, the prize is smiling at you, use all yours now knowledge, sorry there is no way back."00
	asc	"You are in Ljubljana, the white city, you left something here, if you played correctly, it lies under your feet."00
	asc	"There is an empty pedestal here, nothing stands on it. Just pay your taxes carefully, put something up there."00
	asc	"Here is a monster standing in front of you, it threatens to kill you, it has the form of a paragraph, get over it, kill it."00
	asc	"The room is deserted and empty, the path leads you to the west. Surprises are crazy, and dangers are everywhere."00
	asc	"You almost succeeded, to get to the last year now, well really think about it now, give a smart answer."00
	asc	"You finished the game successfully, well really you are here, it is not what. Save the picture on a cassette, give it to the old man quickly."00
	asc	"On a lonely island, in a quiet sea you are now standing, because you spoke badly, you will not get another chance."00
	asc	""00

*------------------------------
* MESSAGES
*------------------------------

tblMESSAGES
	asc	"Dressed in a fleece covered with tar, you come to the future, not any."00
	asc	"Jason gratefully took the tar, he repaired the ship and took you with him."00
	asc	"The tar is not really sticky, Jason is not at night, because it makes him angry."00
	asc	"He flew away in a beautiful arc, he hit the mammoth right in the heart."00
	asc	"You threw the transformer very hard, he flew away far, he will not return."00
	asc	"The bear seriously grabs you far away, forgets about you. "00
	asc	"The bear sits in front of the hole a lot, does not let anyone in for free."00
	asc	"The fire burned, the bees burned, honey in the hive you freed."00
	asc	"The wind is strong, the fire is burning, blow once - the flame is gone."00
	asc	"The beast is stupid, he doesn't know what he's doing, he took Proteus."00
	asc	"Solve the riddle, then move, if you want to live, quickly get away."00
	asc	"Hurry up and do something quickly, if it doesn't happen, my friend, it'll be after you soon!"00
	asc	"It's very easy to die here, wait a little and you'll be gone."00
	asc	"The bright flame immediately ignites it burns a little, then dies."00
	asc	"You can't kill him easily, there's little time, but you're in trouble."00
	asc	"The beast is very dangerous, it's hard to outwit it."00
	asc	"Don't kill the Yugozaurus, it's a very rare animal, if I did that to you right now, you'd soon regret it."00
	asc	"The bees saw the danger, they quickly flew away."00
	asc	"Hello, fool, I'm the Game, I obey you, I laugh out loud. You're making stupid mistakes, big ones, you're falling for old and new tricks."8D
	ASC	"If you keep going like this, you'll never finish the game."00
	asc	"If you're used to talking from home you know that, little man, there's no fun here with me."00
	asc	"The ice is cold and massive, it's hard to melt it, but you know that you won't be able to do it without a trick. "00
	asc	"I thought that hide; should I kill him with a shovel?!?"00
	asc	"As petty as a fly, you want it impossible, but because you really insist on being petty  - boom! and Attila is gone."00
	asc	"You've smeared yourself and you're very pretty, it'll be very hard to get a new one."00
	asc	"It burns her back so much that she moans and crys, she doesn't want to let go of your smearing she doesn't want to."00
	asc	"Irena enjoys it, sighs loudly, Iztok, her lover will soon hear it. He immediately understands what"8D
	ASC	"is behind it, he draws his sword and solves the problem."00
	asc	"You are not a master, your needs are great you need a miracle to resolve the differences. "00
	asc	"Nero gratefully takes the matches, forgets about the harp, and Rome is already on fire."00
	asc	"Diocletian is delighted with the harp, and gives you a ring and grinds the stone."00
	asc	"You handle the harp badly, you barely play it and then the string breaks, that's terrible, but it's already too late to cry."00
	asc	"Riding well is not your virtue, because it is a skill that is harder than thunder." The horse suddenly starts to neigh, throws you off and breaks your neck. 00
	asc	"You've returned to the north again," let me just tell you: "A2"Going back" is not !" A2 "00
	asc	"The fairy jumped on the horse, she went ahead with you." 00
	asc	"The fairy horse is now dismounting, she goes a little" 8D "away and waves to you." 00
	asc	"You saved the Kosovar girl nicely," she's lucky you didn't smile in front of her." 00
	asc	"The Kosovar girl doesn't let the Tsar sleep," she throws you through the open door." 00
	asc	"The girl is really virtuous, she won't let you kiss her, she'd do whatever you want, etiquette doesn't allow me to do that." 00
	asc	"How to tear it down, you don't know that, otherwise you shouldn't do that."00
	asc	"You're a bad swindler, a fool, a hundred times worse than Krpan."00
	asc	"You killed Capricorn, got the miraculous stone."00
	asc	"Because of people like you, everyone is extinct."00
	asc	"Franc is cured and rules, because the gnada is grateful to you, and gives you the way forward."00
	asc	"You've dug up Emonc now, the statue is beautiful, there's really nothing here, the path leads you towards the west, unfortunately you can't go back anymore."00
	asc	"The statue is beautiful, and the people are happy, they give five percent for it, again you go west slowly, there's less and less until the end."00
	asc	"Paragraph the monster is dead, big you became a hero, the points you have got so far, not everyone can have them."00
	asc	"The avalanche was really huge, and in it was cold, cold ice, there is no solution for you now, you have been frozen for a thousand years."00
	asc	"The mammoth came to you, you did not stand up for defense; the result is short, clear: you are now into the pulp."00
	asc	"They are very sharp, the stings are painful, the stings of these bees are really itchy."00
	asc	"To let you out of this world, the bloodthirsty beast wants a man."00
	asc	"You came to the race with a micro drive and waved the flag, you are afraid it has begun ..."00
	asc	"The equipment is to blame for you being last but the cream is yours to console."00
	asc	"Footsteps are already heard, brave Justi, hurry up. Drop the amber and run away, maybe this one will hold him back."00
	asc	"Teodora is not cheap, you need amber here now. He pulls the knife from under the blanket, he is now touching your chest."00
	asc	"Marko comes and goes with you, you can be happy about that if you keep him by you, you'll have good help."00
	asc	"You were almost at the end, an accident befalls you, the trap with the laws destroys you, you're dead now "00
	asc	"Spectrum is heating up a lot, the avalanche has melted he can."00
	asc	"ZX has now switched on, it's really quiet he's humming, so it's almost smoking out."00
	asc	"You'd like to watch me die, but that's exactly why I won't reset."00
	asc	"Are you an idiot?"00
	asc	"HELP!"00
	asc	"He brought Irena the cream she wanted, she's so proud of you now, she's so proud of you, she's so proud of you, she's given you the love of your life  the gate is magical."00
	asc	"It's hard to get to the south now, without a small precious stone it won't be slo."00
	asc	"I would have worked with one woman, but not many like that."00
	asc	"Since the fairy doesn't want to walk the dog, at least try to get a horse."00
	asc	"The wine is sweet, red."00
	asc	"HIK ?!"00
	asc	"No entry without permission."00
	asc	""00
	asc	"The race is not in season, even if you are in the arena, otherwise you win in anyway."00
	asc	"I'm not so tough that you want to die."00
	asc	"You attack Franc, he's afraid, of calling the guards, you're gone."00
	asc	"PUFF ..."00
	asc	"The old trick here is not vzge, try something new."00
	asc	"You must be nicely dressed."00
	asc	"The peasants drank the wine for you, and gave you a letter as a gift."00
	asc	"The devil gets scared and runs away, leaves the fairies to you."00
	asc	"The empress is treated kindly by the lime tree, Gregor allows you to carry the salt."00
	asc	"The editor publishes your stories, gives you a sapling as a thank you."00
	asc	"The wolf rushes to write, writes just as he speaks."00
	asc	"Cyril Metod gets well, gives the ABC in memory."00
	asc	"Medoda's tooth hurts, Cyril is hanging at the letter "A2"B"A2"."00
	asc	"The peasants confiscated the wine, allowed you to travel."00
	asc	"Good stories for "A2"NEWS"A2", in Vienna are better than foreign currency."00
	asc	"The method hurts your teeth, Cyril stands at the letter "A2"B"A2"."00
	asc	"You came too late, because this is really terrible."00
	asc	"The clock is ticking, it says nothing."00
	asc	"The avalanche is cold, the ice is holding you in your fist to the north and south, it won't let you go."00
	asc	"You looked at the skull and dared to take the sword."00
	asc	"The militia grabbed the jewelry, forgot about the kingdom. "00

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
	macOBJ	36;"golden fleece"
	macOBJ	O_NOTCRE;"golden statue of Emonc"
	macOBJ	60;"sword"
	macOBJ	83;"salt"
	macOBJ	97;"golden key to the year 2000"
	macOBJ	O_NOTCRE;"salt shipping permit"
	macOBJ	84;"linden sapling"
	macOBJ	O_NOTCRE;"storybook"
	macOBJ	1;"mirror"
	macOBJ	78;"gun"
	macOBJ	O_NOTCRE;"horse"
	macOBJ	O_NOTCRE;"kingdom"
	macOBJ	70;"golden djerdan"
	macOBJ	66;"bridge"
	macOBJ	62;"women"
	macOBJ	58;"skull"
	macOBJ	O_NOTCRE;"pass for the dirty city"
	macOBJ	55;"wine"
	macOBJ	O_NOTCRE;"fairies"
	macOBJ	53;"sibo"
	macOBJ	8;"strange statue"
	macOBJ	6;"green rego"
	macOBJ	32;"trnke"
	macOBJ	30;"illyrian coin"
	macOBJ	18;"matchbox"
	macOBJ	O_NOTCRE;""
	macOBJ	O_NOTCRE;"harp"
	macOBJ	O_NOTCRE;""
	macOBJ	27;"tar"
	macOBJ	21;"situlo"
	macOBJ	O_NOTCRE;"clothes"
	macOBJ	9;"bone sivanka"
	macOBJ	O_CARRIED;"transformer for Spectrum"
	macOBJ	O_NOTCRE;"honey"
	macOBJ	24;"wood"
	macOBJ	4;"amber"
	macOBJ	O_CARRIED;"Microdrive"
	macOBJ	O_NOTCRE;"sunscreen"
	macOBJ	O_NOTCRE;"magical Iztok Gate"
	macOBJ	16;"weather forecast"
	macOBJ	O_NOTCRE;"tar-coated fleece"
	macOBJ	O_NOTCRE;"tar in a situla"
	macOBJ	14;"ice avalanche"
	macOBJ	13;"evil mammoth"
	macOBJ	29;"dangerous bear"
	macOBJ	34;"seriously beast"
	macOBJ	33;"proteus"
	macOBJ	O_NOTCRE;"sparkling Spectrum"
	macOBJ	28;"bees"
	macOBJ	12;"southern saur"
	macOBJ	44;"shovel"
	macOBJ	39;"Hunting Attila"
	macOBJ	O_NOTCRE;"Attila"A7"s head"
	macOBJ	45;"beautiful Irene"
	macOBJ	41;"attractive Teodoro"
	macOBJ	O_NOTCRE;"harp"
	macOBJ	50;"ring"
	macOBJ	74;"falcon"
	macOBJ	38;"roman coin"
	macOBJ	O_NOTCRE;"kingdom"
	macOBJ	73;"Ravioilo"A7"s mansion"
	macOBJ	O_NOTCRE;"horse-drawn mansion"
	macOBJ	O_NOTCRE;"queen Marka"
	macOBJ	72;"Kosovo girl"
	macOBJ	O_NOTCRE;"alphabet"
	macOBJ	82;"medicine"
	macOBJ	81;"pearl"
	macOBJ	O_NOTCRE;"healing stone"
	macOBJ	80;"coffee "A2"Minas"A2
	macOBJ	79;"bean bag"
	macOBJ	91;"Franco Jozef"
	macOBJ	O_NOTCRE;"salt in the head"
	macOBJ	20;"deerskin"
	macOBJ	41;"seal"
	macOBJ	90;"fitting"8D
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
	asc	8D"It"A2"s dark."00
	asc	8D"I also see:"00
	asc	8D"Command, oh master!"00
	asc	8D"What should I do?"00
	asc	8D"Hurry up with the command."00
	asc	8D"How to proceed?"00
	asc	8D"I"A2"m not programmed for this."00
	asc	8D"I can"A2"t go this way."00
	asc	8D"Even Iskra Delta Triglav"8D"couldn"A2"t do that."00
	asc	8D"I"A2"m carrying "00
	asc	" (worn)"00
	asc	"nothing."00	; Carrying + nothing.
	asc	8D"Have you really given up "00
	asc	8D"Maybe you should try your luck again "00
	asc	8D"Coward!"00
	asc	8D"OK."00
	asc	8D"Press some eraser,"8D"and we"A2"ll continue."00
	asc	8D"You gave the orders: "00	; ** new ** Simplify plural management (c) Janez
**	asc	8D"You gave the "00
	asc	" order"00
	asc	"ov"00 ; plural
	asc	". "00
	asc	8D"You picked up "00
	asc	"%"00
	asc	8D"I can"A2"t even carry this."00
	asc	8D"I have both hands full."00
	asc	8D"I already have this!"00
	asc	8D"I don"A2"t see this here."00
	asc	8D"It"A2"s too heavy!"00
	asc	8D"I don"A2"t have this in my hands."00
	asc	8D"I already have this on me!"00
	asc	"Y"00
	asc	"N"00
	asc	8D"Paths lead to: "00
	asc	8D"I don"A2"t see any paths."00
	asc	8D"Load game (slot 1-9)? "00 ; ** new ** load game (slot 1-9)?
	asc	8D"Save game (slot 1-9)? "00 ; ** new ** save game (slot 1-9)?

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
	macWORD	1;"NORTH"	; "NORT"
	macWORD	2;"S"	; "S"
	macWORD	2;"SOUTH"	; "SOUT"
	macWORD	3;"E"	; "E"
	macWORD	3;"EAST"	; "EAST"
	macWORD	4;"W"	; "W"
	macWORD	4;"WEST"	; "WEST"
	macWORD	5;"NE"	; "SV"
	macWORD	6;"NW"	; "SZ"
	macWORD	7;"SE"	; "JV"
	macWORD	8;"SW"	; "JZ"
	macWORD	9;;"U"	; "U"
	macWORD	9;;"UP"	; "UP"
	macWORD	10;"D"	; "D"
	macWORD	10;"DOWN"	; "DOWN"
	macWORD	11;"	; "VEN"
	macWORD	11;"	; "IZST"
	macWORD	12;"	; "NOT"
	macWORD	12;"	; "NOTE"
	macWORD	12;"	; "VSTO"
	macWORD	13;"	; "L"
	macWORD	13;"	; "LEVO"
	macWORD	13;"	; "DESN"
	macWORD	14;"	; "KIP" 
	macWORD	14;"	; "KIPE"
	macWORD	15;"	; "KOVA"
	macWORD	15;"	; "DENA"
	macWORD	16;"	; "TRNK"
	macWORD	17;"	; "REGO"
	macWORD	17;"	; "ZABO"
	macWORD	18;"	; "NAPO"
	macWORD	18;"	; "VREM"
	macWORD	19;"	; "RUNO"
	macWORD	20;"	; "IGLO"
	macWORD	20;"	; "SIVA"
	macWORD	21;"	; "OBLE"	; DRESS
	macWORD	21;"	; "NATA"
	macWORD	22;"	; "SITU"
	macWORD	22;"	; "POSO"
	macWORD	23;"	; "SMOL"
	macWORD	23;"	; "ZASM"
	macWORD	24;"	; "DAJ" 
	macWORD	24;"	; "VRZI"
	macWORD	24;"	; "SPUS"
	macWORD	24;"	; "ODLO"
	macWORD	25;"	; "PRIZ"
	macWORD	25;"	; "VKLJ"
	macWORD	26;"	; "ZX"
	macWORD	26;"	; "SPEC"
	macWORD	26;"	; "SINC"
	macWORD	26;"	; "RACU"
	macWORD	27;"	; "TRAF"
	macWORD	27;"	; "TRAN"
	macWORD	28;"	; "MED" 
	macWORD	29;"	; "OGEN"
	macWORD	30;"	; "PROT"
	macWORD	30;"	; "CLOV"
	macWORD	31;"	; "UGAS"
	macWORD	31;"	; "IZKL"
	macWORD	32;"TAKE"	; "VZEM"	; TAKE
	macWORD	32;"	; "POBE"
	macWORD	32;"	; "UKRA"
	macWORD	33;"	; "VZIG"
	macWORD	33;"	; "SIBI"
	macWORD	34;"	; "JANT"
	macWORD	35;"	; "MCD" 
	macWORD	35;"	; "MICR"
	macWORD	35;"	; "MIKR"
	macWORD	36;"	; "UBIJ"
	macWORD	36;"	; "NAPA"
	macWORD	37;"	; "MAMU"
	macWORD	38;"	; "CEBE"
	macWORD	39;"	; "ZVER"
	macWORD	40;"	; "JUGO"
	macWORD	41;"I"	; "I"	; INVENTORY
	macWORD	41;"INVENTORY"	; "INVE"
	macWORD	254;"TIME"	;"CAS"	; TIME was 43
	macWORD	42;"TURN"	; "KORA"	; TURN was 43
	macWORD	42;"TURN"	; "UKAZ"	; TURN was 43
	macWORD	43;"SCORE"	; "REZU"	; SCORE
	macWORD	43;"SCORE"	; "TOCK"	; SCORE
	macWORD	44;"QUIT"	; "KONE"	; QUIT
	macWORD	45;"	; "FUK" 
	macWORD	45;"	; "JEBI"
	macWORD	45;"	; "KURA"
	macWORD	45;"	; "KURC"
	macWORD	45;"	; "PIZD"
	macWORD	46;"	; "LED" 
	macWORD	46;"	; "PLAZ"
	macWORD	47;"	; "SOS" 
	macWORD	47;"	; "POMA"
	macWORD	47;"	; "POMO"
	macWORD	48;"	; "STAL"
	macWORD	49;"	; "ATIL"
	macWORD	50;"	; "GLAV"
	macWORD	51;"	; "LOPA"
	macWORD	52;"	; "KREM"
	macWORD	53;"	; "NAMA"
	macWORD	54;"	; "SE"
	macWORD	55;"	; "IREN"
	macWORD	56;"	; "GATE"
	macWORD	56;"	; "SPOD"
	macWORD	57;"	; "PODR"
	macWORD	57;"	; "POFU"
	macWORD	57;"	; "POKA"
	macWORD	57;"	; "POJE".
	macWORD	57;"	; "POLJ"
	macWORD	58;"	; "TEOD"
	macWORD	59;"	; "ZAKO"
	macWORD	60;"	; "EMON"
	macWORD	61;"	; "HARF"
	macWORD	62;"	; "PRST"
	macWORD	63;"	; "ZAIG"
	macWORD	64;"	; "ZENS"
	macWORD	64;"	; "ZENE"
	macWORD	65;"	; "CUPR"
	macWORD	65;"	; "GRAD"
	macWORD	66;"	; "SOKO"
	macWORD	66;"	; "PTIC"
	macWORD	67;"	; "DJER"
	macWORD	67;"	; "NAKI"
	macWORD	68;"	; "KRAL"
	macWORD	69;"	; "KONJ"
	macWORD	70;"	; "VILO"
	macWORD	71;"	; "MARK"
	macWORD	72;"	; "DEVO"
	macWORD	73;"	; "CARJ"
	macWORD	74;"	; "ZBUD"
	macWORD	75;"	; "ZAJA"
	macWORD	75;"	; "JAHA"
	macWORD	76;"	; "RESI"
	macWORD	77;"	; "MEC" 
	macWORD	78;"	; "LOBA"
	macWORD	79;"	; "PROP"
	macWORD	80;"	; "VINO"
	macWORD	81;"	; "VILE"
	macWORD	82;"	; "SIBO"
	macWORD	83;"	; "SOL" 
	macWORD	83;"	; "NACL"
	macWORD	84;"	; "DOVO"
	macWORD	85;"	; "LIPO"
	macWORD	85;"	; "DREV"
	macWORD	86;"	; "PRIP"
	macWORD	87;"	; "ABEC"
	macWORD	87;"	; "AZBU"
	macWORD	88;"	; "LADJ"
	macWORD	88;"	; "ZDRA"
	macWORD	89;"	; "BISE"
	macWORD	90;"	; "OZDR"
	macWORD	90;"	; "POZD"
	macWORD	91;"	; "KAME"
	macWORD	92;"	; "USTR"
	macWORD	93;"	; "KOZO"
	macWORD	94;"	; "PUSK"
	macWORD	95;"	; "KAVO"
	macWORD	96;"	; "PASU"
	macWORD	96;"	; "VREC"
	macWORD	97;"	; "FRAN"
	macWORD	98;"	; "POSA"
	macWORD	99;"	; "ODKO"
	macWORD	100;"	; "ODKL"
	macWORD	101;"	; "KLJU"
	macWORD	102;"	; "ME"
	macWORD	103;"	; "PIJ" 
	macWORD	103;"	; "POPI"
	macWORD	104;"	; "OPIS"
	macWORD	104;"	; "GLEJ"
	macWORD	104;"LOOK"	; "POGL"	; LOOK
	macWORD	105;"SAVE"	; "SAVE"	; SAVE
	macWORD	107;"	; "CIRA"
	macWORD	107;"	; "SEDI"
	macWORD	108;"LOAD"	; "LOAD"	; LOAD
	macWORD	109;"	; "DA"
	macWORD	110;"	; "SLEC"
	macWORD	110;"	; "SNEM"
	macWORD	111;"	; "LES" 
	macWORD	112;"	; "VRAT"
	macWORD	113;"	; "LAZA"
	macWORD	114;"	; "OGLE"
	macWORD	115;"	; "SCRE"
	macWORD	115;"	; "EKRA"
	macWORD	116;"	; "RISI"
	macWORD	117;"	; "NE"
	macWORD	118;"	; "KAJ" 
	macWORD	118;"	; "KDO" 
	macWORD	118;"	; "KAKO"
	macWORD	118;"	; "ZAKA"
	macWORD	118;"	; "KOGA"
	macWORD	119;"	; "PROD"
	macWORD	120;"	; "KUPI"
	macWORD	121;"	; "UJEM"
	macWORD	122;"	; "KOZE"
	macWORD	123;"	; "UDAR"
	macWORD	124;"	; "VRAG"
	macWORD	125;"	; "METO"
	macWORD	126;"	; "TESN"
	macWORD	127;"	; "FITI"
	macWORD	128;"CASE"	; "CASE"	; ** new ** upper/lower case
	macWORD	129;"HOME"	; "HOME"	; ** new ** top of screen on new location
	macWORD	130;"DEBUG"	; "DEBU"	; ** new ** debug on/off
	macWORD	255;"_"	; "_"
