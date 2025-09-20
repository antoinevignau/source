*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CHAT_str100	ent
*	dfb	eMODE,1
*	dfb	eINK,0,0
*	dfb	eINK,1,6
*	dfb	eINK,2,15
*	dfb	eINK,3,25
*	dfb	eBORDER,0
*	dfb	ePAPER,0
*	dfb	eCLS
	dfb	ePEN,3*3	; 3
	asc	''0d
	asc	'Rue Bastet.'
	asc	''0d
	asc	'Des maisons'
	asc	's'278e'l'8f'vent,'0d
	asc	'et sur'0d
	asc	'leurs'0d
	asc	'toits,'0d
	asc	'des chats'0d
	asc	8e'gyptiens'0d
	asc	'r'8f'gnent en'0d
	asc	'pharaons'0d
	asc	'moustachus.'
	dfb	eEOD

CHAT_str200	ent
*	dfb	eMODE,1
*	dfb	eINK,0,0
*	dfb	eINK,1,6
*	dfb	eINK,2,15
*	dfb	eINK,3,25
*	dfb	eBORDER,0
*	dfb	ePAPER,0
*	dfb	eCLS
	dfb	eLOCATE,13,20
	dfb	ePEN,2*3	; 2
	asc	'QUE FAITES-VOUS ?'
	dfb	ePEN,3*3	; 3
	dfb	eLOCATE,4,21
	asc	'1-NORD      2-SUD      3-Examiner'
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,22
	asc	'4-S'27'approcher du chat de gauche'
	dfb	ePEN,9	; 3
	dfb	eLOCATE,4,23
	asc	'5-S'27'approcher du chat de droite'
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,24
	asc	'6-Escalader les toits'
	dfb	eEOD

CHAT_str300	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Vous essayez d'27'avancer vers le NORD...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais une horde de chats '8e'gyptiens se'0d
	asc	'dresse devant vous, moustaches au'0d
	asc	'garde-'88'-vous !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Impossible de passer :'0d
	asc	''0d
	asc	'C'27'est comme si ces boules de poils'0d
	asc	'gardaient un secret mill'8e'naire.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous reculez, battu par une arm'8e'e de'0d
	asc	'ronrons...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Oui, mais des ronrons qui sonnent comme'0d
	asc	'un '22'NON'22' ferme et velu, et croyez-moi,'0d
	asc	'c'27'est plus intimidant qu'27'une porte'0d
	asc	'en pierre gard'8e'e par un sphinx'0d
	asc	'grincheux.'0d
	dfb	eLOCATE,5,17
	dfb	ePEN,1
	asc	'NON'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str400	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Vous examinez la sc'8f'ne.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Une ruelle tordue, des maisons'0d
	asc	'bancales, et sur les toits...'0d
	asc	'des chats '8e'gyptiens noirs.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Majestueux, '8e'lanc'8e's, et clairement:'0d
	asc	'plus intelligents que vous.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Ils vous fixent comme si vous veniez'0d
	asc	'de marcher sur leur territoire sacr'8e'.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous esp'8e'riez des indices ?'0d
	asc	'Vous recoltez du m'8e'pris felin et'0d
	asc	'une le'8d'on silencieuse :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'     Ici, c'27'est eux les boss !'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais bon, versez du lait et vous aurez'0d
	asc	'pay'8e' votre protection. Vous serez'0d
	asc	'alors tol'8e'r'8e'...'0d
	dfb	ePEN,2
	asc	'       ...jusqu'2788' la prochaine tourn'8e'e !'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str500	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Vous approchez du chat de droite,'0d
	asc	'l'27'air confiant...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'            Erreur fatale.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'La cr'8e'ature vous fixe, l'27'oeil brillant'0d
	asc	'comme une amulette maudite, puis d'8e'cide'0d
	asc	'soudain que votre visage est un'0d
	asc	'griffoir.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Le chat saute de son perchoir'0d
	asc	'et en une seconde, vous submerge de'0d
	asc	'coups de griffes, de miaulements'0d
	asc	'furieux et de poils volants.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'On racontera plus tard qu'27'un aventurier'0d
	asc	'inconnu a fini en offrande f'8e'line,'0d
	asc	'empaquet'8e' dans des poils de chat'0d
	asc	'plut'99't que dans des bandelettes.'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str600	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Comme tu sembles totalement d'8e'muni de'0d
	asc	'bon sens, tu choisis de grimper sur des'0d
	asc	'tuiles instables sous un soleil qui'0d
	asc	'pourrait faire fondre un chameau.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Tu t'27'agrippes '88' une goutti'8f're rouill'8e'e,'0d
	asc	'qui proteste bruyamment qu'27'elle n'27'a'0d
	asc	'pas sign'8e' pour ca.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ton pied glisse sur une tuile qui,'0d
	asc	'visiblement, avait des projets de'0d
	asc	'retraite anticip'8e'e.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Et apr'8f's une s'8e'rie de contorsions'0d
	asc	'dignes d'27'un ballet tragique, tu te'0d
	asc	'retrouves '88' la case depart. Tu ne'0d
	asc	'touches pas 20.000 Francs.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Juste un peu de poussi'8f're,'0d
	asc	'beaucoup de regrets, et le regard'0d
	asc	'moqueur d'27'un pigeon qui t'27'a vu tomber.'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str800	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Vous vous approchez '88' nouveau du chat'0d
	asc	'Mais ce dernier semble vous dire :'0d
	dfb	ePEN,2
	asc	''0d
	asc	22'Ah... c'27'est ENCORE toi !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais regarde-moi bien :'0d
	asc	''0d
	asc	'J'27'ai le ventre plein, la pelote ne'0d
	asc	'm'27'amuse plus, et mes griffes sont en'0d
	asc	'RTT.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Tu veux quoi, une m'8e'daille ? Un calin ?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'T'27'as eu la pelote, c'27'est d'8e'j'88' plus'0d
	asc	'que ce que la plupart obtiennent.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Maintenant, circule. Le soleil chauffe'0d
	asc	'mon flanc gauche et j'27'ai un rendez-vous'0d
	asc	'avec une sieste de niveau olympique.'220d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str900	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Le chat est l'88'. Immobile.'0d
	asc	'Trop immobile...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Son regard est vide, presque tragique.'0d
	asc	'Son ventre gargouille.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous vous approchez, pris d'27'un '8e'lan de'0d
	asc	'compassion. Mais il ne bouge toujours'0d
	asc	'pas.'0d
	asc	''0d
	asc	'Pas un clignement. Juste ce regard'0d
	asc	'fixe, accusateur, comme s'27'il attendait'0d
	asc	'que vous lui offriez un festin royal.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais vous n'27'avez rien...'0d
	asc	'Rien pour le nourrir...'0d
	asc	'Pas m'90'me une croquette p'8e'rim'8e'e...'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str1100	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Le chat de gauche vous fixe,'0d
	asc	'le regard profond, presque solennel.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Il a l'27'air affam'8e'.'0d
	asc	'Son ventre grogne comme un tambour'0d
	asc	'de guerre miniature.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Ses moustaches fr'8e'missent a chaque'0d
	asc	'oscillation de la jarre que vous avez'0d
	asc	'rapport'8e'e du souk.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Il a flair'8e' le lait '88' l'27'int'8e'rieur, sans'0d
	asc	'l'27'ombre d'27'un doute.'0d
	dfb	ePEN,1
	dfb	eLOCATE,1,17
	asc	'  Lui donnez-vous du lait (O/N) 'a5
	dfb	eEOD

CHAT_str1200	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	asc	'Le chat hume le lait, l'27'air digne,'0d
	asc	'presque hautain.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous lui tendez la jarre.'0d
	asc	'Il s'27'approche, lape avec gr'89'ce...'0d
	asc	'Et dans un soupir de satisfaction,'0d
	asc	'laisse tomber la pelote de laine'0d
	asc	'qu'27'il tenait entre ses griffes.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous la ramassez, triomphant.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Et dans son regard, un '8e'clat malicieux.'0d
	asc	'Ah, si le lait pouvait flatter autant'0d
	asc	'que les mots, vous seriez roi des'0d
	asc	'souks, cher donateur.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Mais vous avez gagn'8e' une pelote.'0d
	asc	'Et lui son repas. Deux esprits rus'8e's,'0d
	asc	'un '8e'change '8e'quitable.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Morale : tout flatteur obtient pelote,'0d
	asc	'pourvu qu'27'il ait du lait !'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str1300	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,2
	asc	''0d
	asc	'Le chat vous regarde, le ventre vide'0d
	asc	'et l'27'espoir bris'8e'. Pas de lait ?'0d
	asc	'Il vous classe dans la cat'8e'gorie :'0d
	dfb	ePEN,1
	asc	'         '22'humains inutiles'220d
	dfb	ePEN,3
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
